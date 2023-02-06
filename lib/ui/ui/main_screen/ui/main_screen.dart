import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/favorite/ui/favorite_screen.dart';
import 'package:satefy_cage/ui/ui/home/ui/home_screen.dart';
import 'package:satefy_cage/ui/ui/info/ui/info_screen.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/main_screen/uikit/custom_nav_bar_widget.dart';
import 'package:satefy_cage/ui/ui/passports/ui/passport_screen.dart';
import 'package:satefy_cage/ui/ui/videos/ui/videos_screen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Главный экран с BottomNavBar'ом
class MainScreen extends StatefulWidget {
  final int? initialPage;

  const MainScreen({Key? key, this.initialPage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState();

  final double _iconSize = 27.w;
  late PersistentTabController controller;

  @override
  void initState() {
    controller = PersistentTabController(initialIndex: widget.initialPage ?? 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.mainBlue,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: false,
          child: PersistentTabView.custom(
            context,
            controller: controller,
            screens: _buildScreens(
              onHome: () => _onHome(context),
            ),
            backgroundColor: AppColors.mainBlue,
            items: _buildItems(),
            itemCount: 5,
            confineInSafeArea: false,
            resizeToAvoidBottomInset: false,
            hideNavigationBarWhenKeyboardShows: false,
            popAllScreensOnTapOfSelectedTab: true,
            navBarHeight: 56.5.h,
            hideNavigationBar: false,
            customWidget: (navbarEss) => CustomNavBarWidget(
              items: _buildItems(),
              onItemSelected: (int value) => value == 4
                  ? Navigator.push(
                      context,
                      PageTransition(
                        child: InfoScreen(
                          onBack: () => Navigator.pop(context),
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    )
                  : controller.index == value &&
                          context.read<SearchCubit>().state.enableReturning ==
                              false
                      ? null
                      : setState(() {
                          controller.index = value;
                          context.read<SearchCubit>().clearQuery();
                        }),
              selectedIndex: controller.index,
            ),
          ),
        ),
      ),
    );
  }

  ///Возвращающая функция
  void _onHome(BuildContext context) => Navigator.push(
        context,
        PageTransition(
            child: const MainScreen(), type: PageTransitionType.leftToRight),
      );

  ///Bottom Navigation Bar Items
  List<PersistentBottomNavBarItem> _buildItems() {
    TextStyle style(bool isSelected) => AppTypography.regularStyle.copyWith(
          fontSize: 10.w,
          fontWeight: isSelected ? FontWeight.w400 : FontWeight.w500,
        );

    Color colorSelector(int index) {
      return controller.index == index
          ? AppColors.white
          : AppColors.white.withOpacity(0.7);
    }

    return [
      PersistentBottomNavBarItem(
        icon: Assets.images.passportsOutlined.svg(
          width: _iconSize,
          color: colorSelector(0),
        ),
        inactiveIcon: Assets.images.passportsOutlined.svg(
          width: _iconSize,
          color: colorSelector(0),
        ),
        title: 'Паспорта',
        contentPadding: 0.0,
        textStyle: style(controller.index == 0),
      ),
      PersistentBottomNavBarItem(
        icon: Assets.images.favoriteOutlined.svg(
          width: _iconSize - 2,
          color: colorSelector(1),
        ),
        inactiveIcon: Assets.images.favoriteOutlined.svg(
          width: _iconSize - 2,
          color: colorSelector(1),
        ),
        contentPadding: 0.0,
        title: 'Избранное',
        textStyle: style(controller.index == 1),
      ),
      PersistentBottomNavBarItem(
        icon: Assets.images.homeOutlined.svg(
          width: _iconSize,
          color: colorSelector(2),
        ),
        inactiveIcon: Assets.images.homeOutlined.svg(
          width: _iconSize,
          color: colorSelector(2),
        ),
        title: 'Главная',
        contentPadding: 0.0,
        textStyle: style(controller.index == 2),
      ),
      PersistentBottomNavBarItem(
        icon: Assets.images.playOutlined.svg(
          width: _iconSize,
          color: colorSelector(3),
        ),
        inactiveIcon: Assets.images.playOutlined.svg(
          width: _iconSize,
          color: colorSelector(3),
        ),
        title: 'Видео',
        contentPadding: 0.0,
        textStyle: style(controller.index == 3),
      ),
      PersistentBottomNavBarItem(
        icon: Assets.images.infoOutlined.svg(
          width: _iconSize,
          color: colorSelector(4),
        ),
        inactiveIcon: Assets.images.infoOutlined.svg(
          width: _iconSize,
          color: colorSelector(4),
        ),
        title: 'Информация',
        contentPadding: 0.0,
        textStyle: style(controller.index == 4),
      ),
    ];
  }

  List<Widget> _buildScreens({required VoidCallback onHome}) => [
        PassportsScreen(
          onHome: () {
            context.read<SearchCubit>().clearQuery();
            onHome();
          },
          onTapSearch: () => context.read<SearchCubit>().enableSearch('Home'),
        ),
        FavoriteScreen(
          onHome: onHome,
        ),
        HomeScreen(
          onTapSearch: () => context.read<SearchCubit>().enableSearch('Home'),
          onBtnTapped: (value) => controller.jumpToTab(value),
        ),
        VideosScreen(
          onHome: () {
            context.read<SearchCubit>().clearQuery();
            onHome();
          },
        ),
        InfoScreen(
          onBack: onHome,
        ),
      ];
}
