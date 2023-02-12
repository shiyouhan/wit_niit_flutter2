import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ApplyIntoController extends GetxController {
  //TODO: Implement BenchController

  var showSide = true.obs;
  var picker = ImagePicker().obs;
  var showImage = true.obs;
  var peerHealthy=true.obs;
  var riskRegion = true.obs;
  var groupValue1 = 0.obs;
  var groupValue2 = 0.obs;
  var groupValue3 = 0.obs;
  var sicken = true.obs;

  var checkValue = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setShoeSide()=>showSide.value=!showSide.value;
}
