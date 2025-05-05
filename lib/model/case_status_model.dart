import 'dart:convert';

CaseStatusModel caseStatusModelFromJson(String str) => CaseStatusModel.fromJson(json.decode(str));

class CaseStatusModel {
  String? status;
  List<CaseStatusData>? data;

  CaseStatusModel({this.status, this.data});

  CaseStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CaseStatusData>[];
      json['data'].forEach((v) {
        data!.add(new CaseStatusData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaseStatusData {
  String? trackingNumber;
  int? appealNo;
  int? appealYear;
  String? unitName;
  int? id;
  String? dateCreated;
  String? status;
  String? statusDesc;
  String? appealSection;
  String? appealType;
  String? appealCategory;
  String? advocate_name;

  CaseStatusData(
      {this.trackingNumber,
        this.appealNo,
        this.appealYear,
        this.unitName,
        this.id,
        this.dateCreated,
        this.status,
        this.statusDesc,
        this.appealSection,
        this.appealType,
        this.appealCategory,
      this.advocate_name});

  CaseStatusData.fromJson(Map<String, dynamic> json) {
    trackingNumber = json['tracking_number'];
    appealNo = json['appeal_no'];
    appealYear = json['appeal_year'];
    unitName = json['unit_name'];
    id = json['id'];
    dateCreated = json['date_created'];
    status = json['status'];
    statusDesc = json['status_desc'];
    appealSection = json['appeal_section'];
    appealType = json['appeal_type'];
    appealCategory = json['appeal_category'];
    advocate_name = json['advocate_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_number'] = this.trackingNumber;
    data['appeal_no'] = this.appealNo;
    data['appeal_year'] = this.appealYear;
    data['unit_name'] = this.unitName;
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['status'] = this.status;
    data['status_desc'] = this.statusDesc;
    data['appeal_section'] = this.appealSection;
    data['appeal_type'] = this.appealType;
    data['appeal_category'] = this.appealCategory;
    data['advocate_name'] = this.advocate_name;
    return data;
  }
}