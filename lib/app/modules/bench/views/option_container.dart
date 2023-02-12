import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_data.dart';

class OptionContainer extends StatelessWidget {
  /// 背景颜色
  final Color bgColor;

  final Widget? child;

  final Function()? To;
  final String content;

  const OptionContainer({
    Key? key,
    this.child,
    this.To,
    this.bgColor = BaseData.kBackColor,
    this.content = "null",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(To);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        color: Color(0xfff8f5d6),
        elevation: 10,
        shape: RoundedRectangleBorder(
          // 圆角、边框
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xfff8f5e5), width: 1)),
        onPressed: To,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex:2,child: child!),
            Expanded(
              flex: 1,
              child: Text(
                content,
                maxLines: 1,
                style: TextStyle(color: Color(0xff80d1c8)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
