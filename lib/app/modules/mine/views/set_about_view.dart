// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';

class SetAboutView extends GetView {
  const SetAboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '关于智慧南工',
          style: BaseStyle.fs16,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    SizedBox(
                      width: 80.w,
                      height: 80.h,
                      child: Image(
                        image:
                            NetworkImage('http://img.syhan.top/uPic/1234.png'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '智慧南工',
                        style: BaseStyle.fs18Wb.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Text(
                      '1.0.0(100001)',
                      style: BaseStyle.fs12G,
                    ),
                    SizedBox(height: 42.h),
                    Column(
                      children: [
                        Container(
                          height: 64.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add_circle,
                                size: 32,
                                color: Colors.grey,
                              ),
                              Text(
                                '品牌视频',
                                style: BaseStyle.fs18Wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          height: 64.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add_circle,
                                size: 32,
                                color: Colors.grey,
                              ),
                              Text(
                                '更新日志',
                                style: BaseStyle.fs18Wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          height: 64.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add_circle,
                                size: 32,
                                color: Colors.grey,
                              ),
                              Text(
                                'API文档',
                                style: BaseStyle.fs18Wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          height: 64.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add_circle,
                                size: 32,
                                color: Colors.grey,
                              ),
                              Text(
                                '去评分',
                                style: BaseStyle.fs18Wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '软件许可及服务协议',
                      style: BaseStyle.fs12G.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '隐私保护指引摘要',
                      style: BaseStyle.fs12G.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '隐私政策',
                      style: BaseStyle.fs12G.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '校企合作',
                      style: BaseStyle.fs12G,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '版权所有',
                      style: BaseStyle.fs12G,
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© 2022-2022',
                      style: BaseStyle.fs12G,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'soft_2176 Inc.',
                      style: BaseStyle.fs12G,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'All right reserved.',
                      style: BaseStyle.fs12G,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
