part of 'contacts_cubit.dart';

class ContactsState {
  ContactsState({this.copied});

  bool? copied = false;

  ContactsState copyWith({bool? copied}) {
    return ContactsState(copied: copied ?? this.copied);
  }
}
