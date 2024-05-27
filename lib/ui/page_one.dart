import 'package:flutter/material.dart';
import 'package:value_state_management/controller/main_controller.dart';
import 'package:value_state_management/ui/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final c = MainController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("page 1"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Change theme mode"),
            ValueListenableBuilder(
              valueListenable: c.isDark,
              builder: (context, value, child) => Switch(
                value: value,
                onChanged: (value) => c.changeThemeMode(),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: c.username.value,
                onChanged: (value) {},
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageTwo(),
                    ));
              },
              child: const Text("goto page 2"),
            )
          ],
        ),
      ),
    );
  }
}
