import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHotKeys();
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

Future<void> registerHotKeys() async {
  // for hot reload
  await hotKeyManager.unregisterAll();

  await hotKeyManager.register(
    HotKey(
      key: PhysicalKeyboardKey.keyZ,
      modifiers: [
        HotKeyModifier.control,
        HotKeyModifier.shift,
        HotKeyModifier.alt,
      ],
    ),
    keyDownHandler: (hotkey) async {
      await Process.run(
          '"C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"', []);
    },
  );

  await hotKeyManager.register(
    HotKey(
      key: PhysicalKeyboardKey.keyX,
      modifiers: [
        HotKeyModifier.control,
        HotKeyModifier.shift,
        HotKeyModifier.alt,
      ],
    ),
    keyDownHandler: (hotkey) async {
      await Process.run(
        'cmd.exe',
          ['/c', '"C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"']);
    },
  );

  await hotKeyManager.register(
    HotKey(
      key: PhysicalKeyboardKey.keyG,
      modifiers: [
        HotKeyModifier.control,
        HotKeyModifier.shift,
        HotKeyModifier.alt,
      ],
    ),
    keyDownHandler: (hotkey) {
      Process.run('cmd.exe', ['/c', 'start', 'https://google.com']);
    },
  );
}

