import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/home/uikit/home_btn.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/search_screen/ui/search_screen.dart';
import 'package:satefy_cage/ui/uikit/search_textfield.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

///Экран "Главная"
class HomeScreen extends StatefulWidget {
  final Function onBtnTapped;
  final Function onTapSearch;

  const HomeScreen({
    Key? key,
    required this.onBtnTapped,
    required this.onTapSearch,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (_, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 47,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SearchTextField(
                        onTap: () => widget.onTapSearch(),
                        controller: controller,
                        query: context.read<SearchCubit>().state.query,
                        onChange: context.read<SearchCubit>().onTextChanged,
                        onClear: context.read<SearchCubit>().clearQuery,
                        onEdited: context.read<SearchCubit>().disableSearch,
                      ),
                    ),
                  ],
                ),
              ),
              context.read<SearchCubit>().checkSearch()
                  ? SearchScreen(
                      query: context.read<SearchCubit>().state.query,
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.images.mainlogo.path,
                            width: 200.w,
                            height: 43.h,
                          ),
                          const SizedBox(
                            height: 47,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                            ),
                            child: Column(
                              children: [
                                HomeButton(
                                  onTap: () => widget.onBtnTapped(0),
                                  pathToAsset:
                                      Assets.images.passportsFilled.path,
                                  label: 'Паспорта',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: HomeButton(
                                    onTap: () => widget.onBtnTapped(1),
                                    pathToAsset:
                                        Assets.images.favoriteFilled.path,
                                    label: 'Избранное',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: HomeButton(
                                        onTap: () => widget.onBtnTapped(3),
                                        pathToAsset:
                                            Assets.images.playFilled.path,
                                        label: 'Видео',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: HomeButton(
                                        onTap: () => widget.onBtnTapped(4),
                                        pathToAsset:
                                            Assets.images.infoFilled.path,
                                        label: 'Информация',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(Assets.images.homestripes.path,
                              width: double.infinity),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
