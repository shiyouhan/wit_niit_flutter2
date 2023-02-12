import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../views/disk_detail_view.dart';
// import 'package:wit_niit/app/modules/tools/views/disk_detail_view.dart';

class Table_folder extends StatefulWidget {
  Table_folder(
      {Key? key,
      this.name = "PC1",
      this.dateTime = "2022年11月16号",
      this.bgColor = Colors.blue})
      : super(key: key);

  String name;
  String dateTime;
  Color bgColor;

  @override
  State<Table_folder> createState() => _Table_folderState();
}

class _Table_folderState extends State<Table_folder> {
  _go_detail() {
    ///TODO:添加页面跳转传值
    Get.to(DiskDetailView());
  }

  @override
  Widget build(BuildContext context) {
    double WIDTH = 165;

    double HEIGHT = 125;

    Color bgColor = widget.bgColor.withOpacity(0.2);

    Color textColor = widget.bgColor.withAlpha(255);

    return GestureDetector(
      onTap: _go_detail,
      child: Container(
        width: WIDTH.w,
        height: HEIGHT.h,
        margin: EdgeInsets.all(5.r),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.create_new_folder_rounded,
                  color: textColor,
                  size: 40.sp,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info_outline,
                      color: textColor,
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.h),
              alignment: Alignment.topLeft,
              child: Text(
                widget.name,
                style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                widget.dateTime,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
