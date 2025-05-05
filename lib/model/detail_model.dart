import 'dart:convert';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

class DetailModel {
  String? status;
  DetailData? data;

  DetailModel({this.status, this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new DetailData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DetailData {
  Appeal? appeal;
  String? nextDate;
  String? appealStatus;
  List<InterimOrders>? interimOrders;
  List<InterimOrders>? finalOrders;

  DetailData(
      {this.appeal,
        this.nextDate,
        this.appealStatus,
        this.interimOrders,
        this.finalOrders});

  DetailData.fromJson(Map<String, dynamic> json) {
    appeal =
    json['appeal'] != null ? new Appeal.fromJson(json['appeal']) : null;
    nextDate = json['nextDate'];
    appealStatus = json['appealStatus'];
    if (json['interim_orders'] != null) {
      interimOrders = <InterimOrders>[];
      json['interim_orders'].forEach((v) {
        interimOrders!.add(new InterimOrders.fromJson(v));
      });
    }
    if (json['final_orders'] != null) {
      finalOrders = <InterimOrders>[];
      json['final_orders'].forEach((v) {
        finalOrders!.add(new InterimOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appeal != null) {
      data['appeal'] = this.appeal!.toJson();
    }
    data['nextDate'] = this.nextDate;
    data['appealStatus'] = this.appealStatus;
    if (this.interimOrders != null) {
      data['interim_orders'] =
          this.interimOrders!.map((v) => v.toJson()).toList();
    }
    if (this.finalOrders != null) {
      data['final_orders'] = this.finalOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appeal {
  int? appealId;
  String? trackingNumber;
  int? appealNo;
  int? appealYear;
  String? name;
  String? address;
  int? unitDistrict;
  String? dateCreated;
  String? status;
  String? statusDesc;
  String? appealSection;
  String? appealType;
  String? appealCategory;
  String? districtName;

  Appeal(
      {this.appealId,
        this.trackingNumber,
        this.appealNo,
        this.appealYear,
        this.name,
        this.address,
        this.unitDistrict,
        this.dateCreated,
        this.status,
        this.statusDesc,
        this.appealSection,
        this.appealType,
        this.appealCategory,
        this.districtName});

  Appeal.fromJson(Map<String, dynamic> json) {
    appealId = json['appeal_id'];
    trackingNumber = json['tracking_number'];
    appealNo = json['appeal_no'];
    appealYear = json['appeal_year'];
    name = json['name'];
    address = json['address'];
    unitDistrict = json['unit_district'];
    dateCreated = json['date_created'];
    status = json['status'];
    statusDesc = json['status_desc'];
    appealSection = json['appeal_section'];
    appealType = json['appeal_type'];
    appealCategory = json['appeal_category'];
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appeal_id'] = this.appealId;
    data['tracking_number'] = this.trackingNumber;
    data['appeal_no'] = this.appealNo;
    data['appeal_year'] = this.appealYear;
    data['name'] = this.name;
    data['address'] = this.address;
    data['unit_district'] = this.unitDistrict;
    data['date_created'] = this.dateCreated;
    data['status'] = this.status;
    data['status_desc'] = this.statusDesc;
    data['appeal_section'] = this.appealSection;
    data['appeal_type'] = this.appealType;
    data['appeal_category'] = this.appealCategory;
    data['district_name'] = this.districtName;
    return data;
  }
}

class InterimOrders {
  int? id;
  int? appealId;
  int? replyId;
  String? remarks;
  String? uploadFile;
  int? addedBy;
  String? addedByName;
  String? remarksType;
  String? orderDate;
  String? nextDate;
  String? typeOfDocument;
  String? createdAt;
  String? updatedAt;

  InterimOrders(
      {this.id,
        this.appealId,
        this.replyId,
        this.remarks,
        this.uploadFile,
        this.addedBy,
        this.addedByName,
        this.remarksType,
        this.orderDate,
        this.nextDate,
        this.typeOfDocument,
        this.createdAt,
        this.updatedAt});

  InterimOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appealId = json['appeal_id'];
    replyId = json['reply_id'];
    remarks = json['remarks'];
    uploadFile = json['upload_file'];
    addedBy = json['added_by'];
    addedByName = json['added_by_name'];
    remarksType = json['remarks_type'];
    orderDate = json['order_date'];
    nextDate = json['next_date'];
    typeOfDocument = json['type_of_document'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appeal_id'] = this.appealId;
    data['reply_id'] = this.replyId;
    data['remarks'] = this.remarks;
    data['upload_file'] = this.uploadFile;
    data['added_by'] = this.addedBy;
    data['added_by_name'] = this.addedByName;
    data['remarks_type'] = this.remarksType;
    data['order_date'] = this.orderDate;
    data['next_date'] = this.nextDate;
    data['type_of_document'] = this.typeOfDocument;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FinalOrders {
  int? id;
  int? appealId;
  int? replyId;
  String? remarks;
  String? uploadFile;
  int? addedBy;
  String? addedByName;
  String? remarksType;
  String? orderDate;
  String? nextDate;
  String? typeOfDocument;
  String? createdAt;
  String? updatedAt;

  FinalOrders(
      {this.id,
        this.appealId,
        this.replyId,
        this.remarks,
        this.uploadFile,
        this.addedBy,
        this.addedByName,
        this.remarksType,
        this.orderDate,
        this.nextDate,
        this.typeOfDocument,
        this.createdAt,
        this.updatedAt});

  FinalOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appealId = json['appeal_id'];
    replyId = json['reply_id'];
    remarks = json['remarks'];
    uploadFile = json['upload_file'];
    addedBy = json['added_by'];
    addedByName = json['added_by_name'];
    remarksType = json['remarks_type'];
    orderDate = json['order_date'];
    nextDate = json['next_date'];
    typeOfDocument = json['type_of_document'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appeal_id'] = this.appealId;
    data['reply_id'] = this.replyId;
    data['remarks'] = this.remarks;
    data['upload_file'] = this.uploadFile;
    data['added_by'] = this.addedBy;
    data['added_by_name'] = this.addedByName;
    data['remarks_type'] = this.remarksType;
    data['order_date'] = this.orderDate;
    data['next_date'] = this.nextDate;
    data['type_of_document'] = this.typeOfDocument;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}