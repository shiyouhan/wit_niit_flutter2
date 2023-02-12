// ignore_for_file: prefer_const_constructors

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';

import '../../../data/CacheUtil.dart';
import '../../../data/theme_data.dart';
import '../controllers/set_storage_controller.dart';

class SetStorageView extends GetView<SetStorageController> {
  SetStorageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SetStorageController controller = Get.put(SetStorageController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '存储空间',
          style: BaseStyle.fs16,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 26.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '文件及缓存已用空间',
                  style: BaseStyle.fs14G.copyWith(color: Colors.black),
                ),
                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(
                      () => Text(
                        // (controller.storage.value + controller.file.value)
                        //     .toStringAsFixed(2),
                        (controller.storage.value + controller.file.value)
                            .toStringAsFixed(2),
                        style: BaseStyle.wdStyle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Column(
                      children: [
                        Text(
                          'GB',
                          style: BaseStyle.fs14G.copyWith(color: Colors.black),
                        ),
                        SizedBox(height: 4.h),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Text(
                      '占据手机存储空间的',
                      style: BaseStyle.fs12G,
                    ),
                    Obx(
                      () => Text(
                        '${(controller.storage.value / controller.ram.value).toStringAsFixed(2)}%',
                        style: BaseStyle.fs12G,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 26.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '聊天中的文件',
                          style: BaseStyle.fs14G.copyWith(color: Colors.black),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                controller.file.value.toString(),
                                style: BaseStyle.wdStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Column(
                              children: [
                                Text(
                                  'GB',
                                  style: BaseStyle.fs14G
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(height: 4.h),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          // color: controller.isSelected.value == 1
                          //     ? Colors.blue
                          //     : Config.primaryColor,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          '管理',
                          style: BaseStyle.fs14G.copyWith(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Text(
                  '可清理聊天中已下载的文件、图片等数据',
                  style: BaseStyle.fs12G,
                ),
              ],
            ),
          ),
          Container(
            height: 1.h,
            color: Config.primarySwatchColor.shade50,
            margin: EdgeInsets.only(left: 16.0),
          ),
          Container(
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 26.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '缓存',
                          style: BaseStyle.fs14G.copyWith(color: Colors.black),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              controller.cacheSize.value.toString(),
                              style: BaseStyle.wdStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Column(
                              children: [
                                Text(
                                  'GB',
                                  style: BaseStyle.fs14G
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(height: 4.h),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => controller.clean(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: controller.isSelected.value == 1
                              ? Colors.blue
                              : Config.primaryColor,
                          // color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          '清理',
                          style: BaseStyle.fs14G.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Text(
                  '缓存是使用智慧南工过程中产生的临时数据，清理缓存不会影响智慧南工的正常使用。',
                  style: BaseStyle.fs12G,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
