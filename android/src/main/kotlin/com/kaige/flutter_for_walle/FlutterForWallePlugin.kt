package com.kaige.flutter_for_walle

import android.content.Context
import androidx.annotation.NonNull
import com.meituan.android.walle.WalleChannelReader

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** FlutterForWallePlugin */
class FlutterForWallePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kaige.com/flutter_for_walle")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method){
      "getChannel" -> {
        val channel = WalleChannelReader.getChannel(context)
        if (channel != null && channel.isNotBlank()){
          result.success(channel)
        }else{
          result.success(call.argument("androidChannel") ?: "Android")
        }
      }
      "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
