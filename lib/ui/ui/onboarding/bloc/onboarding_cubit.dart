import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:satefy_cage/ui/ui/main_screen/ui/main_screen.dart';
import 'package:satefy_cage/ui/ui/onboarding/models/onb_pages.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(currInd: 0));

  void nextPage() {
    if ((state.currInd ?? 0) < OnboardingPages.onbScreens.length - 1) {
      emit(state.copyWith(
        newCurrInd: (state.currInd ?? 0) + 1,
      ));
    }
  }

  void changePage({required int index}) {
    emit(state.copyWith(newCurrInd: index));
  }

  void navigateToHome({required BuildContext context}) {
    Navigator.push(
        context,
        PageTransition(
            child: const MainScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 200)));
    Hive.box<bool>('onboardingSeen').put('onboardingSeen', true);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  void prevPage() {
    if ((state.currInd ?? 0) > 0) {
      emit(state.copyWith(newCurrInd: (state.currInd ?? 0) - 1));
    }
  }
}
