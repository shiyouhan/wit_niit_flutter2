class LeaveFromModel {
  String? userId;
  List<int>? teacherId;
  String? createdTime;
  String? deadline;
  String? applicationTime;
  String? type;
  bool? overnight;
  String? reason;
  String? number;
  bool? occupy;
  bool? out;
  String? material;
  bool? examine;
  int? days;
  bool? destruction;
  bool? draft;

  LeaveFromModel(
      {this.userId,
      this.createdTime,
      this.deadline,
      this.applicationTime,
      this.type,
      this.overnight,
      this.reason,
      this.number,
      this.occupy,
      this.out,
      this.material,
      this.examine,
      this.days,
      this.destruction,
      this.draft,
      this.teacherId});
}
