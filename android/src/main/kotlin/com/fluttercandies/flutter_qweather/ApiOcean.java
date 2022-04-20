package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.ocean.CurrentsBean;
import com.qweather.sdk.bean.ocean.TideBean;
import com.qweather.sdk.view.QWeather;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiOcean {
    /// 获取潮汐
    protected static void getOceanTide(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String date = (String) param.get("date");
        QWeather.OnResultOceanTideListener onResultOceanTideListener = new QWeather.OnResultOceanTideListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getOceanTide onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(TideBean tideBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(tideBean);
                DebugPrint.print("getOceanTide onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getOceanTide(context, location, date, onResultOceanTideListener);
    }

    /// 获取潮流
    protected static void getOceanCurrents(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String date = (String) param.get("date");
        QWeather.OnResultOceanCurrentsListener onResultOceanCurrentsListener = new QWeather.OnResultOceanCurrentsListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getOceanCurrents onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(CurrentsBean currentsBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(currentsBean);
                DebugPrint.print("getOceanCurrents onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getOceanCurrents(context, location, date, onResultOceanCurrentsListener);
    }
}
