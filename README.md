flutter 常用工具类

## AppWebView 要求Android SDK版本

```groovy 
android {
    defaultConfig {
        minSdkVersion 19
    }
}
```

## 扩展 extension

1. BuildContext 的extension
2. DateTime的extension
3. List的extension
4. Map的extension
5. String的extension

## 常用工具类 utils

1. CalculateUtils 计算文本尺寸
2. ColorUtils 颜色转换
3. RandomUtils 随机工具类
4. ScreenInfo 屏幕信息
5. StringUtils 字符串工具类
6. SystemUtils copy,打开，关闭键盘
7. FileUtils 文件管理
8. SPUtils SharedPreferences封装类

## 常用Widget

1. AfterLayoutMixin 布局完成后回调
2. BottomNavBar Material风格底部导航
3. BottomNavPage 带底部导航的Page
4. KeepAliveWidget 实现了AutomaticKeepAliveClientMixin的StatefulWidget
5. LayoutLogPrint 打印布局信息
6. LoadingStatusWidget 包含loading, error, completed状态的Widget
7. AppWebView 加载url,html String, html文件的WebView