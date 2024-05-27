import 'package:flutter/material.dart';
import 'package:value_state_management/controller/main_controller.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final c = MainController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("page 2"),
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
            ValueListenableBuilder(
              valueListenable: c.username,
              builder: (context, value, child) => Text(value.text),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("goto page 1"),
            ),
            Row(
              children: [
                FilledButton(
                    onPressed: () {
                      c.add();
                    },
                    child: const Text("add")),
                FilledButton(
                    onPressed: () {
                      c.sub();
                    },
                    child: const Text("sub")),
              ],
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: c.listNumber,
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) => Text(value[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
