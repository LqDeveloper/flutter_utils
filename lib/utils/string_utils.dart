abstract class StringUtils {
  ///判断值是否为null
  static bool isNull(String? value) => value == null;

  ///判断字符串或者集合是否为空
  static bool isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  ///判断字符串或者集合是否不为空
  static bool isNotEmpty(dynamic value) {
    return !isEmpty(value);
  }

  ///value 是否有长度属性
  static bool hasLength(dynamic value) {
    return value is Iterable || value is String || value is Map;
  }

  ///判断value是null 或者为空集合或者空字符串
  static bool isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }
    return isEmpty(value);
  }

  ///字符串是否符合正则表达式
  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  ///判断字符串是否为数字（int,double）
  static bool isNum(String value) => num.tryParse(value) is num;

  ///字符串中是否只包含数字
  static bool isNumericOnly(String s) => hasMatch(s, r'^\d+$');

  ///字符串中是否只包含字母
  static bool isAlphabetOnly(String s) => hasMatch(s, r'^[a-zA-Z]+$');

  ///字符串是否包含最少一个大写字母
  static bool hasCapitalLetter(String s) => hasMatch(s, r'[A-Z]');

  ///是否是bool值
  static bool isBool(String value) =>
      (value == 'true' || value == '1' || value == 'false' || value == '0');

  ///文件是否是视频
  static bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();
    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  ///文件是否是图片
  static bool isImage(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  ///文件是否是音频
  static bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  ///文件是否是PPT
  static bool isPPT(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".ppt") || ext.endsWith(".pptx");
  }

  ///文件是否是Word
  static bool isWord(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".doc") || ext.endsWith(".docx");
  }

  ///文件是否是Excel
  static bool isExcel(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".xls") || ext.endsWith(".xlsx");
  }

  ///文件是否是APK
  static bool isAPK(String filePath) {
    return filePath.toLowerCase().endsWith(".apk");
  }

  ///文件是否是PDF
  static bool isPDF(String filePath) {
    return filePath.toLowerCase().endsWith(".pdf");
  }

  ///文件是否是Txt
  static bool isTxt(String filePath) {
    return filePath.toLowerCase().endsWith(".txt");
  }

  ///文件是否是Chm
  static bool isChm(String filePath) {
    return filePath.toLowerCase().endsWith(".chm");
  }

  ///文件是否是Vector
  static bool isVector(String filePath) {
    return filePath.toLowerCase().endsWith(".svg");
  }

  ///文件是否是HTML
  static bool isHTML(String filePath) {
    return filePath.toLowerCase().endsWith(".html");
  }

  ///检验字符串是否是邮箱
  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  ///检验字符串是否是手机号
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  ///字符串是否是中文
  static bool isChinese(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[\u4e00-\u9fa5]+$');
  }

  ///检验字符串是否是MD5
  static bool isMD5(String s) => hasMatch(s, r'^[a-f0-9]{32}$');

  ///检验字符串是否是SHA1编码字符
  static bool isSHA1(String s) =>
      hasMatch(s, r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');

  ///检验字符串是否是SHA256编码字符
  static bool isSHA256(String s) =>
      hasMatch(s, r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');

  ///检验字符串是否是二级制
  static bool isBinary(String s) => hasMatch(s, r'^[0-1]+$');

  ///检验字符串是否是IPV4
  static bool isIPv4(String s) =>
      hasMatch(s, r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  ///检验字符串是否是IPV6
  static bool isIPv6(String s) => hasMatch(s,
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$');

  ///检验字符串是否是表示颜色的字符串
  static bool isHexadecimal(String s) =>
      hasMatch(s, r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  /// 判断字符串是以xx开头
  static bool startsWith(String? str, Pattern prefix, [int index = 0]) {
    return str != null && str.startsWith(prefix, index);
  }

  /// 判断一个字符串以任何给定的前缀开始
  static bool startsWithAny(
    String? str,
    List<Pattern> prefixes, [
    int index = 0,
  ]) {
    return str != null &&
        prefixes.any((prefix) => str.startsWith(prefix, index));
  }

  /// 判断字符串中是否包含xx
  static bool contains(String? str, Pattern searchPattern,
      [int startIndex = 0]) {
    return str != null && str.contains(searchPattern, startIndex);
  }

  /// 判断一个字符串是否包含任何给定的搜索模式
  static bool containsAny(
    String? str,
    List<Pattern> searchPatterns, [
    int startIndex = 0,
  ]) {
    return str != null &&
        searchPatterns.any((prefix) => str.contains(prefix, startIndex));
  }

  /// 使用点缩写字符串
  static String? abbreviate(String? str, int maxWidth, {int offset = 0}) {
    if (str == null) {
      return null;
    } else if (str.length <= maxWidth) {
      return str;
    } else if (offset < 3) {
      return '${str.substring(offset, (offset + maxWidth) - 3)}...';
    } else if (maxWidth - offset < 3) {
      return '...${str.substring(offset, (offset + maxWidth) - 3)}';
    }
    return '...${str.substring(offset, (offset + maxWidth) - 6)}...';
  }

  /// 比较两个字符串是否相同
  static int compare(String? str1, String? str2) {
    if (str1 == str2) {
      return 0;
    }
    if (str1 == null || str2 == null) {
      return str1 == null ? -1 : 1;
    }
    return str1.compareTo(str2);
  }

  /// 比较两个长度一样的字符串有几个字符不同
  static int hammingDistance(String str1, String str2) {
    if (str1.length != str2.length) {
      throw const FormatException('Strings must have the same length');
    }
    var l1 = str1.runes.toList();
    var l2 = str2.runes.toList();
    var distance = 0;
    for (var i = 0; i < l1.length; i++) {
      if (l1[i] != l2[i]) {
        distance++;
      }
    }
    return distance;
  }

  /// 每隔 x位 加 pattern。比如用来格式化银行卡
  static String formatDigitPattern(String? text,
      {int digit = 4, String pattern = ' '}) {
    if (isEmpty(text)) {
      return "";
    }
    text = text!.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
      return '${match.group(0)}$pattern';
    });
    if (text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String? text,
      {int digit = 4, String pattern = ' '}) {
    if (isEmpty(text)) {
      return "";
    }
    String temp = reverse(text!);
    temp = formatDigitPattern(temp, digit: digit, pattern: pattern);
    temp = reverse(temp);
    return temp;
  }

  /// 每隔4位加空格
  static String formatSpace4(String? text) {
    return formatDigitPattern(text);
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  static String formatComma3(Object? num) {
    if (num == null) {
      return "";
    }
    return formatDigitPatternEnd(num.toString(), digit: 3, pattern: ',');
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。double型。
  static String formatDoubleComma3(Object? num,
      {int digit = 3, String pattern = ','}) {
    if (num == null) {
      return "";
    }
    List<String> list = num.toString().split('.');
    String left =
        formatDigitPatternEnd(list[0], digit: digit, pattern: pattern);
    String right = list[1];
    return '$left.$right';
  }

  /// 隐藏手机号中间n位
  static String hideNumber(String? phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    if (isEmpty(phoneNo)) {
      return "";
    }
    return phoneNo!.replaceRange(start, end, replacement);
  }

  /// 替换字符串中的数据
  static String replace(String? text, Pattern from, String replace) {
    if (isEmpty(text)) {
      return "";
    }
    return text!.replaceAll(from, replace);
  }

  /// 按照正则切割字符串
  static List<String> split(String? text, Pattern pattern) {
    if (isEmpty(text)) {
      return [];
    }
    return text!.split(pattern);
  }

  /// 反转字符串
  static String reverse(String? text) {
    if (isEmpty(text)) {
      return '';
    }
    int length = text?.length ?? 0;
    StringBuffer sb = StringBuffer();
    for (int i = length - 1; i >= 0; i--) {
      var codeUnitAt = text?.codeUnitAt(i) ?? 0;
      sb.writeCharCode(codeUnitAt);
    }
    return sb.toString();
  }
}
