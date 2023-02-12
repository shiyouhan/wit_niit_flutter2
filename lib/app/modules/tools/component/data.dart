import 'package:flutter/material.dart';



/**
 * 智慧校园数据类
 */

class SmartData{
IconData icon;
String name;
bool status;

SmartData(this.icon, this.name, this.status);
}
/**
 * 微盘类
 */

class CloudDisk{
  String name;
  String dataTime;

  CloudDisk(this.name, this.dataTime);
}
///微盘颜色数据
List<Color> cloudColor=[Colors.indigo,Colors.yellow,Colors.redAccent,Colors.tealAccent];
///微盘数据
List<CloudDisk> cloudDataList=[
  CloudDisk("应用程序","2022年11月12日"),
  CloudDisk("应用程序1","2022年11月12日"),
  CloudDisk("应用程序2","2022年11月12日"),
  CloudDisk("应用程序3","2022年11月12日"),
  CloudDisk("应用程序4","2022年11月12日"),
  CloudDisk("应用程序5","2022年11月12日"),
  CloudDisk("应用程序6","2022年11月12日"),
];
///智慧校园数据
List<SmartData> smartDataList=[
  SmartData(Icons.adb,"安卓",false),
  SmartData(Icons.adb,"安卓1",false),
  SmartData(Icons.adb,"安卓2",false),
  SmartData(Icons.adb,"安卓3",false),
  SmartData(Icons.adb,"安卓4",false),
  SmartData(Icons.adb,"安卓5",false),
  SmartData(Icons.adb,"安卓6",false),
];