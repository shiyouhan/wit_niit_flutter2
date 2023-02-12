import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haishin_kit/audio_source.dart';
import 'package:haishin_kit/net_stream_drawable_texture.dart';
import 'package:haishin_kit/video_source.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/live_view_controller.dart';

class LiveView extends GetView<LiveViewController> {
  const LiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LiveViewController controller = Get.put(LiveViewController());
    return Scaffold(
      appBar: AppBar(title: const Text('HaishinKit'), actions: [
        IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () {
            if (controller.mode.value == "publish") {
              controller.mode.value = "playback";
              controller.stream?.attachVideo(null);
              controller.stream?.attachAudio(null);
            } else {
              controller.mode.value = "publish";
              controller.stream?.attachAudio(AudioSource());
              controller.stream?.attachVideo(
                  VideoSource(position: controller.currentPosition));
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.flip_camera_android),
          onPressed: () {
            if (controller.currentPosition == CameraPosition.front) {
              controller.currentPosition = CameraPosition.back;
            } else {
              controller.currentPosition = CameraPosition.front;
            }
            controller.stream?.attachVideo(
                VideoSource(position: controller.currentPosition));
          },
        )
      ]),
      body: Center(
        child: controller.stream == null
            ? const Text("")
            : NetStreamDrawableTexture(controller.stream),
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          child: controller.recording.value
              ? const Icon(Icons.fiber_smart_record)
              : const Icon(Icons.not_started),
          onPressed: () {
            if (controller.recording.value) {
              controller.connection?.close();

              controller.recording.value = false;
            } else {
              // logger.v(_recording);
              controller.connection
                  ?.connect("rtmp://www.patrickstarm.top:1935/live");
              controller.stream?.publish("mth");
            }
          },
        );
      }),
    );
  }
}
