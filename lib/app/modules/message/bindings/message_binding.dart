import 'package:get/get.dart';

import 'package:wit_niit_flutter2/app/modules/message/controllers/message_detail_controller.dart';

import '../controllers/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageDetailController>(
      () => MessageDetailController(),
    );
    Get.lazyPut<MessageController>(
      () => MessageController(),
    );
  }
}
