import 'dart:convert';

EncryptModel mapServiceModelFromJson(String str) => EncryptModel.fromJson(json.decode(str));
class EncryptModel {
  String? ct;
  String? iv;
  String? s;

  EncryptModel({this.ct, this.iv, this.s});

  EncryptModel.fromJson(Map<String, dynamic> json) {
    ct = json['ct'];
    iv = json['iv'];
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ct'] = this.ct;
    data['iv'] = this.iv;
    data['s'] = this.s;
    return data;
  }
}


class EncryptRequestModel {
  String? ct;
  String? iv;
  String? s;
}