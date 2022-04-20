package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.history.HistoricalAirBean;
import com.qweather.sdk.bean.history.HistoryWeatherBean;
import com.qweather.sdk.view.QWeather;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiHistory {
    /// 获取历史天气
    protected static void getHistoricalWeather(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String date = (String) param.get("date");
        QWeather.OnResultWeatherHistoricalBeanListener onResultWeatherHistoricalBeanListener = new QWeather.OnResultWeatherHistoricalBeanListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getHistoricalWeather onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(HistoryWeatherBean historyWeatherBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(historyWeatherBean);
                DebugPrint.print("getHistoricalWeather onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getHistoricalWeather(context, location, date, onResultWeatherHistoricalBeanListener);
    }

    /// 获取空气质量
    protected static void getHistoricalAir(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String date = (String) param.get("date");
        QWeather.OnResultAirHistoricalBeanListener onResultAirHistoricalBeanListener = new QWeather.OnResultAirHistoricalBeanListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getHistoricalAir onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(HistoricalAirBean historicalAirBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(historicalAirBean);
                DebugPrint.print("getHistoricalAir onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getHistoricalAir(context, location, date, onResultAirHistoricalBeanListener);
    }
}
