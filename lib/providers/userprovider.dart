import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier {
  String? _name;
  String? _email;
  String? _photo;
  int _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  void plus() {
    _counter++;
    notifyListeners();
  }

  get name => _name ?? '';

  set name(name) {
    _name = name;
    notifyListeners();
  }

  get email => _email ?? '';

  set email(email) {
    _email = email + _counter.toString();
    notifyListeners();
  }

  get photo => _photo;

  set photo(photo) {
    _photo = photo;
    notifyListeners();
  }
}
