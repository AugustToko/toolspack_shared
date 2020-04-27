/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-4-10 上午11:27
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */

import 'package:toolspackshared/model/student_info.dart';
import 'package:toolspackshared/model/pack_data.dart';

/// 为下单而准备的数据
class PrePayInfo {
  final List<StuObjInfo> dataList;

  final String orderText;

  final PackData packData;

  PrePayInfo(this.packData, this.orderText, this.dataList);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataList != null) {
      data['dataList'] = this.dataList.map((v) => v.toJson()).toList();
    }
    data['orderText'] = this.orderText;
    data['packData'] = this.packData.toJson();
    return data;
  }

}

/// 已经 **下单** 后的数据
class PayInfo {

  final PrePayInfo readPayInfo;

  final bool isBot;
  final bool needBoost;
  final double price;

  final String date;

  PayInfo(this.readPayInfo, this.isBot, this.needBoost, this.price, this.date);

  /// [PrePayInfo.dataList]
  /// [TargetCourseData.toString]
  /// [TargetCourseData.fullToString]
  String cartDataListToString({bool showPassword = false}) {
    var temp = '';
    var index = 0;
    readPayInfo.dataList.forEach((c) {
      ++index;
      temp += ('$index ' +
          (showPassword ? c.fullToString() : c.toString()) +
          (index == readPayInfo.dataList.length ? '\n' : '\n\n'));
    });
    return temp;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['readPayInfo'] = this.readPayInfo.toJson();
    data['isBot'] = this.isBot;
    data['needBoost'] = this.needBoost;
    data['price'] = this.price;
    return data;
  }

}
