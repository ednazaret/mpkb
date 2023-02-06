import 'package:bloc/bloc.dart';
import 'package:clipboard/clipboard.dart';
import 'package:satefy_cage/ui/ui/info/uikit/contacts/ui/contacts_screen.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsState());

  Future<void> copyData() async {
    await FlutterClipboard.copy(ContactsData.email);
    emit(state.copyWith(copied: true));
    Future.delayed(const Duration(seconds: 2))
        .then((value) => emit(state.copyWith(copied: false)));
  }
}
