import 'package:fijkplayer/fijkplayer.dart';
import 'package:fijkplayer_skin/fijkplayer_skin.dart';
import 'package:fijkplayer_skin/schema.dart';
import 'package:flustars/flustars.dart';
import 'package:get/get.dart';

class LiveDetailController extends GetxController {
  //TODO: Implement HealthController

  String url = Get.arguments[1];
  String name = Get.arguments[0];
  final curTabIdx = 0.obs;
  final curActiveIdx = 0.obs;

  final FijkPlayer player = FijkPlayer();
  ShowConfigAbs vCfg = PlayerShowConfig();
  VideoSourceFormat? videoSourceTabs;

  Map<String, List<Map<String, dynamic>>> videoList = {
    "video": [
      {
        "name": "",
        "list": [
          {"url": "", "name": ""},
        ]
      },
    ]
  }.obs;

  @override
  void onInit() {
    videoList["video"]![0]["list"][0]["url"] = url;
    // videoList["video"]![0]["list"][0]["name"] = name;
    super.onInit();
    // 格式化json转对象
    videoSourceTabs = VideoSourceFormat.fromJson(videoList);
    // 这句不能省，必须有
    speed = 1.0;
  }

  @override
  void onReady() {
    super.onReady();
    LogUtil.v('>>>>>测试～～$url');
    LogUtil.v('>>>>>测试～～$name');
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}

// 这里实现一个皮肤显示配置项
class PlayerShowConfig implements ShowConfigAbs {
  @override
  bool drawerBtn = false;
  @override
  bool nextBtn = false;
  @override
  bool speedBtn = false;
  @override
  bool topBar = true;
  @override
  bool lockBtn = true;
  @override
  bool autoNext = false;
  @override
  bool bottomPro = false;
  @override
  bool stateAuto = true;
  @override
  bool isAutoPlay = true;
}
