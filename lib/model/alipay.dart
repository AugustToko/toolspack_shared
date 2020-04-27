/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-4-8 下午1:06
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */

import 'package:toolspackshared/model/payInfo.dart';

/// 阿里支付宝返回 json 实体类
/// 请勿修改
class AliPayResultNative {
  String code;
  String msg;
  String outTradeNo;
  String qrCode;

  AliPayResultNative({this.code, this.msg, this.outTradeNo, this.qrCode});

  AliPayResultNative.fromJson(Map<String, dynamic> json) {
    code = json['code'] as String;
    msg = json['msg'] as String;
    outTradeNo = json['out_trade_no'] as String;
    qrCode = json['qr_code'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['out_trade_no'] = this.outTradeNo;
    data['qr_code'] = this.qrCode;
    return data;
  }
}

/// [AliPayResultNative] 的包装
/// 用于解码 json
/// 存储支付宝调用二维码接口返回的数据
class AliPayResultNativeWrapper {
  AliPayResultNative aliPayResult;

  double price;

  /// 记录特征码，方便查询订单
  String spcode;

  /// See [PayInfo.cartDataListToString]
  String message;

  AliPayResultNativeWrapper.fromJson(Map<String, dynamic> json) {
    aliPayResult = AliPayResultNative.fromJson(json['aliPayResult']);
    message = json['message'];
    price = json['price'];
    spcode = json['spcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aliPayResult'] = this.aliPayResult.toJson();
    data['message'] = this.message;
    data['price'] = this.price;
    data['spcode'] = this.spcode;
    return data;
  }

  AliPayResultNativeWrapper(this.aliPayResult, this.price, this.spcode, this.message);
}
