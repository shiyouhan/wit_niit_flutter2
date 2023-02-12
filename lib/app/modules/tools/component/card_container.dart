import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_data.dart';

class card_container extends StatelessWidget {
  /// 背景颜色
  final Color bgColor;

  final Widget? child;

  ///点击回调
  final toName;

  final Function()? To;
  final String content;

  const card_container({
    Key? key,
    this.child,
    this.To,
    this.bgColor = BaseData.kBackColor,
    this.toName,
    this.content = "null",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(To);
    return Container(
      margin: EdgeInsets.all(10),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xfff8f5e5)),
        ),
        onPressed: () => Get.toNamed(toName),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(3),
              child: child,
            ),
            Container(
                height: 20,
                child: Text(
                  content,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black87),
                ))
          ],
        ),
      ),
    );
  }
}
