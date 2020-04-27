/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-4-7 下午6:15
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */


/// 阿里当面付查询订单返回的 json 实体类
class AliPayQueryResult {
  //no change
  String code;

  // nc
  String msg;
  String buyerLogonId;
  String buyerPayAmount;
  String buyerUserId;
  List<FundBillList> fundBillList;
  String invoiceAmount;
  String outTradeNo;
  String pointAmount;
  String receiptAmount;
  String sendPayDate;
  String totalAmount;
  String tradeNo;
  String tradeStatus;

  // 仅交易失败存在
  String subMsg = '';

  AliPayQueryResult(
      {this.code,
      this.msg,
      this.buyerLogonId,
      this.buyerPayAmount,
      this.buyerUserId,
      this.fundBillList,
      this.invoiceAmount,
      this.outTradeNo,
      this.pointAmount,
      this.receiptAmount,
      this.sendPayDate,
      this.totalAmount,
      this.tradeNo,
      this.tradeStatus,
      this.subMsg});

  AliPayQueryResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    buyerLogonId = json['buyer_logon_id'];
    buyerPayAmount = json['buyer_pay_amount'];
    buyerUserId = json['buyer_user_id'];
    if (json['fund_bill_list'] != null) {
      fundBillList = new List<FundBillList>();
      json['fund_bill_list'].forEach((v) {
        fundBillList.add(new FundBillList.fromJson(v));
      });
    }
    invoiceAmount = json['invoice_amount'];
    outTradeNo = json['out_trade_no'];
    pointAmount = json['point_amount'];
    receiptAmount = json['receipt_amount'];
    sendPayDate = json['send_pay_date'];
    totalAmount = json['total_amount'];
    tradeNo = json['trade_no'];
    tradeStatus = json['trade_status'];
    if (json['subMsg'] != null) {
      subMsg = json['subMsg'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['buyer_logon_id'] = this.buyerLogonId;
    data['buyer_pay_amount'] = this.buyerPayAmount;
    data['buyer_user_id'] = this.buyerUserId;
    if (this.fundBillList != null) {
      data['fund_bill_list'] =
          this.fundBillList.map((v) => v.toJson()).toList();
    }
    data['invoice_amount'] = this.invoiceAmount;
    data['out_trade_no'] = this.outTradeNo;
    data['point_amount'] = this.pointAmount;
    data['receipt_amount'] = this.receiptAmount;
    data['send_pay_date'] = this.sendPayDate;
    data['total_amount'] = this.totalAmount;
    data['trade_no'] = this.tradeNo;
    data['trade_status'] = this.tradeStatus;
    data['subMsg'] = this.subMsg;
    return data;
  }
}

class FundBillList {
  String amount;
  String fundChannel;

  FundBillList({this.amount, this.fundChannel});

  FundBillList.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    fundChannel = json['fund_channel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['fund_channel'] = this.fundChannel;
    return data;
  }
}
