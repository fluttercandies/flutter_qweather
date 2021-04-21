package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.MinutelyBean;
import com.qweather.sdk.bean.weather.WeatherDailyBean;
import com.qweather.sdk.bean.weather.WeatherHourlyBean;
import com.qweather.sdk.bean.weather.WeatherNowBean;
import com.qweather.sdk.view.QWeather;

import java.util.HashMap;
import java.util.Map;
import io.flutter.plugin.common.MethodChannel;

public class ApiWeather {
    /// 获取实时天气
    protected static void getWeatherNow(Context context, Object arguments, final MethodChannel.Result result) {
        String location = (String) arguments;
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
        QWeather.getWeatherNow(context, location, onResultWeatherNowListener);
    }

    /// 获取逐天预报
    protected static void getWeatherDaily(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        Integer dailyForecast = (Integer) param.get("daily");
        assert dailyForecast != null;
        QWeather.OnResultWeatherDailyListener onResultWeatherDailyListener = new QWeather.OnResultWeatherDailyListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getWeatherDaily onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(WeatherDailyBean weatherDailyBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(weatherDailyBean);
                DebugPrint.print("getWeatherDaily onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        if (dailyForecast == 3) {
            QWeather.getWeather3D(context, location, onResultWeatherDailyListener);
        } else if (dailyForecast == 7) {
            QWeather.getWeather7D(context, location, onResultWeatherDailyListener);
        } else if (dailyForecast == 10) {
            QWeather.getWeather10D(context, location, onResultWeatherDailyListener);
        } else if (dailyForecast == 15) {
            QWeather.getWeather15D(context, location, onResultWeatherDailyListener);
        }
    }

    /// 获取逐时预报
    protected static void getWeatherHourly(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        Integer hourlyForecast = (Integer) param.get("hourly");
        assert hourlyForecast != null;
        QWeather.OnResultWeatherHourlyListener onResultWeatherHourlyListener = new QWeather.OnResultWeatherHourlyListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getWeatherHourly onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(WeatherHourlyBean weatherHourlyBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(weatherHourlyBean);
                DebugPrint.print("getWeatherHourly onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        if (hourlyForecast == 24) {
            QWeather.getWeather24Hourly(context, location, onResultWeatherHourlyListener);
        } else if (hourlyForecast == 72) {
            QWeather.getWeather72Hourly(context, location, onResultWeatherHourlyListener);
        } else if (hourlyForecast == 168) {
            QWeather.getWeather168Hourly(context, location, onResultWeatherHourlyListener);
        }
    }

    /// 获取中国地区未来2小时内每5分钟降水
    protected static void getWeatherMinuteLy(Context context, Object arguments, final MethodChannel.Result result) {
        String location = (String) arguments;
        QWeather.OnResultMinutelyListener onResultMinutelyListener = new QWeather.OnResultMinutelyListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getWeatherMinuteLy onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(MinutelyBean minutelyBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(minutelyBean);
                DebugPrint.print("getWeatherMinuteLy onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getMinuteLy(context, location, onResultMinutelyListener);
    }
}
