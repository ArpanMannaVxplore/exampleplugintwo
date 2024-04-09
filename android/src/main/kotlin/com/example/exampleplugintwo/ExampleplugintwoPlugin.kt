package com.example.exampleplugintwo

import android.content.Context
import android.content.Intent
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.util.Log

/** ExampleplugintwoPlugin */
class ExampleplugintwoPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var myContext: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "exampleplugintwo")
    channel.setMethodCallHandler(this)
    myContext = flutterPluginBinding.applicationContext
  }


  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "openPage") {
      val type: String? = call.arguments as? String
      Log.d("ExamplePluginTwo", "Type received: $type") // Log the value of 'type'
      if (type == "SETTINGS") {
        val intent = Intent(Settings.ACTION_SETTINGS)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        myContext.startActivity(intent)
        result.success("Settings page opened successfully")
      } else {
        result.error("INVALID_TYPE", "Invalid page type", null)
      }
    } else {
      result.notImplemented()
    }
  }



  override fun onDetachedFromEngine( binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
