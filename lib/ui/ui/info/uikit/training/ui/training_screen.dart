import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/ui/ui/onboarding/bloc/onboarding_cubit.dart';
import 'package:satefy_cage/ui/ui/onboarding/models/onb_pages.dart';
import 'package:satefy_cage/ui/uikit/main_button.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

///Экран с онбордингом
class TrainingScreen extends StatelessWidget {
  final OnboardingCubit cubit = OnboardingCubit();
  final PageController pageController = PageController();
  static const Duration duration = Duration(milliseconds: 400);
  static const pageDuration = Duration(milliseconds: 350);

  TrainingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        bloc: cubit,
        builder: (context, state) => Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: PageView.builder(
                  itemCount: OnboardingPages.infoScreens.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    cubit.changePage(index: index);
                  },
                  itemBuilder: (_, index) => OnboardingPages.infoScreens[index],
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                            opacity: state.currInd != 0 ? 1.0 : 0.0,
                            child: AnimatedSize(
                              duration: duration,
                              reverseDuration: duration,
                              curve: Curves.fastOutSlowIn,
                              child: MainButton(
                                label: 'НАЗАД',
                                onTap: state.currInd == 0
                                    ? null
                                    : () {
                                        pageController.previousPage(
                                          duration: pageDuration,
                                          curve: Curves.linear,
                                        );
                                      },
                                width: state.currInd != 0 ? 155.w : 0.w,
                              ),
                            ),
                          ),
                          AnimatedSize(
                            duration: duration,
                            reverseDuration: duration,
                            curve: Curves.fastOutSlowIn,
                            alignment: Alignment.centerLeft,
                            child: MainButton(
                              label: state.currInd == 6 ? "В НАЧАЛО" : 'ДАЛЕЕ',
                              onTap: state.currInd ==
                                      OnboardingPages.info.length - 1
                                  ? () {
                                      pageController.jumpTo(0);
                                    }
                                  : () async {
                                      await pageController.nextPage(
                                        duration: pageDuration,
                                        curve: Curves.linear,
                                      );
                                    },
                              width: state.currInd != 0 ? 155.w : 315.w,
                              type: Type.main,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 110.w,
                          right: 110.w,
                          top: 24.h,
                          bottom: 20.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0;
                                i < OnboardingPages.infoScreens.length;
                                i++)
                              AnimatedOpacity(
                                opacity: state.currInd == i ? 1.0 : 0.3,
                                duration: duration,
                                child: Container(
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
