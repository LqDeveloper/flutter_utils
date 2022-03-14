import 'package:package_info_plus/package_info_plus.dart';

class PackageUtils {
  static late PackageInfo _packageInfo;

  ///在使用之前必须初始化
  static Future initPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  static String get appName => _packageInfo.appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  static String get packageName => _packageInfo.packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, `versionName` on Android.
  static String get version => _packageInfo.version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  static String get buildNumber => _packageInfo.buildNumber;

  /// The build signature. Empty string on iOS, signing key signature (hex) on Android.
  static String get buildSignature => _packageInfo.buildSignature;
}
