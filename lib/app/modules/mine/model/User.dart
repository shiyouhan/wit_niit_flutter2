class User {
  User({
    required this.gender,
    this.email,
    required this.id,
    required this.phone,
    required this.name,
    required this.photo,
    required this.roleList,
    required this.sno,
    required this.classes,
    required this.college,
    this.address,
    required this.teacherPhone,
    required this.teacherName,
  });

  late final String gender;
  late final Null email;
  late final String id;
  late final String phone;
  late final String name;
  late final String photo;
  late final List<dynamic> roleList;
  late final String sno;
  late final String classes;
  late final String college;
  late final Null address;
  late final String teacherPhone;
  late final String teacherName;

  User.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    email = json['email'];
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    photo = json['photo'];
    roleList = List.castFrom<dynamic, dynamic>(json['roleList']);
    sno = json['sno'];
    classes = json['classes'];
    college = json['college'];
    address = json['address'];
    teacherPhone = json['teacherPhone'];
    teacherName = json['teacherName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gender'] = gender;
    _data['email'] = email;
    _data['id'] = id;
    _data['phone'] = phone;
    _data['name'] = name;
    _data['photo'] = photo;
    _data['roleList'] = roleList;
    _data['sno'] = sno;
    _data['classes'] = classes;
    _data['college'] = college;
    _data['address'] = address;
    _data['teacherPhone'] = teacherPhone;
    _data['teacherName'] = teacherName;
    return _data;
  }
}
