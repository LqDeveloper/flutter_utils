import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        if (kDebugMode) {
          print('${tag ?? key ?? child}: $constraints');
        }
        return true;
      }());
      return child;
    });
  }
}
