part of 'info_cubit.dart';

class InfoState {
  InfoState({this.tabInd});

  final int? tabInd;

  InfoState copyWith({
    int? newtabInd,
  }) {
    return InfoState(
      tabInd: newtabInd ?? tabInd,
    );
  }
}
