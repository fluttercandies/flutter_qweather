package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.air.AirDailyBean;
import com.qweather.sdk.bean.air.AirNowBean;
import com.qweather.sdk.bean.base.Lang;
import com.qweather.sdk.view.QWeather;

import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class AirApi {
    /// 获取实时空气质量
    protected static void getAirNow(Context context, Object arguments, final MethodChannel.Result result) {
        String location = (String) arguments;
        QWeather.OnResultAirNowListener onResultAirNowListener = new QWeather.OnResultAirNowListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getAirNow onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(AirNowBean airNowBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(airNowBean);
                DebugPrint.print("getAirNow onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getAirNow(context, location, Lang.ZH_HANS, onResultAirNowListener);
    }

    /// 获取5天空气质量预报
    protected static void getAir5Day(Context context, Object arguments, final MethodChannel.Result result) {
        String location = (String) arguments;
        QWeather.OnResultAirDailyListener onResultAirDailyListener = new QWeather.OnResultAirDailyListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getAir5Day onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(AirDailyBean airDailyBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(airDailyBean);
                DebugPrint.print("getAir5Day onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getAir5D(context, location, Lang.ZH_HANS, onResultAirDailyListener);
    }
}
