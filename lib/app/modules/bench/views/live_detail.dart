import 'package:fijkplayer/fijkplayer.dart';
import 'package:fijkplayer_skin/fijkplayer_skin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/live_detail_controller.dart';

class LiveDetail extends GetView<LiveDetailController> {
  const LiveDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LiveDetailController liveDetailController = Get.put(LiveDetailController());
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("直播间页面"),
        // ),
        body: Column(
      children: [
        FijkView(
          height: 260,
          color: Colors.black,
          fit: FijkFit.cover,
          player: liveDetailController.player,
          panelBuilder: (
            FijkPlayer player,
            FijkData data,
            BuildContext context,
            Size viewSize,
            Rect texturePos,
          ) {
            /// 使用自定义的布局
            /// 精简模式，可不传递onChangeVideo
            return CustomFijkPanel(
              player: player,
              viewSize: viewSize,
              texturePos: texturePos,
              pageContent: context,
              // 标题 当前页面顶部的标题部分
              playerTitle: controller.name,
              // 当前视频源tabIndex
              curTabIdx: controller.curTabIdx.value,
              // 当前视频源activeIndex
              curActiveIdx: controller.curTabIdx.value,
              // 显示的配置
              showConfig: controller.vCfg,
              // json格式化后的视频数据
              videoFormat: controller.videoSourceTabs,
            );
          },
        ),
      ],
    ));
  }
}
