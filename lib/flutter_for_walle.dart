
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterForWalle {
  static const MethodChannel _channel =
      const MethodChannel('kaige.com/flutter_for_walle');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<String> getChannel({String androidDefaultChannel, String iosDefaultChannel}) async{
    final String channel = await _channel.invokeMethod('getChannel',<String,dynamic>{
      'androidChannel': androidDefaultChannel,
      'iosChannel': iosDefaultChannel,
    });
    return channel;
  }
}
