import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// 图片全屏展示
class ImageShowServer extends StatefulWidget {
  const ImageShowServer({
    Key? key,
    this.initialIndex = 0,
    required this.photoList,
    this.type = 0,
  }) : super(key: key);
  final int initialIndex;
  final List photoList;
  final int type; // 图片类型： 0 file、1 network

  @override
  State<ImageShowServer> createState() => _ImageShowServerState();
}

class _ImageShowServerState extends State<ImageShowServer> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                onPageChanged: onPageChanged,
                itemCount: widget.photoList.length,
                pageController: PageController(
                  initialPage: _currentIndex,
                ),
                builder: (BuildContext context, int index) {
                  if (widget.type == 0) {
                    /// 本地图查看
                    return PhotoViewGalleryPageOptions(
                      imageProvider: FileImage(
                        File(
                          widget.photoList[index].runtimeType == String
                              ? widget.photoList[index]
                              : widget.photoList[index].url,
                        ),
                      ),
                      minScale: PhotoViewComputedScale.contained * 0.6,
                      maxScale: PhotoViewComputedScale.covered * 1.1,
                      initialScale: PhotoViewComputedScale.contained,
                    );
                  } else {
                    /// 网络图查看
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(
                        widget.photoList[index].runtimeType == String
                            ? widget.photoList[index]
                            : widget.photoList[index].url,
                      ),
                      minScale: PhotoViewComputedScale.contained * 0.6,
                      maxScale: PhotoViewComputedScale.covered * 1.1,
                      initialScale: PhotoViewComputedScale.contained,
                    );
                  }
                },
              ),
            ),
            Positioned(
              left: 10,
              top: 60,
              child: GestureDetector(
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///图片切换
  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
