package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.base.Basin;
import com.qweather.sdk.bean.tropical.StormForecastBean;
import com.qweather.sdk.bean.tropical.StormListBean;
import com.qweather.sdk.bean.tropical.StormTrackBean;
import com.qweather.sdk.view.QWeather;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiTropical {
    /// 台风列表
    protected static void getStormList(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String year = (String) param.get("year");
        String basin = (String) param.get("basin");
        QWeather.OnResultTropicalStormListListener onResultTropicalStormListListener = new QWeather.OnResultTropicalStormListListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getStormList onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(StormListBean stormListBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(stormListBean);
                DebugPrint.print("getStormList onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getStormList(context, year, Basin.valueOf(basin), onResultTropicalStormListListener);
    }

    /// 台风实况和路径
    protected static void getStormTrack(Context context, Object arguments, final MethodChannel.Result result) {
        String stormId = (String) arguments;
        QWeather.OnResultTropicalStormTrackListener onResultTropicalStormTrackListener = new QWeather.OnResultTropicalStormTrackListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getStormTrack onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(StormTrackBean stormTrackBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(stormTrackBean);
                DebugPrint.print("getStormTrack onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getStormTrack(context, stormId, onResultTropicalStormTrackListener);
    }

    /// 台风预报
    protected static void getStormForecast(Context context, Object arguments, final MethodChannel.Result result) {
        String stormId = (String) arguments;
        QWeather.OnResultTropicalStormForecastListener onResultTropicalStormForecastListener = new QWeather.OnResultTropicalStormForecastListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getStormTrack onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(StormForecastBean stormForecastBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(stormForecastBean);
                DebugPrint.print("getStormForecast onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getStormForecast(context, stormId, onResultTropicalStormForecastListener);
    }
}
