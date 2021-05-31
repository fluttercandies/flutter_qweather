package com.fluttercandies.flutter_qweather

import android.content.Context
import androidx.annotation.NonNull
import com.qweather.sdk.view.HeConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterQweatherPlugin */
class FlutterQweatherPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.fluttercandies.qweather")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            MethodConstants.GetPlatformVersion -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
            MethodConstants.SetDebug -> setDebug(call.arguments, result)
            MethodConstants.Init -> init(call.arguments, result)
            MethodConstants.GeoCityLookup -> ApiGeo.geoCityLookup(context, call.arguments, result)
            MethodConstants.GetGeoTopCity -> ApiGeo.getGeoTopCity(context, call.arguments, result)
            MethodConstants.GeoPoiLookup -> ApiGeo.geoPoiLookup(context, call.arguments, result)
            MethodConstants.GeoPoiRangeLookup -> ApiGeo.geoPoiRangeLookup(context, call.arguments, result)
            MethodConstants.GetWeatherNow -> ApiWeather.getWeatherNow(context, call.arguments, result)
            MethodConstants.GetWeatherDaily -> ApiWeather.getWeatherDaily(context, call.arguments, result)
            MethodConstants.GetWeatherHourly -> ApiWeather.getWeatherHourly(context, call.arguments, result)
            MethodConstants.GetWeatherMinuteLy -> ApiWeather.getWeatherMinuteLy(context, call.arguments, result)
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }


    private fun setDebug(arguments: Any, result: Result) {
        DebugPrint.setDebug(arguments as Boolean)
        result.success(true)
    }

    private fun init(arguments: Any?, result: Result) {
        val argumentsMap = arguments as HashMap<*, *>
        val publicId = argumentsMap["publicId"] as String
        val key = argumentsMap["key"] as String
        val debug = argumentsMap["debug"] as Boolean
        val biz = argumentsMap["biz"] as Boolean
        DebugPrint.setDebug(debug)
        HeConfig.init(publicId, key)
        if (biz) HeConfig.switchToBizService() else HeConfig.switchToDevService()
        result.success(true)
    }
}
