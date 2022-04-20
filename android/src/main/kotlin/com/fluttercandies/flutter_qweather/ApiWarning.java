package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.WarningBean;
import com.qweather.sdk.bean.WarningListBean;
import com.qweather.sdk.bean.base.Lang;
import com.qweather.sdk.bean.base.Range;
import com.qweather.sdk.view.QWeather;

import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiWarning {
    /// 获取灾害预警
    protected static void getWarning(Context context, Object arguments, final MethodChannel.Result result) {
        String location = (String) arguments;
        QWeather.OnResultWarningListener onResultWarningListener = new QWeather.OnResultWarningListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getWarning onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(WarningBean warningBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(warningBean);
                DebugPrint.print("getWarning onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getWarning(context, location, onResultWarningListener);
    }

    /// 获取灾害预警列表
    protected static void getWarningList(Context context, Object arguments, final MethodChannel.Result result) {
        String range = (String) arguments;
        QWeather.OnResultWarningListListener onResultWarningListListener = new QWeather.OnResultWarningListListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getWarningList onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(WarningListBean warningListBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(warningListBean);
                DebugPrint.print("getWarningList onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getWarningList(context, Range.valueOf(range.toUpperCase()), onResultWarningListListener);
    }
}
