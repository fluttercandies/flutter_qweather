package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.base.Lang;
import com.qweather.sdk.bean.base.Range;
import com.qweather.sdk.bean.base.Type;
import com.qweather.sdk.bean.geo.GeoBean;
import com.qweather.sdk.bean.geo.GeoPoiBean;
import com.qweather.sdk.view.QWeather;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiGeo {
    /// 城市信息查询
    protected static void geoCityLookup(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String range = (String) param.get("range");
        Integer number = (Integer) param.get("number");
        assert range != null && number != null;
        QWeather.OnResultGeoListener onResultGeoListener = new QWeather.OnResultGeoListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("geoCityLookup onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(GeoBean geoBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoBean);
                jsonStr = jsonStr.replace("locationBean", "locations");
                DebugPrint.print("geoCityLookup onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getGeoCityLookup(context, location, Range.valueOf(range.toUpperCase()), number, Lang.ZH_HANS, onResultGeoListener);
    }

    /// 热门城市查询
    protected static void getGeoTopCity(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String range = (String) param.get("range");
        Integer number = (Integer) param.get("number");
        assert range != null && number != null;
        QWeather.OnResultGeoListener onResultGeoListener = new QWeather.OnResultGeoListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("getGeoTopCity onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(GeoBean geoBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoBean);
                jsonStr = jsonStr.replace("locationBean", "locations");
                DebugPrint.print("getGeoTopCity onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getGeoTopCity(context, number, Range.valueOf(range.toUpperCase()), Lang.ZH_HANS, onResultGeoListener);
    }

    /// POI信息搜索
    protected static void geoPoiLookup(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String city = (String) param.get("city");
        String type = (String) param.get("type");
        Integer number = (Integer) param.get("number");
        assert type != null && number != null;
        QWeather.OnResultGeoPoiListener onResultGeoPoiListener = new QWeather.OnResultGeoPoiListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("geoPoiLookup onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(GeoPoiBean geoPoiBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoPoiBean);
                jsonStr = jsonStr.replace("poiList", "locations");
                DebugPrint.print("geoPoiLookup onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getGeoPoiLookup(context, location, city, number, Type.valueOf(type.toUpperCase()), Lang.ZH_HANS, onResultGeoPoiListener);
    }

    /// POI范围搜索
    protected static void geoPoiRangeLookup(Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        String type = (String) param.get("type");
        Integer radius = (Integer) param.get("radius");
        Integer number = (Integer) param.get("number");
        assert type != null && number != null && radius != null;
        QWeather.OnResultGeoPoiListener onResultGeoPoiListener = new QWeather.OnResultGeoPoiListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print("geoPoiRangeLookup onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(GeoPoiBean geoPoiBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(geoPoiBean);
                jsonStr = jsonStr.replace("poiList", "locations");
                DebugPrint.print("geoPoiRangeLookup onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        QWeather.getGeoPoiRange(context, location, radius, number, Type.valueOf(type.toUpperCase()), Lang.ZH_HANS, onResultGeoPoiListener);
    }
}
