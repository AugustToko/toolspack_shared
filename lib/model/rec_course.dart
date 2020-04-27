import 'dart:convert' as j;

import 'package:toolspackshared/model/student_info.dart';

class RecordCourse {
  /// 订单信息
  String orderText;

  String price;
  bool isBot;
  bool needBoost;

  /// 使用 json 保存 [StuObjInfo]
  StuObjInfo stuObj;

  String spcode;

  /// 时间
  String time;

  Map<String, dynamic> toJson() {
    return {
      'orderText': orderText,
//      'stuObj': j.json.encode(stuObj),
      'price': price,
      'isBot': isBot,
      'needBoost': needBoost,
      'spcode': spcode,
      'time': time,
    };
  }

  RecordCourse.fromJson(Map<String, dynamic> json) {
    orderText = json['orderText'] as String;
//    stuObj = StuObjInfo.fromJson(j.json.decode(json['stuObj']));
    time = json['time'] as String;
    spcode = json['spcode'] as String;
    needBoost = json['needBoost'] as bool;
    isBot = json['isBot'] as bool;
    price = json['price'];
  }

  @override
  String toString() {
    return j.json.encode(this);
  }
}