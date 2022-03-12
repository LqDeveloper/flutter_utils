import 'dart:convert';

extension ListExtensions on List {
  /// 将list转化为json字符串
  String toJsonString() {
    return jsonEncode(this);
  }

  /// 将list转化为json字符串，换行
  String getJsonPretty() {
    return const JsonEncoder.withIndent('\t').convert(this);
  }

}
