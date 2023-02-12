import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../component/Calendar_event_add.dart';

class TableComplexExample extends StatefulWidget {
  @override
  _TableComplexExampleState createState() => _TableComplexExampleState();
}

class _TableComplexExampleState extends State<TableComplexExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  late PageController _pageController;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  //获取事件
  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  //选择日期
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.clear();
        _selectedDays.add(selectedDay);
      }
      _focusedDay.value = focusedDay;
    });
    _selectedEvents.value = _getEventsForDay(selectedDay);
  }

  ///TODO:添加事件参考
  // void _addEvent() {
  //   Map<DateTime, List<Event>> map = {
  //     _selectedDays.first: [Event(title: "添加1", status: false)]
  //   };
  //   setState(() {
  //     if (kEvents.containsKey(_selectedDays.first)) {
  //       kEvents[_selectedDays.first]?.add(Event(title: "添加1", status: false));
  //       debugPrint("if");
  //     } else {
  //       kEvents.addAll(map);
  //       debugPrint("else");
  //     }
  //     _selectedEvents.value.add(Event(title: "添加1", status: false));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Calendar_event_add());
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return _CalendarHeader(
                focusedDay: value,
                onTodayButtonTap: () {
                  setState(() => _focusedDay.value = DateTime.now());
                },
                onLeftArrowTap: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          TableCalendar<Event>(
            rowHeight: 52.h,
            locale: 'zh_CN',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            headerVisible: false,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            calendarBuilders: CalendarBuilders(markerBuilder:
                (BuildContext context, DateTime day, List<Event> events) {
              List<Event>? list = kEvents[day];
              if (list != null) {
                BoxDecoration decoration;
                if (day.day == kToday.day) {
                  decoration = const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red);
                } else {
                  decoration = const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue);
                }
                return Container(
                    width: 7.r,
                    height: 7.r,
                    margin: EdgeInsets.only(bottom: 4.r),
                    decoration: decoration);
              }
              return null;
            }),
            onDaySelected: _onDaySelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.r),
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                border: Border.all(
                  color: Colors.black26,
                  width: 0.4.sp,
                ),
              ),
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ///TODO:添加页面跳转
                          Get.to(Calendar_event_add());
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5.r),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                color: Colors.black12.withOpacity(0.05)),
                            child: ListTile(
                              title: Text(
                                '${value[index]}',
                                maxLines: 1,
                              ),
                            )),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//顶部
class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.w),
      child: Row(
        children: [
          SizedBox(width: 16.0.w),
          SizedBox(
            width: 140.0.w,
            child: Text(
              headerText,
              style: TextStyle(fontSize: 22.0.sp),
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, size: 20.0.sp),
            visualDensity: VisualDensity.compact,
            onPressed: onTodayButtonTap,
          ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}

/// Example event class.
class Event {
  final String title;
  late bool status;

  Event({required this.title, this.status = false});

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

//日程记录
final _kEventSource = {
  kToday: [
    Event(title: '点击添加日程', status: false),
    // Event(title: 'Today\'s Event 2', status: false),
    // Event(title: 'Today\'s Event 2', status: false),
  ],
  DateTime.utc(2022, 11, 15): [
    Event(
      title: 'Today\'s Event 4',
      status: false,
    ),
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

// class TableComplexExample extends StatefulWidget {
//   @override
//   _TableComplexExampleState createState() => _TableComplexExampleState();
// }
//
// class _TableComplexExampleState extends State<TableComplexExample> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
//   final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
//     equals: isSameDay,
//     hashCode: getHashCode,
//   );
//
//   late PageController _pageController;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDays.add(_focusedDay.value);
//     _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
//   }
//
//   @override
//   void dispose() {
//     _focusedDay.dispose();
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   bool get canClearSelection =>
//       _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;
//
//   List<Event> _getEventsForDay(DateTime day) {
//     return kEvents[day] ?? [];
//   }
//
//   List<Event> _getEventsForDays(Iterable<DateTime> days) {
//     return [
//       for (final d in days) ..._getEventsForDay(d),
//     ];
//   }
//
//   List<Event> _getEventsForRange(DateTime start, DateTime end) {
//     final days = daysInRange(start, end);
//     return _getEventsForDays(days);
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     setState(() {
//       if (_selectedDays.contains(selectedDay)) {
//         _selectedDays.remove(selectedDay);
//       } else {
//         _selectedDays.add(selectedDay);
//       }
//
//       _focusedDay.value = focusedDay;
//       _rangeStart = null;
//       _rangeEnd = null;
//       _rangeSelectionMode = RangeSelectionMode.toggledOff;
//     });
//
//     _selectedEvents.value = _getEventsForDays(_selectedDays);
//   }
//
//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _focusedDay.value = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _selectedDays.clear();
//       _rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });
//
//     if (start != null && end != null) {
//       _selectedEvents.value = _getEventsForRange(start, end);
//     } else if (start != null) {
//       _selectedEvents.value = _getEventsForDay(start);
//     } else if (end != null) {
//       _selectedEvents.value = _getEventsForDay(end);
//     }
//   }
//
//   void _addEvent() {
//     var iter = _selectedDays.iterator;
//     while (iter.moveNext()) {
//       setState(() {
//         Map<DateTime, List<Event>> map = {
//           iter.current: [Event("添加1")]
//         };
//         if (kEvents.containsKey(iter.current) != null) {
//           kEvents[iter.current]?.add(Event("添加1"));
//         } else {
//           kEvents.addAll(map);
//         }
//         _selectedEvents.value.add(Event("添加1"));
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar - Complex'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addEvent,
//         child: Icon(Icons.add),
//       ),
//       body: Column(
//         children: [
//           ValueListenableBuilder<DateTime>(
//             valueListenable: _focusedDay,
//             builder: (context, value, _) {
//               return _CalendarHeader(
//                 focusedDay: value,
//                 clearButtonVisible: canClearSelection,
//                 onTodayButtonTap: () {
//                   setState(() => _focusedDay.value = DateTime.now());
//                 },
//                 onClearButtonTap: () {
//                   setState(() {
//                     _rangeStart = null;
//                     _rangeEnd = null;
//                     _selectedDays.clear();
//                     _selectedEvents.value = [];
//                   });
//                 },
//                 onLeftArrowTap: () {
//                   _pageController.previousPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeOut,
//                   );
//                 },
//                 onRightArrowTap: () {
//                   _pageController.nextPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeOut,
//                   );
//                 },
//               );
//             },
//           ),
//           TableCalendar<Event>(
//             rowHeight: 52.h,
//             locale: 'zh_CN',
//             firstDay: kFirstDay,
//             lastDay: kLastDay,
//             focusedDay: _focusedDay.value,
//             headerVisible: false,
//             selectedDayPredicate: (day) => _selectedDays.contains(day),
//             rangeStartDay: _rangeStart,
//             rangeEndDay: _rangeEnd,
//             calendarFormat: _calendarFormat,
//             rangeSelectionMode: _rangeSelectionMode,
//             eventLoader: _getEventsForDay,
//             calendarStyle: const CalendarStyle(
//                 outsideDaysVisible: true,
//                 selectedDecoration:
//                     BoxDecoration(color: Color.fromRGBO(0, 122, 255, 1)),
//                 todayDecoration:
//                     BoxDecoration(color: Color.fromRGBO(0, 122, 255, 0.5)),
//                 markersMaxCount: 1,
//                 markersAutoAligned: true),
//             calendarBuilders: CalendarBuilders(markerBuilder:
//                 (BuildContext context, DateTime day, List<Event> events) {
//               List<Event>? list = kEvents[day];
//               if (list != null) {
//                 BoxDecoration decoration;
//                 if (day.day == kToday.day) {
//                   decoration = const BoxDecoration(
//                       shape: BoxShape.circle, color: Colors.red);
//                 } else {
//                   decoration = const BoxDecoration(
//                       shape: BoxShape.circle, color: Colors.blue);
//                 }
//                 return Container(
//                     width: 7.r,
//                     height: 7.r,
//                     margin: EdgeInsets.only(bottom: 4.r),
//                     decoration: decoration);
//               }
//               return null;
//             }),
//             onDaySelected: _onDaySelected,
//             onRangeSelected: _onRangeSelected,
//             onCalendarCreated: (controller) => _pageController = controller,
//             onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 print(format);
//                 setState(() => _calendarFormat = format);
//               }
//             },
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: ListTile(
//                         onTap: () => print('${value[index]}'),
//                         title: Text('${value[index]}'),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _CalendarHeader extends StatelessWidget {
//   final DateTime focusedDay;
//   final VoidCallback onLeftArrowTap;
//   final VoidCallback onRightArrowTap;
//   final VoidCallback onTodayButtonTap;
//   final VoidCallback onClearButtonTap;
//   final bool clearButtonVisible;
//
//   const _CalendarHeader({
//     Key? key,
//     required this.focusedDay,
//     required this.onLeftArrowTap,
//     required this.onRightArrowTap,
//     required this.onTodayButtonTap,
//     required this.onClearButtonTap,
//     required this.clearButtonVisible,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final headerText = DateFormat.yMMM().format(focusedDay);
//
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0.w),
//       child: Row(
//         children: [
//           SizedBox(width: 16.0.w),
//           SizedBox(
//             width: 140.0.w,
//             child: Text(
//               headerText,
//               style: TextStyle(fontSize: 22.0.sp),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.calendar_today, size: 20.0.sp),
//             visualDensity: VisualDensity.compact,
//             onPressed: onTodayButtonTap,
//           ),
//           if (clearButtonVisible)
//             IconButton(
//               icon: Icon(Icons.clear, size: 20.0.sp),
//               visualDensity: VisualDensity.compact,
//               onPressed: onClearButtonTap,
//             ),
//           const Spacer(),
//           IconButton(
//             icon: Icon(Icons.chevron_left),
//             onPressed: onLeftArrowTap,
//           ),
//           IconButton(
//             icon: Icon(Icons.chevron_right),
//             onPressed: onRightArrowTap,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// Example event class.
// class Event {
//   final String title;
//
//   const Event(this.title);
//
//   @override
//   String toString() => title;
// }
//
// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);
//
// //日程记录
// final _kEventSource = {
//   kToday: [
//     Event('Today\'s Event 1'),
//     Event('Today\'s Event 2'),
//     Event('Today\'s Event 2'),
//     Event('Today\'s Event 2'),
//   ],
// };
//
// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }
//
// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }
//
// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
