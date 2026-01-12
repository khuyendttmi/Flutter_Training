import 'dart:math';

import 'package:flutter_training/khuyendt/riverpod/contact/contact_model.dart';
import 'package:riverpod/legacy.dart';

class ContactNotifier extends StateNotifier<List<Contact>> {
  ContactNotifier() : super([]);

  void add(String name, String numberPhone) {
    final contact = Contact(
      id: Random().nextDouble().toString(),
      name: name,
      numberPhone: numberPhone,
    );
    state = [...state, contact];
  }

  void update(String id, String name, String numberPhone) {
    state = state.map((contact) {
      if(contact.id == id){
        return contact.copyWith(name: name, numberPhone: numberPhone);
      }
      return contact;
    },).toList();
  }

  void remove(String id) {
    state = state.where((contact) => contact.id != id).toList();
  }
}

final contactProvider = StateNotifierProvider<ContactNotifier, List<Contact>>(
  (ref) => ContactNotifier(),
);
