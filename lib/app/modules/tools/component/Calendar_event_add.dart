import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Calendar_event_add extends StatefulWidget {
  @override
  State<Calendar_event_add> createState() => _Calendar_event_addState();
}

class _Calendar_event_addState extends State<Calendar_event_add> {
  static DateTime NOW = DateTime.now();

  //min time
  final DateTime MIN_TIME = DateTime(NOW.year, NOW.month, NOW.day);

  //max time
  final DateTime MAX_TIME = DateTime(NOW.year + 2, NOW.month, NOW.day);
  late TextEditingController _titleController;
  late TextEditingController _desController;
  late TextEditingController _locationController;

  //参会人
  late List members = [
    "https://pixiuosses.oss-cn-shanghai.aliyuncs.com/3.png",
    "https://pixiuosses.oss-cn-shanghai.aliyuncs.com/3.png",
    "https://pixiuosses.oss-cn-shanghai.aliyuncs.com/3.png",
    "https://pixiuosses.oss-cn-shanghai.aliyuncs.com/3.png",
    "https://pixiuosses.oss-cn-shanghai.aliyuncs.com/3.png"
  ];

  //开始时间
  late DateTime start_time = DateTime.now();

  //时长
  late String long_time = "1";

  //全天
  late bool full_day = false;

  //附件
  late String accessory = "";

  //提醒
  late int tip = 15;

  //重复
  late bool repeat = false;

  //加入
  late bool join_in = false;

  //设置时长
  List<String> SET_TIME = ['0.5', '1', '2', '3'];

  //设置提醒时长 -1无，0日程开始，5分钟，15分钟
  Map<int, String> SET_TIP_TIME = {
    -1: "无",
    0: "日程开始时",
    5: "5分钟前",
    15: "15分钟前",
    60: "1小时前",
    1440: "1天前"
  };

  //是否重复提醒
  List<bool> SET_REPEAT = [true, false];

  //主动加入
  List<bool> SET_JOIN = [true, false];

  //日期选择器
  _SelectData() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.now(),
      locale: LocaleType.zh,
      minTime: MIN_TIME,
      maxTime: MAX_TIME,
      onConfirm: (date) {
        setState(() {
          start_time = date;
        });
      },
    );
  }

  //时间选择器
  _SelectTime() {
    DatePicker.showTime12hPicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.now(),
      locale: LocaleType.zh,
      onConfirm: (date) {
        setState(() {
          start_time = DateTime(start_time.year, start_time.month,
              start_time.day, date.hour, date.minute);
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _titleController = TextEditingController()..text = "";
    _desController = TextEditingController()..text = "";
    _locationController = TextEditingController()..text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              children: <Widget>[
                schedule_page(),
                select_timer_page(),
                description_page(),
                repeat_set_page(),
                SizedBox(
                  height: 10.h,
                ),
                save_button_page()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _container(Widget child,
      {double vertical = 0,
      double horizontal = 0,
      Color color = Colors.white}) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w),
      decoration: BoxDecoration(color: color),
      child: child,
    );
  }

  ///日程 参与人
  Widget schedule_page() {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          cursorColor: Colors.black87,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: '日程，活动主题',
            hintStyle: TextStyle(color: Colors.black26),
          ),
        ),

        ///参与人
        _container(
            ListTile(
              leading: Text("添加参与人"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: members
                    .asMap()
                    .keys
                    .map((e) => Container(
                          height: 30.h,
                          width: 30.w,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              image: DecorationImage(
                                  image: NetworkImage(members[e]),
                                  fit: BoxFit.cover)),
                        ))
                    .toList()
                    .sublist(0, 3),
              ),
              trailing: Container(
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(5.r))),
                child: Icon(
                  Icons.add,
                  size: 20.sp,
                ),
              ),
            ),
            vertical: 5),
      ],
    );
  }

  ///开始，时长，全天
  Widget select_timer_page() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListTile(
            leading: Text('开始'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.r),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: GestureDetector(
                      onTap: _SelectData,
                      child: Text(
                        '${start_time.month}月${start_time.day}日',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    )),
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(5.r))),
              child: GestureDetector(
                onTap: _SelectTime,
                child: Text(
                  "${start_time.hour.toString().padLeft(2, "0")}:${start_time.minute.toString().padLeft(2, "0")}",
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
            ),
          ),
        ),

        ///时长
        _container(GestureDetector(
          onTap: () {
            setState(() {
              Get.bottomSheet(Container(
                child: Wrap(
                  children: SET_TIME
                      .asMap()
                      .keys
                      .map((index) => _container(ListTile(
                            title: Text("${SET_TIME[index]}"),
                            onTap: () {
                              setState(() {
                                long_time = SET_TIME[index];
                                Navigator.pop(context);
                              });
                            },
                          )))
                      .toList(),
                ),
              ));
            });
          },
          child: ListTile(
            leading: Text("时长"),
            trailing: Text('${long_time}小时'),
          ),
        )),

        ///全天
        _container(ListTile(
          leading: Text("全天"),
          trailing: Switch(
              value: this.full_day,
              onChanged: (value) {
                setState(() {
                  this.full_day = value;
                });
              }),
        )),
      ],
    );
  }

  ///地点，附件，描述
  Widget description_page() {
    return Column(
      children: [
        ///输入地点
        SizedBox(
          height: 5.h,
        ),
        TextField(
          cursorColor: Colors.black87,
          controller: _locationController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: '请输入地点',
            hintStyle: TextStyle(color: Colors.black26),
          ),
        ),

        ///添加附件
        SizedBox(
          height: 5.h,
        ),
        _container(ListTile(
          leading: Text("添加附件"),
        )),

        ///输入描述
        SizedBox(
          height: 5.h,
        ),
        TextField(
          controller: _desController,
          cursorColor: Colors.black87,
          maxLines: 3,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: '请输入描述',
            hintStyle: TextStyle(color: Colors.black26),
          ),
        ),
      ],
    );
  }

  ///提醒，重复，主动加入
  Widget repeat_set_page() {
    return Column(
      children: [
        ///提醒
        SizedBox(
          height: 5.h,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                color: Colors.black12,
                width: 0.4.sp,
              ))),
          child: ListTile(
            onTap: () {
              Get.bottomSheet(Container(
                child: Wrap(
                  children: SET_TIP_TIME.keys
                      .map((index) => _container(ListTile(
                            title: Text("${SET_TIP_TIME[index]}"),
                            onTap: () {
                              setState(() {
                                tip = index;
                                Navigator.pop(context);
                              });
                            },
                          )))
                      .toList(),
                ),
              ));
            },
            leading: Text("提醒"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text("${SET_TIP_TIME[tip]}"),
                ),
              ],
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                color: Colors.black12,
                width: 0.4.sp,
              ))),
          child: ListTile(
            onTap: () {
              Get.bottomSheet(Container(
                child: Wrap(
                  children: SET_REPEAT
                      .asMap()
                      .keys
                      .map((index) => _container(ListTile(
                            title: Text("${SET_REPEAT[index]}"),
                            onTap: () {
                              setState(() {
                                repeat = SET_REPEAT[index];
                                Navigator.pop(context);
                              });
                            },
                          )))
                      .toList(),
                ),
              ));
            },
            leading: Text("重复"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(repeat ? "重复" : "不重复"),
                ),
              ],
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                color: Colors.black12,
                width: 0.4.sp,
              ))),
          child: ListTile(
            onTap: () {
              Get.bottomSheet(Container(
                child: Wrap(
                  children: SET_JOIN
                      .asMap()
                      .keys
                      .map((index) => _container(ListTile(
                            title: Text("${SET_JOIN[index]}"),
                            onTap: () {
                              setState(() {
                                join_in = SET_JOIN[index];
                                Navigator.pop(context);
                              });
                            },
                          )))
                      .toList(),
                ),
              ));
            },
            leading: Text("主动加入"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(join_in ? "开启" : "关闭"),
                ),
              ],
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }

  ///按钮
  Widget save_button_page() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.blue,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 90.w),
        // alignment: Alignment.center,
        child: Text("保存"),
      ),
    );
  }
}
