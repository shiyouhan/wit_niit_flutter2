import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wit_niit_flutter2/app/modules/tools/component/school_calendar_controller.dart';
// import 'package:wit_niit/app/modules/tools/controllers/school_calendar_controller.dart';

class SchoolCalendarView extends GetView {
  const SchoolCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchoolCalendarController _controller = Get.put(SchoolCalendarController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder<DateTime>(
            valueListenable: _controller.focusedDay,
            builder: (context, value, _) {
              return _CalendarHeader(
                focusedDay: value,
                onTodayButtonTap: () {
                  _controller.focusedDay.value = DateTime.now();
                },
                onLeftArrowTap: () {
                  _controller.pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _controller.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          TableCalendar<Event>(
            onCalendarCreated: (controller) =>
                _controller.pageController = controller,
            rowHeight: 52.h,
            locale: 'zh_CN',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _controller.focusedDay.value,
            headerVisible: false,
            calendarFormat: _controller.calendarFormat,
            eventLoader: _controller.getEventsForDay,
            calendarBuilders: CalendarBuilders(markerBuilder:
                (BuildContext context, DateTime day, List<Event> events) {
              List<Event>? list = kEvents[day];
              if (list != null) {
                BoxDecoration decoration;
                if (list.first.title == "4") {
                  decoration = const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue);
                } else if (list.first.title == "3") {
                  decoration = const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.greenAccent);
                } else if (list.first.title == "2") {
                  decoration = const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red);
                } else {
                  decoration = const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orangeAccent);
                }
                return Container(
                    width: 7.r,
                    height: 7.r,
                    margin: EdgeInsets.only(bottom: 4.r),
                    decoration: decoration);
              }
              return null;
            }),
            onDaySelected: _controller.onDaySelected,
            // onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) =>
                _controller.focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_controller.calendarFormat != format) {
                _controller.calendarFormat = format;
              }
            },
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
    SchoolCalendarController _controller = Get.put(SchoolCalendarController());
    final headerText = DateFormat.yMMM().format(focusedDay);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.w),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: onLeftArrowTap,
              ),
              Container(
                child: Text(
                  headerText,
                  style: TextStyle(fontSize: 16.0.sp),
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: onRightArrowTap,
              ),
            ],
          ),
          Row(
            children: _controller.school_calendar.keys
                .map((e) => tip_card(e,
                    color: _controller.school_calendar[e]!,
                    circle: _controller.school_calendar.keys.last == e))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget tip_card(String message,
    {Color color = Colors.red, bool circle = false}) {
  return Container(
    margin: EdgeInsets.all(5.r),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(2.r),
          width: circle ? 12.w : 17.w,
          height: 12.w,
          // color: color,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(circle ? 6.r : 2.r)),
              color: color),
        ),
        Text(message)
      ],
    ),
  );
}
