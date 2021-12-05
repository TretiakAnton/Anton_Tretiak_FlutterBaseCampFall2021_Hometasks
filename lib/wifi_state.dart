import 'dart:async';

import 'package:flutter/services.dart';

class WifiState {
  static const MethodChannel _channel = const MethodChannel('wifi_state');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool?> get wifistate async {
    final bool? state = await _channel.invokeMethod('isWifiEnabled');
    return state;
  }
}
