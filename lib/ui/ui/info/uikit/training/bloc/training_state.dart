part of 'training_cubit.dart';

class TrainingState {
  TrainingState({this.currInd});

  final int? currInd;

  TrainingState copyWith({
    int? newCurrInd,
  }) {
    return TrainingState(
      currInd: newCurrInd ?? currInd,
    );
  }
}
