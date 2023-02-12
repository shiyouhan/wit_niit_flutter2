import 'package:flustars/flustars.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:wit_niit_flutter2/app/modules/message/model/contact_model.dart';
import 'package:wit_niit_flutter2/app/modules/message/model/group_history_data.dart';
import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../../mine/model/User.dart';

class MessageController extends GetxController {
  //TODO: Implement MessageController
  ///消息列表
  var messageList = [].obs;
  final avatar = ''.obs;

  //正在聊对象id
  var friendId = ''.obs;
//TODO: 通信
  var channel;
  void linkSocket() async {
    LogUtil.v('创建一个WebSocketChannel连接到一台服务器');
    var id = SpUtil.getString('id');
    print(id);
    channel =
        IOWebSocketChannel.connect(Uri.parse('${NetUrl.socket_HostName}/$id'));
    LogUtil.v('连接完成～～');
    channel.stream.listen((msg) {
      LogUtil.v('监听消息 ～～$msg');
      channel.sink.add('received!');
    });
  }

  void addMessage(data) {
    messageList.insert(0, data);
  }

  @override
  void onInit() {
    super.onInit();
    getContactsMessage();
  }

  @override
  void onReady() {
    super.onReady();
    linkSocket();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var contactList = <ContactModel>[].obs;
  /// 获取 Authing 用户池列表
  void getContactsMessage() async{
    String? myId = SpUtil.getString('id');
    // Map<String, dynamic> params = {"page": 1, "limit": 1};
    List res = await request.get('${NetUrl.kUrl_message}/getlist/$myId');
    res.forEach((e) {
      ContactModel contact = ContactModel.fromJson(e);
      contactList.add(contact);
    });
  }


}
