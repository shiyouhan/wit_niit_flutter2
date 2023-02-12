import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/person_info_view.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/setting_view.dart';

import '../../../data/base_style.dart';
import '../../../data/theme_data.dart';
import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MineController controller = Get.put(MineController());
    return Scaffold(
      body: Container(
        // color: Config.primarySwatchColor,
        color: Colors.black26,
        child: Column(
          children: [
            SizedBox(height: 68.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {
                      Get.to(const PersonInfoView()),
                      controller.getUser(),
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0.r),
                          child: SizedBox(
                            width: 62.w,
                            height: 62.h,
                            child: Obx(
                              () => Image.network(
                                controller.photo.value,
                                // 'https://cdn.syhan.top/uPic/avatar.JPG',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Obx(
                          () => Text(
                            controller.name.value,
                            // '施友涵',
                            style: BaseStyle.fs18Wb,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.qr_code,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              height: 72,
              // color: Config.primarySwatchColor.shade300,
              color: Colors.black26,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: SizedBox(
                          width: 38,
                          height: 38,
                          child: Obx(
                            () => Image.network(
                              controller.photo.value,
                              // 'https://cdn.syhan.top/uPic/avatar.JPG',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Text(
                        '南京工业职业技术大学',
                        style: BaseStyle.fs18Wb,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 14.w),
                      Text(
                        '全新创建企业',
                        style: BaseStyle.fs16W,
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 14.w),
                      Text(
                        '加入其他企业',
                        style: BaseStyle.fs16W,
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.help,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 14.w),
                          Text(
                            '帮助',
                            style: BaseStyle.fs16W,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const SettingView()),
                        child: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: Config.primarySwatchColor.shade300,
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 22.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
