class GroupHistoryData {
  GroupHistoryData({
    required this.code,
    required this.msg,
    required this.data,
  });
  late final int code;
  late final String msg;
  late final List<Data> data;

  GroupHistoryData.fromJson(Map<String, dynamic> json){
    code = json['code'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.fromId,
    required this.pic,
    required this.name,
    required this.groupId,
    required this.content,
    required this.type,
    required this.createTime,
  });
  late final int id;
  late final String fromId;
  late final String pic;
  late final String name;
  late final String groupId;
  late final String content;
  late final int type;
  late final String createTime;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fromId = json['fromId'];
    pic = json['pic'];
    name = json['name'];
    groupId = json['groupId'];
    content = json['content'];
    type = json['type'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fromId'] = fromId;
    _data['pic'] = pic;
    _data['name'] = name;
    _data['groupId'] = groupId;
    _data['content'] = content;
    _data['type'] = type;
    _data['createTime'] = createTime;
    return _data;
  }
}