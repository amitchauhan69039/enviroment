import 'dart:convert';

CauseListModel causeListModelFromJson(String str) => CauseListModel.fromJson(json.decode(str));
class CauseListModel {
  String? status;
  List<CauseListData>? data;

  CauseListModel({this.status, this.data});

  CauseListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CauseListData>[];
      json['data'].forEach((v) {
        data!.add(new CauseListData.fromJson(v));
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


class CauseListData {
  String? listing_date;
  String? file_path;

  CauseListData({this.listing_date, this.file_path});

  CauseListData.fromJson(Map<String, dynamic> json) {
    listing_date = json['listing_date'];
    file_path = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing_date'] = this.listing_date;
    data['file_path'] = this.file_path;
    return data;
  }
}