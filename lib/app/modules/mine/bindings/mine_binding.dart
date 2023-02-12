import 'package:get/get.dart';

import 'package:wit_niit_flutter2/app/modules/mine/controllers/info_email_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/info_password_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/info_phone_num_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/set_language_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/set_msg_notice_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/set_storage_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/set_theme_controller.dart';

import '../controllers/mine_controller.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoPasswordController>(
      () => InfoPasswordController(),
    );
    Get.lazyPut<SetThemeController>(
      () => SetThemeController(),
    );
    Get.lazyPut<SetLanguageController>(
      () => SetLanguageController(),
    );
    Get.lazyPut<SetStorageController>(
      () => SetStorageController(),
    );
    Get.lazyPut<SetMsgNoticeController>(
      () => SetMsgNoticeController(),
    );
    Get.lazyPut<InfoPhoneNumController>(
      () => InfoPhoneNumController(),
    );
    Get.lazyPut<InfoEmailController>(
      () => InfoEmailController(),
    );
    Get.lazyPut<MineController>(
      () => MineController(),
    );
  }
}
