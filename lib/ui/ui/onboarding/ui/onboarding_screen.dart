import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/onboarding/bloc/onboarding_cubit.dart';
import 'package:satefy_cage/ui/ui/onboarding/models/onb_pages.dart';
import 'package:satefy_cage/ui/uikit/main_button.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingCubit cubit = OnboardingCubit();
  final PageController pageController = PageController();
  static const Duration duration = Duration(milliseconds: 300);
  static const Curve curve = Curves.fastOutSlowIn;

  OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        bloc: cubit,
        builder: (context, state) => SafeArea(
          top: false,
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    Assets.images.stripes.path,
                    width: 375.w,
                    filterQuality: FilterQuality.high,
                  ),
                  Expanded(
                      child: PageView.builder(
                    itemCount: OnboardingPages.onbScreens.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      cubit.changePage(index: index);
                      // pageController.jumpToPage(index);
                    },
                    itemBuilder: (_, index) =>
                        OnboardingPages.onbScreens[index],
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 600),
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
                                      : () async {
                                          await pageController.previousPage(
                                            duration: duration,
                                            curve: Curves.easeInOut,
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
                                label: 'ДАЛЕЕ',
                                onTap: state.currInd ==
                                        OnboardingPages.onbScreens.length - 1
                                    ? () =>
                                        cubit.navigateToHome(context: context)
                                    : () async {
                                        await pageController.nextPage(
                                          duration: duration,
                                          curve: Curves.linear,
                                        );
                                      },
                                width: state.currInd != 0 ? 155.w : 315.w,
                                type: Type.main,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextButton(
                          onPressed: () =>
                              cubit.navigateToHome(context: context),
                          child: Text(
                            'Пропустить обучение',
                            style: AppTypography.regularStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.w,
                              color: AppColors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0;
                                  i < OnboardingPages.onbScreens.length;
                                  i++)
                                AnimatedOpacity(
                                  opacity: state.currInd == i ? 1.0 : 0.3,
                                  duration: duration,
                                  child: Container(
                                    width: 8.w,
                                    height: 8.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white),
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  // PageView.builder(itemBuilder: itemBuilder)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
