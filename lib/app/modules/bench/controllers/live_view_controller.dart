import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haishin_kit/audio_settings.dart';
import 'package:haishin_kit/audio_source.dart';
import 'package:haishin_kit/rtmp_connection.dart';
import 'package:haishin_kit/rtmp_stream.dart';
import 'package:haishin_kit/video_settings.dart';
import 'package:haishin_kit/video_source.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wit_niit_flutter2/main.dart';

class LiveViewController extends GetxController {
  //TODO: Implement HealthController

  RtmpConnection? connection;
  RtmpStream? stream;
  var recording = false.obs;
  var mode = "publish".obs;
  CameraPosition currentPosition = CameraPosition.back;

  @override
  void onInit() {
    super.onInit();
    initPlatformState();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    connection?.dispose();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    await Permission.camera.request();
    await Permission.microphone.request();

    // Set up AVAudioSession for iOS.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth,
    ));

    RtmpConnection _connection = await RtmpConnection.create();
    // connection.eventChannel.receiveBroadcastStream()
    _connection.eventChannel.receiveBroadcastStream().listen((event) {
      // logger.v(event["data"]["code"]);
      switch (event["data"]["code"]) {
        case 'NetConnection.Connect.Success':
          if (mode == "publish") {
            stream?.publish("live");
          } else {
            stream?.play("live");
          }

          recording.value = true;

          break;
      }
    });

    RtmpStream _stream = await RtmpStream.create(_connection);
    _stream.audioSettings = AudioSettings(muted: false, bitrate: 64 * 1000);
    _stream.videoSettings = VideoSettings(
      width: 480,
      height: 272,
      bitrate: 1024 * 1000,
    );
    _stream.attachAudio(AudioSource());
    _stream.attachVideo(VideoSource(position: currentPosition));

    // if (!mounted) return;

    connection = _connection;
    stream = _stream;
  }
}
