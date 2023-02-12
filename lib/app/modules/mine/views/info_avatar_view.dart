// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:dio/dio.dart' as DIO;
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/mine_controller.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/person_info_view.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../../../data/theme_data.dart';

class InfoAvatarView extends StatefulWidget {
  const InfoAvatarView({Key? key}) : super(key: key);

  @override
  State<InfoAvatarView> createState() => _InfoAvatarViewState();
}

class _InfoAvatarViewState extends State<InfoAvatarView> {
  MineController mineController = Get.put(MineController());
  String? path;
  final id = SpUtil.getString("id");
  final token = SpUtil.getString("token");
  String photoUrl = '';

  @override
  void initState() {
    super.initState();
  }

  // 上传头像
  uploadAvatar(List<Media>? res) async {
    if (res != null) {
      String? path = res[0].path;
      print(path);

      var formData = DIO.FormData.fromMap({
        'photo': await DIO.MultipartFile.fromFile(path!)
      }); // ignore: unnecessary_non_null_assertion
      print(1);
      request
          .post('${NetUrl.kHttp_HostName}/users/upload', data: formData)
          .then((value) {
        photoUrl = value;
        userEdit();
        print(value);
      }).catchError((_) {
        EasyLoading.showError('数据解析异常');
      });
    }
  }

  // 修改个人信息
  userEdit() {
    Map<String, dynamic> params = {
      "id": mineController.id.value,
      "name": mineController.name.value,
      "gender": mineController.gender.value,
      "photo": photoUrl,
    };
    request
        .post('${NetUrl.kHttp_HostName}/users/edit', data: params)
        .then((value) {
      mineController.getUser();
      print(value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }

  Future<File> downloadFile(String url) async {
    Dio simple = Dio();
    String savePath = '${Directory.systemTemp.path}/${url.split('/').last}';
    await simple.download(url, savePath,
        options: Options(responseType: ResponseType.bytes));
    print(savePath);
    File file = File(savePath);
    return file;
  }

  //显示底部弹框的功能
  void showBottomSheet() {
    //用于在底部打开弹框的效果
    showModalBottomSheet(
      builder: (BuildContext context) {
        //构建弹框中的内容
        return buildBottomSheetWidget(context);
      },
      context: context,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    MineController mineController = Get.put(MineController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '个人头像',
          style: BaseStyle.fs16,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            // mineController.getUser(),
            Get.to(() => PersonInfoView()),
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              showBottomSheet();
            },
          ),
          SizedBox(width: 14),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: size.width,
          height: size.width,
          child: path != null
              ? Image.file(
                  File(path!),
                  fit: BoxFit.contain,
                )
              : Image.network(
                  mineController.photo.value,
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }

  Widget buildBottomSheetWidget(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          buildItem(
            '拍照',
            onTap: () async {
              List<Media>? res = await ImagesPicker.openCamera(
                // pickType: PickType.video,
                pickType: PickType.image,
                quality: 0.8,
                maxSize: 800,
                cropOpt: CropOption(
                  aspectRatio: CropAspectRatio.custom,
                ),
                maxTime: 15,
              );
              print(res);
              uploadAvatar(res);
              if (res != null) {
                print(res[0].path);
                setState(() {
                  path = res[0].thumbPath!;
                });
              }
              Navigator.of(context).pop();
            },
          ),
          const Divider(),
          buildItem(
            '从相册中选取',
            onTap: () async {
              List<Media>? res = await ImagesPicker.pick(
                count: 1,
                pickType: PickType.all,
                language: Language.System,
                maxTime: 30,
                // maxSize: 500,
                cropOpt: CropOption(
                  // aspectRatio: CropAspectRatio.wh16x9,
                  cropType: CropType.circle,
                ),
              );
              uploadAvatar(res);
              print(res);
              if (res != null) {
                print(res.map((e) => e.path).toList());
                setState(() {
                  path = res[0].thumbPath!;
                });
              }
              Navigator.of(context).pop();
            },
          ),
          const Divider(),
          buildItem('保存图片', onTap: () async {
            File file = await downloadFile(mineController.photo.value);
            bool res =
                await ImagesPicker.saveImageToAlbum(file, albumName: "chaves");
            print(res);
            Navigator.of(context).pop();
          }),
          Container(
            color: Config.primarySwatchColor.shade50,
            height: 2.h,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50.h,
              alignment: Alignment.center,
              child: Text(
                "取消",
                style: BaseStyle.fs16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(String title, {required Function onTap}) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pop();
        onTap();
      },
      child: SizedBox(
        height: 50.h,
        //左右排开的线性布局
        child: Center(
          child: Text(
            title,
            style: BaseStyle.fs16,
          ),
        ),
      ),
    );
  }
}
