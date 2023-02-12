import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScheduleController _controller = Get.put(ScheduleController());
    return Scaffold(
      appBar: AppBar(
        title: Text("课表"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8, childAspectRatio: 1 / 1),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: index == _controller.currentWeekIndex
                        ? const Color(0xf7f7f7)
                        : Colors.white,
                    child: Center(
                      child: index == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("星期",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                SizedBox(height: 5),
                                Text("日期", style: TextStyle(fontSize: 12)),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_controller.weekList[index - 1],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: index ==
                                                _controller.currentWeekIndex
                                            ? Colors.lightBlue
                                            : Colors.black87)),
                                SizedBox(height: 5),
                                Text(_controller.dateList[index - 1],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: index ==
                                                _controller.currentWeekIndex
                                            ? Colors.lightBlue
                                            : Colors.black87)),
                              ],
                            ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GridView.builder(
                        shrinkWrap: true,
                        // physics:ClampingScrollPhysics(),
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 1 / 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              child: Center(
                                child: Text(
                                  (index + 1).toInt().toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff5ff5),
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black12, width: 0.5),
                                  right: BorderSide(
                                      color: Colors.black12, width: 0.5),
                                ),
                              ));
                        }),
                  ),
                  Expanded(
                    flex: 7,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 35,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7, childAspectRatio: 1 / 4),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            // border: Border.all(color: Colors.black12, width: 0.5),
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.5),
                                              right: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.5),
                                            ),
                                          )),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            // border: Border.all(color: Colors.black12, width: 0.5),
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.5),
                                              right: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.5),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                if (_controller.infoLMap.containsKey(index))
                                  Container(
                                    margin: EdgeInsets.all(0.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: _controller.colorList[index % 7],
                                    ),
                                    child: Center(
                                      child: Text(
                                        _controller.infoLMap[index]!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          _controller.bottomView
        ],
      ),
    );
  }
}
// class ScheduleView extends GetView {
//   const ScheduleView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ScheduleView'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 8,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 8, childAspectRatio: 1 / 1),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     color: index == _controller.currentWeekIndex
//                         ? const Color(0xf7f7f7)
//                         : Colors.white,
//                     child: Center(
//                       child: index == 0
//                           ? Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("星期",
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                                 SizedBox(height: 5),
//                                 Text("日期", style: TextStyle(fontSize: 12)),
//                               ],
//                             )
//                           : Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(_controller.weekList[index - 1],
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         color: index ==
//                                                 _controller.currentWeekIndex
//                                             ? Colors.lightBlue
//                                             : Colors.black87)),
//                                 SizedBox(height: 5),
//                                 Text(_controller.dateList[index - 1],
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         color: index ==
//                                                 _controller.currentWeekIndex
//                                             ? Colors.lightBlue
//                                             : Colors.black87)),
//                               ],
//                             ),
//                     ),
//                   );
//                 }),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: GridView.builder(
//                         shrinkWrap: true,
//                         // physics:ClampingScrollPhysics(),
//                         itemCount: 10,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 1, childAspectRatio: 1 / 2),
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                               child: Center(
//                                 child: Text(
//                                   (index + 1).toInt().toString(),
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ),
//                               decoration: BoxDecoration(
//                                 color: Color(0xff5ff5),
//                                 border: Border(
//                                   bottom: BorderSide(
//                                       color: Colors.black12, width: 0.5),
//                                   right: BorderSide(
//                                       color: Colors.black12, width: 0.5),
//                                 ),
//                               ));
//                         }),
//                   ),
//                   Expanded(
//                     flex: 7,
//                     child: GridView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: 35,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 7, childAspectRatio: 1 / 4),
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             child: Stack(
//                               children: [
//                                 Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                           width: double.infinity,
//                                           height: double.infinity,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             // border: Border.all(color: Colors.black12, width: 0.5),
//                                             border: Border(
//                                               bottom: BorderSide(
//                                                   color: Colors.black12,
//                                                   width: 0.5),
//                                               right: BorderSide(
//                                                   color: Colors.black12,
//                                                   width: 0.5),
//                                             ),
//                                           )),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Container(
//                                           width: double.infinity,
//                                           height: double.infinity,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             // border: Border.all(color: Colors.black12, width: 0.5),
//                                             border: Border(
//                                               bottom: BorderSide(
//                                                   color: Colors.black12,
//                                                   width: 0.5),
//                                               right: BorderSide(
//                                                   color: Colors.black12,
//                                                   width: 0.5),
//                                             ),
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                                 if (_controller.infoLMap.containsKey(index))
//                                   Container(
//                                     margin: EdgeInsets.all(0.5),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(2),
//                                       color: _controller.colorList[index % 7],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         _controller.infoLMap[index]!,
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 11,
//                                             letterSpacing: 1),
//                                       ),
//                                     ),
//                                   )
//                               ],
//                             ),
//                           );
//                         }),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           _controller.bottomView
//         ],
//       ),
//     );
//   }
// }
