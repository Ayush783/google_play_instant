package com.example.google_play_instant

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import com.google.android.gms.instantapps.InstantApps
import com.google.android.gms.instantapps.PackageManagerCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


/** GooglePlayInstantPlugin */
class GooglePlayInstantPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var packageManager : PackageManagerCompat
  private lateinit var applicationContext : Context
  private lateinit var activity: Activity

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "google_play_instant")
    applicationContext = flutterPluginBinding.getApplicationContext()
    packageManager = InstantApps.getPackageManagerCompat(applicationContext)
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
        "isInstantApp" -> {
          var isInstantApp = packageManager.isInstantApp
          result.success(isInstantApp)
        }
        "showInstallPrompt" -> {
          val postInstall = Intent(Intent.ACTION_MAIN)
            .addCategory(Intent.CATEGORY_DEFAULT)
            .setPackage(applicationContext.packageName)

          // The request code is passed to startActivityForResult().
          InstantApps.showInstallPrompt(activity,
            postInstall, 0,  null)
        }
        "getInstantAppData" -> {

        }
        else -> {
          result.notImplemented()
        }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(activityPluginBinding: ActivityPluginBinding) {
    activity = activityPluginBinding.getActivity()
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(activityPluginBinding: ActivityPluginBinding) {
    activity = activityPluginBinding.getActivity()
  }

  override fun onDetachedFromActivity() {
    // TODO: your plugin is no longer associated with an Activity. Clean up references.
  }
}
