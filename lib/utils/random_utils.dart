import 'dart:math';

Random _random = Random();

/// 随机工具类
class RandomUtils {
  /// 生成一个表示十六进制颜色的随机整数
  static int randomColor() {
    var hex = "0xFF";
    for (int i = 0; i < 3; i++) {
      hex += _random.nextInt(255).toRadixString(16).padLeft(2, '0');
    }
    return int.parse(hex);
  }

  /// 生成指定长度或随机长度的随机字符串
  static String randomString(int length) {
    if (length <= 0) {
      return "";
    }
    var codeUnits = List.generate(length, (index) {
      return _random.nextInt(33) + 89;
    });

    return String.fromCharCodes(codeUnits);
  }

  /// 在开始和结束之间生成一个随机数
  static int randInt(int end, {int start = 0}) {
    return _random.nextInt(end) + start;
  }

  /// 从列表中返回一个随机元素。
  static T? randomElement<T>(List<T> items) {
    if (items.isEmpty) {
      return null;
    }
    return items[randInt(items.length)];
  }
}
