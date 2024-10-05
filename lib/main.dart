import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:process_run/shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // for hot reload
  await hotKeyManager.unregisterAll();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

void registerHotKeys() async {
  await hotKeyManager.register(
    HotKey(
      key: PhysicalKeyboardKey.f24,
      modifiers: [
        HotKeyModifier.control,
        HotKeyModifier.shift,
        HotKeyModifier.alt,
        HotKeyModifier.meta,
      ],
    ),
    keyUpHandler: (hotkey) async {
      var shell = Shell();
      await shell.run('chrome.exe');
    },
  );
}
