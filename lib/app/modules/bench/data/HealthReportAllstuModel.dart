class HealthReportAllstuModel {
  int? id;
  String? healthId;
  String? userId;
  String? isHealthy;
  String? reportTime;
  String? position;
  String? address;
  String? isInSchool;
  String? isTest48;
  String? isAccinated;
  String? isSymptom10;
  String? isSuspectedCovid19;
  String? isConfirmedCovid19;
  String? isAsymptomaticInfection;
  String? isQuarantine;
  String? isTransitHignrisk;
  String? isStayHignrisk;
  String? isContactHighriskPersonnel;
  String? isGoAbroad;
  String? isContactOverseasPersonnel;
  String? isContactSickPeople;
  String? isInformedByTeacher;
  String? isResponsibleForAuthenticity;
  String? supplementaryNotes;
  Null? createdBy;
  String? createdTime;
  Null? updatedBy;
  String? updatedTime;

  HealthReportAllstuModel(
      {this.id,
      this.healthId,
      this.userId,
      this.isHealthy,
      this.reportTime,
      this.position,
      this.address,
      this.isInSchool,
      this.isTest48,
      this.isAccinated,
      this.isSymptom10,
      this.isSuspectedCovid19,
      this.isConfirmedCovid19,
      this.isAsymptomaticInfection,
      this.isQuarantine,
      this.isTransitHignrisk,
      this.isStayHignrisk,
      this.isContactHighriskPersonnel,
      this.isGoAbroad,
      this.isContactOverseasPersonnel,
      this.isContactSickPeople,
      this.isInformedByTeacher,
      this.isResponsibleForAuthenticity,
      this.supplementaryNotes,
      this.createdBy,
      this.createdTime,
      this.updatedBy,
      this.updatedTime});

  HealthReportAllstuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    healthId = json['healthId'];
    userId = json['userId'];
    isHealthy = json['isHealthy'];
    reportTime = json['reportTime'];
    position = json['position'];
    address = json['address'];
    isInSchool = json['isInSchool'];
    isTest48 = json['isTest48'];
    isAccinated = json['isAccinated'];
    isSymptom10 = json['isSymptom10'];
    isSuspectedCovid19 = json['isSuspectedCovid19'];
    isConfirmedCovid19 = json['isConfirmedCovid19'];
    isAsymptomaticInfection = json['isAsymptomaticInfection'];
    isQuarantine = json['isQuarantine'];
    isTransitHignrisk = json['isTransitHignrisk'];
    isStayHignrisk = json['isStayHignrisk'];
    isContactHighriskPersonnel = json['isContactHighriskPersonnel'];
    isGoAbroad = json['isGoAbroad'];
    isContactOverseasPersonnel = json['isContactOverseasPersonnel'];
    isContactSickPeople = json['isContactSickPeople'];
    isInformedByTeacher = json['isInformedByTeacher'];
    isResponsibleForAuthenticity = json['isResponsibleForAuthenticity'];
    supplementaryNotes = json['supplementaryNotes'];
    createdBy = json['createdBy'];
    createdTime = json['createdTime'];
    updatedBy = json['updatedBy'];
    updatedTime = json['updatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['healthId'] = this.healthId;
    data['userId'] = this.userId;
    data['isHealthy'] = this.isHealthy;
    data['reportTime'] = this.reportTime;
    data['position'] = this.position;
    data['address'] = this.address;
    data['isInSchool'] = this.isInSchool;
    data['isTest48'] = this.isTest48;
    data['isAccinated'] = this.isAccinated;
    data['isSymptom10'] = this.isSymptom10;
    data['isSuspectedCovid19'] = this.isSuspectedCovid19;
    data['isConfirmedCovid19'] = this.isConfirmedCovid19;
    data['isAsymptomaticInfection'] = this.isAsymptomaticInfection;
    data['isQuarantine'] = this.isQuarantine;
    data['isTransitHignrisk'] = this.isTransitHignrisk;
    data['isStayHignrisk'] = this.isStayHignrisk;
    data['isContactHighriskPersonnel'] = this.isContactHighriskPersonnel;
    data['isGoAbroad'] = this.isGoAbroad;
    data['isContactOverseasPersonnel'] = this.isContactOverseasPersonnel;
    data['isContactSickPeople'] = this.isContactSickPeople;
    data['isInformedByTeacher'] = this.isInformedByTeacher;
    data['isResponsibleForAuthenticity'] = this.isResponsibleForAuthenticity;
    data['supplementaryNotes'] = this.supplementaryNotes;
    data['createdBy'] = this.createdBy;
    data['createdTime'] = this.createdTime;
    data['updatedBy'] = this.updatedBy;
    data['updatedTime'] = this.updatedTime;
    return data;
  }
}
