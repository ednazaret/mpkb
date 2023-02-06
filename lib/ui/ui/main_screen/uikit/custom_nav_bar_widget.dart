import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/main_screen/ui/main_screen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  const CustomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.w, right: 21.w, top: 9.h, bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          int index = items.indexOf(item);
          return Flexible(
            child: GestureDetector(
              onTap: () {
                if (index == selectedIndex &&
                    context.read<SearchCubit>().state.enableReturning == true) {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: MainScreen(
                            initialPage: index,
                          ),
                          type: PageTransitionType.fade));
                  context
                      .read<SearchCubit>()
                      .returningEnabled(newStatus: false);
                }
                onItemSelected(index);
              },
              child: IconItem(
                item: item,
                isSelected: selectedIndex == index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  final PersistentBottomNavBarItem item;
  final bool isSelected;

  const IconItem({Key? key, required this.item, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61.w,
      height: 46.h,
      alignment: Alignment.center,
      color: AppColors.mainBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          item.icon,
          Material(
            type: MaterialType.transparency,
            child: FittedBox(
              child: Text(
                item.title ?? '',
                style: AppTypography.mediumStyle.copyWith(
                  color: isSelected
                      ? AppColors.white
                      : AppColors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 10.0.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
