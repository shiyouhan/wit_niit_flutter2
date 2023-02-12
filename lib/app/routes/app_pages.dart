import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/bindings/entrance_binding.dart';
import 'package:wit_niit_flutter2/app/modules/bench/bindings/leave_binding.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/entrance_view.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/leave_view.dart';
import 'package:wit_niit_flutter2/app/modules/login/views/start_view.dart';
import 'package:wit_niit_flutter2/app/modules/tools/views/micro_disk_view.dart';
import 'package:wit_niit_flutter2/app/modules/tools/views/school_calendar_view.dart';

import '../modules/bench/bindings/bench_binding.dart';
import '../modules/bench/views/bench_view.dart';
import '../modules/contacts/bindings/contacts_binding.dart';
import '../modules/contacts/views/contacts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/page.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/message/bindings/message_binding.dart';
// import '../modules/message/controllers/search_mess_controller.dart';
import '../modules/message/views/message_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';
import '../modules/tools/bindings/tools_binding.dart';
import '../modules/tools/views/calendar_view.dart';
import '../modules/tools/views/schedule_view.dart';
// import '../modules/tools/views/school_calendartools/views/smart_campus_view.dart';
import '../modules/tools/views/smart_campus_view.dart';
import '../modules/tools/views/tools_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.Leave,
      page: () => const LeaveView(),
      binding: LeaveBinding(),
    ),
    GetPage(
      name: _Paths.Entrance,
      page: () => const EntranceView(),
      binding: EntranceBinding(),
    ),
    GetPage(
      name: _Paths.PAGE,
      page: () => const page(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.MESSAGE,
        page: () => const MessageView(),
        binding: MessageBinding(),
        children: [
          // GetPage(
          //     name: '/search',
          //     page: () => SearchMessController()
          // )
        ]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BENCH,
      page: () => const BenchView(),
      binding: BenchBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTS,
      page: () => const ContactsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: _Paths.TOOLS,
      page: () => const ToolsView(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => TableComplexExample(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: _Paths.DISK,
      page: () => MicroDiskView(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: _Paths.S_CALENDAR,
      page: () => const ScheduleView(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: _Paths.SMART_CAMPUS,
      page: () => const SchoolCalendarView(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => SmartCampusView(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    // GetPage(
    //   name: _Paths.LIVE,
    //   page: () => const LiveView(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NOTICE,
    //   page: () => const NoticeView(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NETREPORT,
    //   page: () => const NetReportView(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.STULEAVE,
    //   page: () => const StuLeaveView(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TEALEAVE,
    //   page: () => const TeaLeaveView(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NIIT_NEWS,
    //   page: () => const NiitNews(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.O_INTO_APPLY,
    //   page: () => const OtherIntoApplication(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.T_INTO_APPLY,
    //   page: () => const TeachIntoApplication(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.S_HEALTH_REPORT,
    //   page: () => const StuHealthReport(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.T_HEALTH_REPORT,
    //   page: () => const TeachHealthReport(),
    //   binding: BenchBinding(),
    // ),
    // GetPage(name: _Paths.SEARCH, page: () => SearchView()),
    // GetPage(name: _Paths.ADDFRIEND, page: () => const AddFriendView()),
    GetPage(name: _Paths.START, page: () => const StartView()),
  ];
}
