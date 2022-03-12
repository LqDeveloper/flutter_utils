import 'dart:convert';

import 'package:lq_common_utils/utils/string_utils.dart';

extension StringExtensions on String {
  ///将字符串转为int
  int get toInt => int.parse(this);

  ///将字符串转为double
  double get toDouble => double.parse(this);

  ///将字符串转为Uri
  ///
  ///Uri的基本形式 [scheme:]scheme-specific-part[#fragment]
  ///
  ///再进一步划分可以是 [scheme:][//host:port][path][?query][#fragment]
  ///path可以有多个，每个用/连接，
  ///例如
  /// scheme://authority/path1/path2/path3?query#fragment
  /// query参数可以带有对应的值，也可以不带，如果带对应的值用=表示，如:
  /// scheme://authority/path1/path2/path3?id = 1#fragment，这里有一个参数id，它的值是1
  /// query参数可以有多个，每个用&连接
  /// scheme://authority/path1/path2/path3?id = 1&name = mingming&old#fragment
  /// 这里有三个参数：
  ///  参数1：id，其值是:1
  ///  参数2：name，其值是:mingming
  ///  参数3：old，没有对它赋值，所以它的值是null
  ///  除了scheme、authority是必须要有的，其它的几个path、query、fragment，它们每一个可以选择性的要或不要，但顺序不能变，比如：
  ///  其中"path"可不要：scheme://authority?query#fragment
  ///  其中"path"和"query"可都不要：scheme://authority#fragment
  ///  其中"query"和"fragment"可都不要：scheme://authority/path
  ///  "path","query","fragment"都不要：scheme://authority
  ///
  ///其中authority,又可以分为host:port的形式，即再次划分后是这样的：
  ///[scheme:][//host:port][path][?query][#fragment]
  ///例如
  /// http://www.abcd.com:8080/yourpath/fileName.htm?stove=10&path=32&id=4#harvic
  /// scheme:匹对上面的两个Uri标准形式，很容易看出在：前的部分是scheme，所以这个Uri字符串的sheme是：http
  /// scheme-specific-part:很容易看出scheme-specific-part是包含在scheme和fragment之间的部分，也就是包括第二部分的[//authority][path][?query]这几个小部分
  /// ，所在这个Uri字符串的scheme-specific-part是：//www.abcd.com:8080/yourpath/fileName.htm?stove=10&path=32&id=4 ，
  /// 注意要带上//，因为除了[scheme:]和[#fragment]部分全部都是scheme-specific-part，当然包括最前面的//；
  /// fragment:这个是更容易看出的，因为在最后用#分隔的部分就是fragment，所以这个Uri的fragment是：harvic
  /// 下面就是对scheme-specific-part进行拆分了；
  /// 在scheme-specific-part中，最前端的部分就是authority，？后面的部分是query，中间的部分就是path
  /// authority：很容易看出scheme-specific-part最新端的部分是：www.abcd.com:8080
  /// query:在scheme-specific-part中，？后的部分为：stove=10&path=32&id=4
  /// path:在**query:**在scheme-specific-part中，除了authority和query其余都是path的部分:/yourpath/fileName.htm
  /// 又由于authority又一步可以划分为host:port形式，其中host:port用冒号分隔，冒号前的是host，冒号后的是port，所以：
  /// host:www.java2s.com
  /// port:8080
  Uri? get toUri {
    try {
      return Uri.parse(this);
    } catch (_) {
      return null;
    }
  }

  ///是否是绝对路径
  bool get isAbsolute {
    try {
      return toUri?.isAbsolute ?? false;
    } catch (_) {
      return false;
    }
  }

  /// 获取Uri中的scheme(如 http)
  String get scheme {
    try {
      return toUri?.scheme ?? "";
    } catch (_) {
      return "";
    }
  }

  /// 获取Uri中的authority(如 http://www.abcd.com:8080 中的 www.abcd.com:8080)
  String get authority {
    try {
      return toUri?.authority ?? "";
    } catch (_) {
      return "";
    }
  }

  /// 获取Uri中的authority中的userInfo (如 http://user:password@host:80/path 中的 user:password)
  String get userInfo {
    try {
      return toUri?.userInfo ?? "";
    } catch (_) {
      return "";
    }
  }

  /// 获取Uri中的host 如果该字符串不是Url 将抛出 FormatException
  String get host {
    try {
      return toUri?.host ?? "";
    } catch (_) {
      return "";
    }
  }

  /// 获取Uri中的port 如果该字符串不是Url 将抛出 FormatException
  int get port {
    try {
      return toUri?.port ?? 0;
    } catch (_) {
      return 0;
    }
  }

  /// 获取Uri中的path 如果该字符串不是Url 将抛出 FormatException
  String get path {
    try {
      return toUri?.path ?? "";
    } catch (_) {
      return "";
    }
  }

  /// 获取Uri中的query 如果该字符串不是Url 将抛出 FormatException
  String get query {
    try {
      return toUri?.query ?? "";
    } catch (_) {
      return "";
    }
  }

  /// 获取Uri中的fragment 如果该字符串不是Url 将抛出 FormatException
  String get fragment {
    try {
      return toUri?.fragment ?? "";
    } catch (_) {
      return "";
    }
  }

  /// 获取Uri中的pathSegments 如果该字符串不是Url 将抛出 FormatException
  List<String> get pathSegments {
    try {
      return toUri?.pathSegments ?? [];
    } catch (_) {
      return [];
    }
  }

  /// 获取Uri中的queryParameters 如果该字符串不是Url 将抛出 FormatException
  Map<String, String> get queryParameters {
    try {
      return toUri?.queryParameters ?? {};
    } catch (_) {
      return {};
    }
  }

  /// 获取Uri中的queryParametersAll 如果该字符串不是Url 将抛出 FormatException
  Map<String, List<String>> get queryParametersAll {
    try {
      return toUri?.queryParametersAll ?? {};
    } catch (_) {
      return {};
    }
  }

  ///判断字符串是否为数字（int,double）
  bool get isNum => StringUtils.isNum(this);

  ///字符串中是否只包含数字
  bool get isNumericOnly => StringUtils.isNumericOnly(this);

  ///字符串中是否只包含字母
  bool get isAlphabetOnly => StringUtils.isAlphabetOnly(this);

  ///字符串是否包含最少一个大写字母
  bool get hasCapitalLetter => StringUtils.hasCapitalLetter(this);

  ///是否是bool值
  bool get isBool => StringUtils.isBool(this);

  ///文件是否是视频
  bool get isVideo => StringUtils.isVideo(this);

  ///文件是否是图片
  bool get isImage => StringUtils.isImage(this);

  ///文件是否是音频
  bool get isAudio => StringUtils.isAudio(this);

  ///文件是否是PPT
  bool get isPPT => StringUtils.isPPT(this);

  ///文件是否是Word
  bool get isWord => StringUtils.isWord(this);

  ///文件是否是Excel
  bool get isExcel => StringUtils.isExcel(this);

  ///文件是否是APK
  bool get isAPK => StringUtils.isAPK(this);

  ///文件是否是PDF
  bool get isPDF => StringUtils.isPDF(this);

  ///文件是否是Txt
  bool get isTxt => StringUtils.isTxt(this);

  ///文件是否是Chm
  bool get isChm => StringUtils.isChm(this);

  ///文件是否是Vector
  bool get isVector => StringUtils.isVector(this);

  ///文件是否是HTML
  bool get isHTML => StringUtils.isHTML(this);

  ///检验字符串是否是邮箱
  bool get isEmail => StringUtils.isEmail(this);

  ///检验字符串是否是手机号
  bool get isPhoneNumber => StringUtils.isPhoneNumber(this);

  ///检验字符串是否是MD5
  bool get isMD5 => StringUtils.isMD5(this);

  ///检验字符串是否是SHA1编码字符
  bool get isSHA1 => StringUtils.isSHA1(this);

  ///检验字符串是否是SHA256编码字符
  bool get isSHA256 => StringUtils.isSHA256(this);

  ///检验字符串是否是二级制
  bool get isBinary => StringUtils.isBinary(this);

  ///检验字符串是否是IPV4
  bool get isIPv4 => StringUtils.isIPv4(this);

  ///检验字符串是否是IPV6
  bool get isIPv6 => StringUtils.isIPv6(this);

  ///检验字符串是否是表示颜色的字符串
  bool get isHexadecimal => StringUtils.isHexadecimal(this);

  List<int> get bytes => utf8.encode(this);

  ///Base64编码
  String get encodedBase64 {
    List<int> bytes = utf8.encode(this);
    return base64Encode(bytes);
  }

  ///Base64解码
  String get decodeBase64 {
    List<int> bytes = base64Decode(this);
    return String.fromCharCodes(bytes);
  }

  ///将字符串转为数组
  List get jsonList {
    return json.decode(this);
  }

  ///将字符串转为Map
  Map<String, dynamic> get jsonMap {
    return json.decode(this);
  }

  /// 从提供的字符串中删除所有空格。
  String get removeWhiteSpace {
    return replaceAll(RegExp(r"\s+"), "");
  }
}
