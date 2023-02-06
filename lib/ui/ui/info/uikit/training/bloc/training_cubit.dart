import 'package:bloc/bloc.dart';
import 'package:satefy_cage/ui/ui/onboarding/models/onb_pages.dart';

part 'training_state.dart';

class TrainingCubit extends Cubit<TrainingState> {
  TrainingCubit() : super(TrainingState(currInd: 0));

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

  void prevPage() {
    if ((state.currInd ?? 0) > 0) {
      emit(state.copyWith(newCurrInd: (state.currInd ?? 0) - 1));
    }
  }
}
