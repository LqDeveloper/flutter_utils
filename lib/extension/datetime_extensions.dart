//     格式模式	说明
//     d	月中的某一天。一位数的日期没有前导零。
//     dd	月中的某一天。一位数的日期有一个前导零。
//     ddd	周中某天的缩写名称，在 AbbreviatedDayNames 中定义。
//     dddd	周中某天的完整名称，在 DayNames 中定义。
//     M	月份数字。一位数的月份没有前导零。
//     MM	月份数字。一位数的月份有一个前导零。
//     MMM	月份的缩写名称，在 AbbreviatedMonthNames 中定义。
//     MMMM	月份的完整名称，在 MonthNames 中定义。
//     y	不包含纪元的年份。如果不包含纪元的年份小于 10，则显示不具有前导零的年份。
//     yy	不包含纪元的年份。如果不包含纪元的年份小于 10，则显示具有前导零的年份。
//     yyyy	包括纪元的四位数的年份。
//     gg	时期或纪元。如果要设置格式的日期不具有关联的时期或纪元字符串，则忽略该模式。
//     h	12 小时制的小时。一位数的小时数没有前导零。
//     hh	12 小时制的小时。一位数的小时数有前导零。
//     H	24 小时制的小时。一位数的小时数没有前导零。
//     HH	24 小时制的小时。一位数的小时数有前导零。
//     m	分钟。一位数的分钟数没有前导零。
//     mm	分钟。一位数的分钟数有一个前导零。
//     s	秒。一位数的秒数没有前导零。
//     ss	秒。一位数的秒数有一个前导零。
//     f	秒的小数精度为一位。其余数字被截断。
//     ff	秒的小数精度为两位。其余数字被截断。
//     fff	秒的小数精度为三位。其余数字被截断。
//     ffff	秒的小数精度为四位。其余数字被截断。
//     fffff	秒的小数精度为五位。其余数字被截断。
//     ffffff	秒的小数精度为六位。其余数字被截断。
//     fffffff	秒的小数精度为七位。其余数字被截断。
//     t	在 AMDesignator 或 PMDesignator 中定义的 AM/PM 指示项的第一个字符（如果存在）。
//     tt	在 AMDesignator 或 PMDesignator 中定义的 AM/PM 指示项（如果存在）。
//     z	时区偏移量（“+”或“-”后面仅跟小时）。一位数的小时数没有前导零。例如，太平洋标准时间是“-8”。
//     zz	时区偏移量（“+”或“-”后面仅跟小时）。一位数的小时数有前导零。例如，太平洋标准时间是“-08”。
//     zzz	完整时区偏移量（“+”或“-”后面跟有小时和分钟）。一位数的小时数和分钟数有前导零。例如，太平洋标准时间是“-08:00”。
//     :	在 TimeSeparator 中定义的默认时间分隔符。
//     /	在 DateSeparator 中定义的默认日期分隔符。
//     % c	其中 c 是格式模式（如果单独使用）。如果格式模式与原义字符或其他格式模式合并，则可以省略“%”字符。
//     \ c	其中 c 是任意字符。照原义显示字符。若要显示反斜杠字符，请使用“\\”。

abstract class DateFormats {
  static const String full = 'yyyy-MM-dd HH:mm';
  static const String zhFull = 'yyyy年MM月dd日 HH时mm分';
}

extension DateTimeUtils on DateTime {
  ///根据字符串创建时间
  static DateTime? getDateTime(String dateStr, {bool isUtc = false}) {
    DateTime? dateTime = DateTime.tryParse(dateStr);
    return isUtc ? dateTime?.toUtc() : dateTime?.toLocal();
  }

  ///当前时间的毫秒数
  static int nowMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  ///根据字符串获取毫秒
  static int millisecondsByStr(String dateStr, {bool isUtc = false}) {
    return getDateTime(dateStr, isUtc: isUtc)?.millisecondsSinceEpoch ?? 0;
  }

  static String formatDateString(String dateStr,
      {bool isUtc = false, String format = DateFormats.full}) {
    DateTime? time = getDateTime(dateStr, isUtc: isUtc);
    if (time == null) {
      return "";
    }
    return formatDate(time, format: format);
  }

  /// format 转换格式(已提供常用格式 DateFormats，可以自定义格式：'yyyy/MM/dd HH:mm:ss')
  static String formatDate(DateTime? dateTime,
      {String format = DateFormats.full}) {
    if (dateTime == null) return "";
    if (format.contains('yy')) {
      String year = dateTime.year.toString();
      if (format.contains('yyyy')) {
        format = format.replaceAll('yyyy', year);
      } else {
        format = format.replaceAll(
            'yy', year.substring(year.length - 2, year.length));
      }
    }
    format = _comFormat(dateTime.month, format, 'M', 'MM');
    format = _comFormat(dateTime.day, format, 'd', 'dd');
    format = _comFormat(dateTime.hour, format, 'H', 'HH');
    format = _comFormat(dateTime.minute, format, 'm', 'mm');
    format = _comFormat(dateTime.second, format, 's', 'ss');
    format = _comFormat(dateTime.millisecond, format, 'S', 'SSS');
    return format;
  }

  /// com format.
  static String _comFormat(
      int value, String format, String single, String full) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }
}
