import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wifi_state/wifi_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isWifiEnable = false;
  WifiState wifiState = WifiState();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isWifiEnabled;
    try {
      isWifiEnabled = await WifiState.wifistate ?? false;
    } on PlatformException {
      isWifiEnabled = false;
    }
    if (!mounted) return;

    setState(() {
      _isWifiEnable = isWifiEnabled;
    });
  }

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
              Text('wifi connect is $_isWifiEnable \n'),
              StreamBuilder<bool>(
                  stream: wifiState.getWifiEvents,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return Text('${snapshot.data}\n');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
