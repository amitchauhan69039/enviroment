import 'dart:convert';

FinalOrderListModel finalOrderListModelFromJson(String str) => FinalOrderListModel.fromJson(json.decode(str));

class FinalOrderListModel {
  String? status;
  List<FinalOrderListData>? data;

  FinalOrderListModel({this.status, this.data});

  FinalOrderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FinalOrderListData>[];
      json['data'].forEach((v) {
        data!.add(new FinalOrderListData.fromJson(v));
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

class FinalOrderListData {
  String? filePath;
  String? appealRegNo;
  String? appealRegYear;
  String? appealant;
  String? respondant;
  String? finalOrderDate;

  FinalOrderListData(
      {this.filePath,
        this.appealRegNo,
        this.appealRegYear,
        this.appealant,
        this.respondant,
        this.finalOrderDate});

  FinalOrderListData.fromJson(Map<String, dynamic> json) {
    filePath = json['file_path'];
    appealRegNo = json['appeal_reg_no'];
    appealRegYear = json['appeal_reg_year'];
    appealant = json['appealant'];
    respondant = json['respondant'];
    finalOrderDate = json['final_order_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_path'] = this.filePath;
    data['appeal_reg_no'] = this.appealRegNo;
    data['appeal_reg_year'] = this.appealRegYear;
    data['appealant'] = this.appealant;
    data['respondant'] = this.respondant;
    data['final_order_date'] = this.finalOrderDate;
    return data;
  }
}