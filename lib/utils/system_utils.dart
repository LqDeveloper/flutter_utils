import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef CopyCallBack = void Function(bool result);

/// 系统工具类
abstract class SystemUtils {
  /// 拷贝文本内容到剪切板
  static bool copyToClipboard(String? text,
      {String? successMessage, BuildContext? context}) {
    if (text != null && text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: text));
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(successMessage ?? "copy success")));
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /// 拷贝文本内容到剪切板
  static void copyToClipboardWithCallBack(String? text, CopyCallBack callBack) {
    if (text != null && text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: text));
      callBack(true);
    } else {
      callBack(false);
    }
  }

  /// 隐藏软键盘，具体可看：TextInputChannel
  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// 展示软键盘，具体可看：TextInputChannel
  static void showKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.show');
  }

  /// 清除数据
  static void clearClientKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.clearClient');
  }
}
