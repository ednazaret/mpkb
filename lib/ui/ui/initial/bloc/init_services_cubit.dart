import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:satefy_cage/ui/ui/main_screen/ui/main_screen.dart';
import 'package:satefy_cage/ui/ui/onboarding/ui/onboarding_screen.dart';

part 'init_services_state.dart';

///State-manager для начального экрана
class InitServicesCubit extends Cubit<InitServicesState> {
  InitServicesCubit()
      : super(InitServicesState(screenState: ScreenState.loading));

  ///Меняет состояние в зависимости от степени подгрузки данных
  void changeScreenState(
      {required ScreenState newState, required BuildContext context}) {
    emit(state.copyWith(newScreenState: newState));
    if (state.screenState == ScreenState.ready) {
      navigateToHome(context: context);
    }
  }

  ///Меняет состояние, когда анимация уже закончилась
  void changeAnimationState(
      {required bool newAnimState, required BuildContext context}) {
    emit(state.copyWith(newAnimationDone: newAnimState));
    if (state.screenState == ScreenState.ready && state.animationDone == true) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        navigateToHome(context: context);
      });
    }
  }

  ///Навигация
  void navigateToHome({required BuildContext context}) {
    if (state.screenState == ScreenState.ready
        // && state.animationDone == true
        ) {
      Navigator.push(
          context,
          PageTransition(
              child: Hive.box<bool>('onboardingSeen').isEmpty
                  ? OnboardingScreen()
                  : const MainScreen(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 500)));
    }
  }
}
