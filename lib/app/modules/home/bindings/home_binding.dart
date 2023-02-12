// import 'package:get/get.dart';
// import 'package:wit_niit_flutter2/app/modules/bench/controllers/bench_controller.dart';
// import 'package:wit_niit_flutter2/app/modules/contacts/controllers/contacts_controller.dart';
// import 'package:wit_niit_flutter2/app/modules/login/controllers/login_controller.dart';
// import 'package:wit_niit_flutter2/app/modules/message/controllers/message_controller.dart';
// import 'package:wit_niit_flutter2/app/modules/tools/controllers/tools_controller.dart';
//
// import '../controllers/home_controller.dart';
//
// class HomeBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<HomeController>(
//       () => HomeController(),
//     );
//     Get.lazyPut<BenchController>(
//       () => BenchController(),
//     );
//     Get.lazyPut<ContactsController>(
//       () => ContactsController(),
//     );
//     Get.lazyPut<LoginController>(
//       () => LoginController(),
//     );
//     Get.lazyPut<MessageController>(
//       () => MessageController(),
//     );
//     Get.lazyPut<ToolsController>(
//       () => ToolsController(),
//     );
//   }
// }
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/bench_controller.dart';
import 'package:wit_niit_flutter2/app/modules/contacts/controllers/contacts_controller.dart';
import 'package:wit_niit_flutter2/app/modules/login/controllers/login_controller.dart';
import 'package:wit_niit_flutter2/app/modules/message/controllers/message_controller.dart';
import 'package:wit_niit_flutter2/app/modules/tools/controllers/tools_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BenchController>(
      () => BenchController(),
    );
    Get.lazyPut<ContactsController>(
      () => ContactsController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<MessageController>(
      () => MessageController(),
    );
    Get.lazyPut<ToolsController>(
      () => ToolsController(),
    );
  }
}
