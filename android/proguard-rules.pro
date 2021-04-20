# 排除okhttp
-dontwarn com.squareup.**
-dontwarn okio.**
-keep public class org.codehaus.* { *; }
-keep public class java.nio.* { *; }

# 排除QWeather
-dontwarn com.qweather.sdk.**
-keep class com.qweather.sdk.** { *;}
