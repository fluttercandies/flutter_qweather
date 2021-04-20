package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.base.Lang;
import com.qweather.sdk.bean.base.Unit;
import com.qweather.sdk.bean.weather.WeatherNowBean;
import com.qweather.sdk.view.QWeather;

import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiWeather {
    protected static void getWeatherNow(Context context, Object arguments, final MethodChannel.Result result) {
//        @SuppressWarnings("unchecked")
        String argumentsStr = (String) arguments;
        QWeather.OnResultWeatherNowListener onResultWeatherNowListener = new QWeather.OnResultWeatherNowListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getWeatherNow onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(WeatherNowBean weatherNowBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(weatherNowBean);
                DebugPrint.print("getWeatherNow onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getWeatherNow(context, argumentsStr, Lang.ZH_HANS, Unit.METRIC, onResultWeatherNowListener);
    }
}
