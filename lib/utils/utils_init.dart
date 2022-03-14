import 'package:lq_common_utils/utils/device_utils.dart';
import 'package:lq_common_utils/utils/package_utils.dart';
import 'package:lq_common_utils/utils/sp_utils.dart';

///初始化常用的工具
class UtilsInit {
  static Future initUtils() async {
    await DeviceUtils.initDeviceInfo();
    await PackageUtils.initPackageInfo();
    await SPUtils.initSP();
  }
}
