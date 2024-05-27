import 'package:flutter/material.dart';

class MainController {
  MainController.__();
  static final MainController _ = MainController.__();
  factory MainController() => _;

  final isDark = ValueNotifier(false);
  final username = ValueNotifier(TextEditingController(text: "test"));
  var listNumber = ValueNotifier([]);

  changeThemeMode() => isDark.value = !isDark.value;

  add() {
    var num = listNumber.value.length + 1;
    listNumber.value = List.from(listNumber.value)..add(num.toString());
  }

  sub() {
    var num = listNumber.value.length;
    listNumber.value = List.from(listNumber.value)..remove(num.toString());
  }
}
