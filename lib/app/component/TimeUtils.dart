import 'package:date_format/date_format.dart';

class TimeUtils {
  //格式化的一些模板
  static final List<String> yyyy_MM_dd = [
    "yyyy",
    "-",
    "mm",
    "-",
    "dd",
  ];
  static final List<String> yyyy_MM_dd2 = [
    "yyyy",
    "年",
    "mm",
    "月",
    "dd",
    "日",
  ];
  static final List<String> yyyy_MM_dd_HH_mm_ss = [
    "yyyy",
    "-",
    "mm",
    "-",
    "dd",
    " ",
    "HH",
    ":",
    "nn",
    ":",
    "ss"
  ];
  static final List<String> yyyy_MM_dd_HH_mm_ss2 = [
    "yyyy",
    "年",
    "mm",
    "月",
    "dd",
    "日",
    " ",
    "HH",
    "时",
    "nn",
    "分",
    "ss",
    "秒"
  ];

  //获取当前时间戳，返回为毫秒
  static int getTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  //时间戳转换为日期并格式化
  static String getDateFromStamp(int timeStamp, List<String> formats) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return formatDate(dateTime, formats);
  }

  //当前日期并格式化
  static String getCurrentDate(List<String> formats) {
    return formatDate(DateTime.now(), formats);
  }

  //string类型日期格式化
  static String formatStringDate(String date, List<String> formats) {
    DateTime dateTime = DateTime.parse(date);
    return formatDate(dateTime, formats);
  }

  //日期转时间戳
  static int getTimeStampByStringDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.millisecondsSinceEpoch;
  }

  //比较前一个日期是否小于后面的日期
  static bool date1Befordate2(String date1, String date2) {
    int timeStamp1 = getTimeStampByStringDate(date1);
    int timeStamp2 = getTimeStampByStringDate(date2);
    if (timeStamp1 >= timeStamp2) {
      return false;
    } else {
      return true;
    }
  }

}