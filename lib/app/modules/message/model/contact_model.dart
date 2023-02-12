

///列表的数据
class ContactModel {
  ContactModel({
    required this.userId,
    required this.itemId,
    required this.avatar,
    required this.nickname,
    required this.type,
    required this.lastTime,
    required this.lastMsg,
  });
  late final String userId;
  late final String itemId;
  late final String avatar;
  late final String nickname;
  late final int type;
  late final String lastTime;
  late final String lastMsg;

  ContactModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    itemId = json['itemId'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    type = json['type'];
    lastTime = json['lastTime'];
    lastMsg = json['lastMsg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['itemId'] = itemId;
    _data['avatar'] = avatar;
    _data['nickname'] = nickname;
    _data['type'] = type;
    _data['lastTime'] = lastTime;
    _data['lastMsg'] = lastMsg;
    return _data;
  }

  @override
  String toString() {
    return 'userId: $userId, itemId: $itemId, avatar: $avatar, nickname: $nickname, type: $type, lastTime: $lastTime, lastMsg: $lastMsg';
  }
}