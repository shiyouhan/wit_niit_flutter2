import 'package:get/get.dart';

import 'package:wit_niit_flutter2/app/modules/login/controllers/logon_controller.dart';
import 'package:wit_niit_flutter2/app/modules/login/controllers/reset_password_controller.dart';
import 'package:wit_niit_flutter2/app/modules/login/controllers/start_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
    );
    Get.lazyPut<LogonController>(
      () => LogonController(),
    );
    Get.lazyPut<StartController>(
      () => StartController(),
    );
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
