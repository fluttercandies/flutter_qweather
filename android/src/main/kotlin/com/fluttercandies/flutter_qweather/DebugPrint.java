package com.fluttercandies.flutter_qweather;

/// 调试打印
public class DebugPrint {
    private static boolean _debug = false;


    public static void setDebug(boolean debug) {
        if (_debug != debug){
            System.out.println("com.fluttercandies.qweather: 设置调试模式：" + debug);
            _debug = debug;
        }
    }

    public static void print(String value) {
        if (_debug) System.out.println("com.fluttercandies.qweather: " + value);
    }
}
