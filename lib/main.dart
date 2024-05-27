import 'package:flutter/material.dart';
import 'package:value_state_management/controller/main_controller.dart';
import 'package:value_state_management/ui/page_one.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final c = MainController();
    return ValueListenableBuilder(
        valueListenable: c.isDark,
        builder: (context, value, builder) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            themeMode: c.isDark.value ? ThemeMode.dark : ThemeMode.light,
            home: const PageOne(),
          );
        });
  }
}
