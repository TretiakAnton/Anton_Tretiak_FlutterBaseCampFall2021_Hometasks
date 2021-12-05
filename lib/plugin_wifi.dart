
import 'dart:async';

import 'package:flutter/services.dart';

class PluginWifi {
  static const MethodChannel _channel =
      const MethodChannel('plugin_wifi');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
