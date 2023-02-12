// ignore_for_file: constant_identifier_names

class NetUrl {
  ///本地地址
  // static const String kHttp_HostName = 'http://192.168.50.241:8080/niit-api';

  ///测试

  ///正式
  static const String kHttp_HostName = "http://101.200.120.36:10000/api/v1";

  /// WebSocket
  static const String socket_HostName =
      "ws://121.40.208.79:10000/api/v1/websocket";

//  /登录
  static const String User_HostName = "http://101.200.120.36:8082/users";

  ///登录
  // static const String User_HostName = "http://121.40.208.79:8082/users";

  ///账户登录
  static const String kUrl_user_login = '/user/login';

  ///本地地址
  // static const String kHttp_HostName = 'http://192.168.50.241:8080/niit-api';

  ///验证码发送
  static const String send_mes = '/users/sendSms';

  ///手机号登陆
  static const String phone_login = '/users/phone';

  ///手机号注册
  static const String phone_Register = '/users/phoneRegister';

  ///手机号注册
  static const String Reset_Password = '/users/resetPwd';

  /**
   * 日程
   */

  //添加日程
  static const String addSchedule = '/schedule/addSchedule';

  //删除日程
  static const String deleteScheduleById = '/schedule/deleteScheduleById';

  //日程分页查
  static const String searchAllSchedule = '/schedule/searchAllSchedule';

  //日程更新
  static const String updateScheduleById = '/schedule/updateScheduleById';

  //日程模糊查询
  static const String searchSchedules = '/schedule/searchSchedules';

  //日程id查询
  static const String searchScheduleById = '/schedule/searchScheduleById';

  //根据id和日期查询schedule
  static const String searchScheduleByUserIdAndDate =
      '/schedule/searchScheduleByUserIdAndDate';

  /**
   * 智慧教室
   */

  //添加用户组
  static const String create_group = "/iot/manage/group/create";

  //用户组邀请
  static const String group_add = "/iot/manage/group/add";

  //获取设备类型
  static const String get_device_type = "/iot/manage/device/type";

  //获取用户所在的组
  static const String get_user_group = "/iot/manage/group/all";

  //根据id获取类型信息
  static const String get_device_detail_byID = "/iot/manage/device/type/";

  //创建场景
  static const String create_room = "/iot/manage/room/create";

  //添加设备
  static const String add_device = "/iot/manage/room/add-device";

  //获取设备信息
  static const String get_device_detail = "/iot/manage/room/devices";

  //空调控制
  static const String air_controller = "/operate/air";

  //led控制
  static const String led_controller = "/operate/led";

  /// 消息模块api
  static const String msg_HostName = "http://121.40.208.79:10000";

  /// 获取当前用户
  static const String get_user = "/users/getUser/";

  /// 修改手机号
  static const String change_phone = "/users/changPhone";

  // 修改用户资料
  static const String change_data = "/users/edit";

  // 获取通讯录类型分组
  static const String type_list = "/community/type/list";

  /**
   * 师生服务
   */
  static const String stu_report = "/shisheng/health";
  static const String teach_report = "/shisheng/health/teacher";

  ///消息模块
  static const String kUrl_message = 'http://121.40.208.79:10000/api/v1/ws';
}
