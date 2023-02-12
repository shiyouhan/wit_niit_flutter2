import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseStyle {
  /// 字号
  static TextStyle fs12G = TextStyle(fontSize: 12.sp, color: Colors.grey);
  static TextStyle fs14G = TextStyle(fontSize: 14.sp, color: Colors.grey);
  static TextStyle fs16 = TextStyle(fontSize: 16.sp);
  static TextStyle fs16W = TextStyle(fontSize: 16.sp, color: Colors.white);
  static TextStyle fs20W = TextStyle(fontSize: 20.sp, color: Colors.white);
  static TextStyle fs18Wb = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle fs26b =
      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold);

  /// 样式
  static TextStyle wdStyle = TextStyle(color: Colors.pink, fontSize: 30.sp);

//  正文字体
  static TextStyle testFont = TextStyle(color: Colors.grey);
  static TextStyle testFontBold = TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18);
}
