import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class smart_card extends StatefulWidget {
  smart_card({
    Key? key,
    this.icon = Icons.remove_from_queue,
    this.name = "PC1",
    this.status = false,
  }) : super(key: key);

  IconData icon;
  String name;
  bool status;

  @override
  State<smart_card> createState() => _smart_cardState();
}

class _smart_cardState extends State<smart_card> {
  remove_switch() {
    ///TODO:添加远程控制
  }

  @override
  Widget build(BuildContext context) {
    double WIDTH = 165;
    double HEIGHT = 215;
    bool status = !widget.status;

    String switchText = status ? "ON" : "OFF";

    Color fontColor = status ? Colors.grey.shade300 : Colors.black54;

    Color bgColor = status ? Colors.black87 : Colors.grey.shade200;

    Color iconColor = status ? Colors.grey.shade300 : Colors.black87;

    Color circleBgColor = status ? Colors.grey.shade800 : Colors.grey.shade400;

    Color activeColor = status ? Colors.white : Colors.white;

    Color activeTrackColor = status ? Colors.white : Colors.white;

    BoxShadow shadow = status
        ? BoxShadow()
        : BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 20);

    double width = status ? WIDTH : WIDTH - 10;

    double height = status ? HEIGHT : HEIGHT - 10;
    return Container(
      width: width.w,
      height: height.h,
      margin: EdgeInsets.all(5.r),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      decoration: BoxDecoration(
        boxShadow: [shadow],
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        color: bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.h),
            child: CircleAvatar(
              child: Icon(
                widget.icon,
                color: iconColor,
              ),
              backgroundColor: circleBgColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.h),
            width: 90.w,
            child: Text(
              widget.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: fontColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                switchText,
                style: TextStyle(color: fontColor),
              ),
              Container(
                child: Switch(
                    // activeTrackColor: activeTrackColor,
                    //关闭状态thumb颜色
                    inactiveThumbColor: activeTrackColor,
                    hoverColor: activeTrackColor,
                    // 打开 状态 轨道 和 按钮颜色
                    activeColor: activeColor,
                    //当前开关状态 布尔值
                    value: widget.status,
                    //监听（开关状态改变时调用）
                    onChanged: (value) {
                      remove_switch();
                      setState(() {
                        widget.status = value;
                      });
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
