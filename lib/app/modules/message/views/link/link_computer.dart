
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LinkComputer extends StatelessWidget {
  const LinkComputer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            print('返回消息页');
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Image(
              image: AssetImage('assets/images/pc_img.png'),
              fit: BoxFit.cover,
            ),
            const Text(
              '在电脑中访问以下网址\n下载企业微信桌面端，完成连接',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 44),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 39),
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEF3),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 105,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'work.weixin.qq.com/pc',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      child: const Text(
                        '复制',
                        style: TextStyle(
                          color: Color(0xff3976c7),
                        ),
                      ),
                      onTap: () {
                        SQToast.show('复制成功');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SQToast {
  static show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.grey,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFFEEEEF3),
    );
  }
}
