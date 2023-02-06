import 'package:bloc/bloc.dart';

part 'info_state.dart';

///Cubit экрана информации
class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoState());

  void changeTab({required int index}) {
    emit(state.copyWith(newtabInd: index));
  }
}
