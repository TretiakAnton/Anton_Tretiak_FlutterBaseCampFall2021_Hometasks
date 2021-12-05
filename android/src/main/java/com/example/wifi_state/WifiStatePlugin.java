package com.example.wifi_state;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.EventChannel;


/** WifiStatePlugin */

public class WifiStatePlugin implements FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler {

  private MethodChannel channel;
  private EventChannel wifiStateChangeEventChannel;
  private Context context;
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "wifi_state");
    channel.setMethodCallHandler(this);
    wifiStateChangeEventChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), "wifi_state_plugin_eventChannel");
    wifiStateChangeEventChannel.setStreamHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }
  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getWifiState")) {
      boolean wifiEnabled = isWifiEnabled(context);
      result.success(wifiEnabled);
    } else {
      result.notImplemented();
    }
  }
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
  @Override
  public void onListen(Object arguments, final EventChannel.EventSink events) {
    IntentFilter filter = new IntentFilter();
    filter.addAction(ConnectivityManager.CONNECTIVITY_ACTION);
    filter.addAction("android.net.wifi.STATE_CHANGE");
    context.registerReceiver(new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        System.out.println(":onReceive");
        ConnectivityManager conMan = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo netInfo = conMan.getActiveNetworkInfo();
        if (netInfo != null && netInfo.getType() == ConnectivityManager.TYPE_WIFI) {
          sendNotification("Wifi state","Changed to: on");
          events.success(true);
        } else {
          sendNotification("Wifi state","Changed to: on");
          events.success(false);
        }
      }
    }, filter);
  }
  @Override
  public void onCancel(Object arguments) {
  }
  private boolean isWifiEnabled(Context context) {
    WifiManager wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
    return wifiManager.isWifiEnabled();
  }
  private void sendNotification(String title, String message) {
    NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
    String CHANNEL_ID = "my_channel_01";
    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
      CharSequence name = "my_channel";
      String Description = "This is my channel";
      int importance = NotificationManager.IMPORTANCE_HIGH;
      NotificationChannel mChannel = new NotificationChannel(CHANNEL_ID, name, importance);
      mChannel.setDescription(Description);
      mChannel.enableLights(true);
      mChannel.setLightColor(Color.RED);
      mChannel.enableVibration(true);
      mChannel.setVibrationPattern(new long[]{100, 200, 300, 400, 500, 400, 300, 200, 400});
      mChannel.setShowBadge(false);
      notificationManager.createNotificationChannel(mChannel);
    }
    NotificationCompat.Builder builder = new NotificationCompat.Builder(context, CHANNEL_ID)
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setContentTitle(title)
            .setContentText(message)
            .setPriority(NotificationCompat.PRIORITY_DEFAULT);
    notificationManager.notify(1, builder.build());
  }
}
