class LeaveRecord {
  String? reason;
  bool? occupy;
  String? examine;
  String? type;
  String? userId;
  String? out;
  int? number;
  String? material;
  String? applicationTime;
  bool? draft;
  String? accommodation;
  int? days;
  String? createdTime;
  int? leaveId;
  String? deadline;
  String? destruction;

  LeaveRecord(
      {this.reason,
      this.occupy,
      this.examine,
      this.type,
      this.userId,
      this.out,
      this.number,
      this.material,
      this.applicationTime,
      this.draft,
      this.accommodation,
      this.days,
      this.createdTime,
      this.leaveId,
      this.deadline,
      this.destruction});

  LeaveRecord.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    occupy = json['occupy'];
    examine = json['examine'];
    type = json['type'];
    userId = json['userId'];
    out = json['out'];
    number = json['number'];
    material = json['material'];
    applicationTime = json['applicationTime'];
    draft = json['draft'];
    accommodation = json['accommodation'];
    days = json['days'];
    createdTime = json['createdTime'];
    leaveId = json['leaveId'];
    deadline = json['deadline'];
    destruction = json['destruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    data['occupy'] = this.occupy;
    data['examine'] = this.examine;
    data['type'] = this.type;
    data['userId'] = this.userId;
    data['out'] = this.out;
    data['number'] = this.number;
    data['material'] = this.material;
    data['applicationTime'] = this.applicationTime;
    data['draft'] = this.draft;
    data['accommodation'] = this.accommodation;
    data['days'] = this.days;
    data['createdTime'] = this.createdTime;
    data['leaveId'] = this.leaveId;
    data['deadline'] = this.deadline;
    data['destruction'] = this.destruction;
    return data;
  }
}
