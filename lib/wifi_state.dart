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

  Stream<bool>? get getWifiEvents =>
      _channelEvent.receiveBroadcastStream().map((event) => event);
}
