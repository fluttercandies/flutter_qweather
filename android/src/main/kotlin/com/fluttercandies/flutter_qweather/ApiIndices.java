package com.fluttercandies.flutter_qweather;

import android.content.Context;

import com.google.gson.Gson;
import com.qweather.sdk.bean.IndicesBean;
import com.qweather.sdk.bean.base.IndicesType;
import com.qweather.sdk.bean.base.Lang;
import com.qweather.sdk.view.QWeather;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class ApiIndices {
    /// 获取1天生活指数
    protected static void getIndices1Day(Context context, Object arguments, final MethodChannel.Result result) {
        getIndices("getIndices1Day", context, arguments, result);
    }

    /// 获取3天生活指数
    protected static void getIndices3Day(Context context, Object arguments, final MethodChannel.Result result) {
        getIndices("getIndices3Day", context, arguments, result);
    }

    private static void getIndices(final String name, Context context, Object arguments, final MethodChannel.Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> param = (HashMap<String, Object>) arguments;
        String location = (String) param.get("location");
        @SuppressWarnings("unchecked")
        List<String> indicesTypes = (List<String>) param.get("indicesTypes");
        List<IndicesType> indicesTypesTmp = new ArrayList<>();
        assert indicesTypes != null;
        for (String type : indicesTypes) {
            switch (type) {
                case "SPT":
                    indicesTypesTmp.add(IndicesType.SPT);
                    break;
                case "CW":
                    indicesTypesTmp.add(IndicesType.CW);
                    break;
                case "DRSG":
                    indicesTypesTmp.add(IndicesType.DRSG);
                    break;
                case "FIS":
                    indicesTypesTmp.add(IndicesType.FIS);
                    break;
                case "UV":
                    indicesTypesTmp.add(IndicesType.UV);
                    break;
                case "TRAV":
                    indicesTypesTmp.add(IndicesType.TRAV);
                    break;
                case "AG":
                    indicesTypesTmp.add(IndicesType.AG);
                    break;
                case "COMF":
                    indicesTypesTmp.add(IndicesType.COMF);
                    break;
                case "FLU":
                    indicesTypesTmp.add(IndicesType.FLU);
                    break;
                case "AP":
                    indicesTypesTmp.add(IndicesType.AP);
                    break;
                case "AC":
                    indicesTypesTmp.add(IndicesType.AC);
                    break;
                case "GL":
                    indicesTypesTmp.add(IndicesType.GL);
                    break;
                case "MU":
                    indicesTypesTmp.add(IndicesType.MU);
                    break;
                case "DC":
                    indicesTypesTmp.add(IndicesType.DC);
                    break;
                case "PTFC":
                    indicesTypesTmp.add(IndicesType.PTFC);
                    break;
                case "SPI":
                    indicesTypesTmp.add(IndicesType.SPI);
                    break;
                case "SKI":
                    indicesTypesTmp.add(IndicesType.SK);
                    break;
                default:
                    indicesTypesTmp = Collections.singletonList(IndicesType.ALL);
                    break;
            }
            if (indicesTypesTmp.contains(IndicesType.ALL)) break;
        }
        QWeather.OnResultIndicesListener onResultIndicesListener = new QWeather.OnResultIndicesListener() {
            @Override
            public void onError(Throwable throwable) {
                DebugPrint.print(name + " onError: " + throwable.getLocalizedMessage());
                result.success(null);
            }

            @Override
            public void onSuccess(IndicesBean indicesBean) {
                Gson gson = new Gson();
                String jsonStr = gson.toJson(indicesBean);
                DebugPrint.print(name + " onSuccess: " + jsonStr);
                result.success(gson.fromJson(jsonStr, Map.class));
            }
        };
        if (name.equals("getIndices1Day")) {
            QWeather.getIndices1D(context, location, Lang.ZH_HANS, indicesTypesTmp, onResultIndicesListener);
        } else {
            QWeather.getIndices3D(context, location, Lang.ZH_HANS, indicesTypesTmp, onResultIndicesListener);
        }
    }
}
