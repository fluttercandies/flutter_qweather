package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.sunmoon.MoonBean;
import com.qweather.sdk.bean.sunmoon.SolarElevationAngleBean;
import com.qweather.sdk.bean.sunmoon.SunBean;
import com.qweather.sdk.view.QWeather;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiAstronomy {
    /// 获取日出日落
    protected static void getSun(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String date = (String) param.get("date");
        QWeather.OnResultSunListener onResultSunListener = new QWeather.OnResultSunListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getSun onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(SunBean sunBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(sunBean);
                DebugPrint.print("getSun onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getSun(context, location, date, onResultSunListener);
    }

    /// 获取月升月落月相
    protected static void getMoon(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String date = (String) param.get("date");
        QWeather.OnResultMoonListener onResultMoonListener = new QWeather.OnResultMoonListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getMoon onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(MoonBean moonBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(moonBean);
                DebugPrint.print("getMoon onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getMoon(context, location, date, onResultMoonListener);
    }

    /// 获取太阳高度角
    protected static void getSolarElevationAngle(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String date = (String) param.get("date");
        String time = (String) param.get("time");
        String tz = (String) param.get("tz");
        String alt = (String) param.get("alt");
        QWeather.OnResultSolarElevationAngleListener onResultMoonListener = new QWeather.OnResultSolarElevationAngleListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getSolarElevationAngle onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(SolarElevationAngleBean solarElevationAngleBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(solarElevationAngleBean);
                DebugPrint.print("getSolarElevationAngle onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getSolarElevationAngle(context, location, date, time, tz, alt, onResultMoonListener);
    }
}
