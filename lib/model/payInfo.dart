/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-6-15 下午2:47
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */

import 'package:toolspack_shared/model/pack_data.dart';
import 'package:toolspack_shared/model/student_info.dart';

/// 为下单而准备的数据
class PrePayInfo {
  /// 课程
  final List<StuObjInfo> dataList;

  /// 订单号
  final String orderText;

  /// packData
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

  /// 预下单数据
  final PrePayInfo readPayInfo;

  /// 是否机器
  final bool isBot;

  /// 是否加急
  final bool needBoost;

  /// 价格
  final double price;

  /// 日期
  final String date;

  /// 优惠券
  String couponCode;

  PayInfo(this.readPayInfo, this.isBot, this.needBoost, this.price, this.date,
      this.couponCode);

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
    data['couponCode'] = this.couponCode;
    return data;
  }

}
