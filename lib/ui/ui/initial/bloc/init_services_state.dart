part of 'init_services_cubit.dart';

enum ScreenState { loading, ready }

class InitServicesState {
  InitServicesState({this.screenState, this.animationDone});

  final ScreenState? screenState;
  final bool? animationDone;

  InitServicesState copyWith({
    ScreenState? newScreenState,
    bool? newAnimationDone,
  }) {
    return InitServicesState(
      screenState: newScreenState ?? screenState,
      animationDone: newAnimationDone ?? animationDone,
    );
  }
}
