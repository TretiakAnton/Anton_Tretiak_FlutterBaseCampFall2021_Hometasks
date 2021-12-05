import 'dart:async';

import 'package:flutter/services.dart';

class WifiState {
  static const MethodChannel _channel = const MethodChannel('wifi_state');
  static const EventChannel _channelEvent =
      EventChannel('wifi_state_plugin_eventChannel');

  static Future<bool?> get wifistate async {
    final bool? state = await _channel.invokeMethod('getWifiState');
    return state;
  }

  WifiTestPlugin() async {
    _channel.setMethodCallHandler(methodCallHandler);
  }

  late StreamController<bool> streamController;

  @override
  Future<dynamic> methodCallHandler(MethodCall call) {
    return Future<dynamic>(() {
      if (call.method == 'wifiResponse') {
        print('setMethodCallHandler ${call.arguments}');
        streamController.sink.add(call.arguments);
      }
    });
  }

  Stream<int>? get getWifiEvents =>
      _channelEvent.receiveBroadcastStream().map((event) => event);
}
