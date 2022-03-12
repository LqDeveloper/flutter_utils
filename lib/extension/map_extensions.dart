import 'dart:convert';

extension MapExtensions on Map {
  /// 将map转化为json字符串
  String toJsonString() {
    return jsonEncode(this);
  }

  /// 将map转化为json字符串换行
  String getJsonPretty() {
    return const JsonEncoder.withIndent('\t').convert(this);
  }
}
