
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wit_niit_flutter2/app/component/Iconfont.dart';
import 'package:wit_niit_flutter2/app/data/base_style.dart';
import 'package:wit_niit_flutter2/app/modules/message/views/component/scan_view.dart';

class VisitingCard extends StatelessWidget {
  const VisitingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6f8),
      appBar: AppBar(
        title: Text('面对面添加')
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
         child: Column(
           children: [
             Column(
               children: [
                 Container(
                   height: 300.h,
                   width: 300.w,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         image: AssetImage('assets/images/card.JPG')
                     ),
                   ),
                   child: Container(
                     padding: EdgeInsets.all(8.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('丁旭东',style: BaseStyle.fs20W,),
                         Text('AI南工',style: TextStyle(color: Colors.white))
                       ],
                     ),
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.all(20.0),
                     child: Image(
                         image: AssetImage('assets/images/erweima.png')
                     ),
                 )
               ],
             ),
             Container(
               color: Color(0xffdedfe1),
               child: Row(
                 children: [
                   IconButton(onPressed: () {
                     Get.to(openScan());
                   }, icon: Icon(cIcons.icon_saoyisao)),
                   Text('扫描外部联系人二维码')
                 ],
               ),
             )
           ],
         ),
      ),
    );
  }
}
