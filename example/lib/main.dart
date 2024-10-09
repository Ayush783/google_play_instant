import 'package:flutter/material.dart';

import 'package:google_play_instant/google_play_instant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String isInstantApp = '-------';
  final _googlePlayInstantPlugin = GooglePlayInstant();

  @override
  void initState() {
    super.initState();
    isInstantAppGetter();
  }

  isInstantAppGetter() async {
    isInstantApp = (await _googlePlayInstantPlugin.isInstantApp()).toString();
    setState(() {});
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $isInstantApp\n'),
              TextButton(
                  onPressed: () {
                    _googlePlayInstantPlugin.showInstallPrompt();
                  },
                  child: const Text('Install'))
            ],
          ),
        ),
      ),
    );
  }
}
