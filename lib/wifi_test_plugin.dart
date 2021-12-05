import 'dart:async';

import 'package:flutter/services.dart';

class WifiTestPlugin {
  static const MethodChannel _channel = MethodChannel('battery_test_plugin');
  static const EventChannel _channelEvent =
      EventChannel('battery_test_plugin_evetnChannel');

  WifiTestPlugin() {
    _channel.setMethodCallHandler(methodCallHandler);
  }

  late StreamController<int> streamController;

  @override
  Future<dynamic> methodCallHandler(MethodCall call) {
    return Future<dynamic>(() {
      if (call.method == 'batteryResponse') {
        print('setMethodCallHandler ${call.arguments}');
        streamController.sink.add(call.arguments);
      }
    });
  }

  Future<int?> get getBatteryLevel async {
    final int? value = await _channel.invokeMethod('getBatteryLevel');
    return value;
  }

  Stream<int> get startBatteryListen {
    streamController = StreamController.broadcast();
    _channel.invokeMethod('startBatteryListen');

    return streamController.stream;
  }

  Stream<int>? get getBatteryEvents =>
      _channelEvent.receiveBroadcastStream().map((event) => event);

  Future<bool?> get stopBatteryListen async {
    await streamController.close();
    final bool? result = await _channel.invokeMethod('stopBatteryListen');
    return result;
  }
}
