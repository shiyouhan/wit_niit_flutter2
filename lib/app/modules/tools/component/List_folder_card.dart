import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../views/disk_detail_view.dart';
// import 'package:wit_niit/app/modules/tools/views/disk_detail_view.dart';

class List_folder extends StatefulWidget {
  List_folder(
      {Key? key,
      this.name = "PC1",
      this.dateTime = "2022年11月24号",
      this.bgColor = Colors.blue})
      : super(key: key);

  String name;
  String dateTime;
  Color bgColor;

  @override
  State<List_folder> createState() => _List_folderState();
}

class _List_folderState extends State<List_folder> {
  _go_detail() {
    ///TODO:添加页面跳转传值
    Get.to(DiskDetailView());
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = widget.bgColor.withOpacity(0.2);

    Color textColor = widget.bgColor.withAlpha(255);

    return GestureDetector(
      onTap: _go_detail,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.r),
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            color: bgColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Icon(
                  Icons.create_new_folder_rounded,
                  color: textColor,
                  size: 40.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(color: textColor),
                    ),
                    Text(
                      widget.dateTime,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.info_outline,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
