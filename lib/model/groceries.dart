import 'dart:convert';

/// 杂货
class Groceries {
  /// 杂货代码
  String code;

  /// 杂货名称
  String name;

  /// 杂货信息
  String message;

  /// 杂货单价
  double price;

  String spcode;

  Groceries.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    message = json['message'];
    price = json['price'];
    spcode = json['spcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['name'] = name;
    data['message'] = message;
    data['price'] = price;
    data['spcode'] = spcode;
    return data;
  }

  Groceries(this.code, this.name, this.message, this.price, this.spcode);
}

class GroceriesList {
  List<Groceries> list;

  GroceriesList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = List<Groceries>();
      json['list'].forEach((v) {
        list.add(Groceries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }

  GroceriesList(this.list);
}

/// 用于发送到服务器的杂货任务
class GroceriesTask2Server {
  /// 杂货信息 [Groceries.code]
  String groceriesCode;

  /// 订单号
  String orderText;

  /// 备注
  String remarks;

  /// 特征码
  String spcode;

  double _price;
  double get price => _price;
  void setPrice(final double price) {
    _price = price;
  }

  GroceriesTask2Server(this.groceriesCode, this.orderText, this.remarks,
      this.spcode);

  GroceriesTask2Server.fromJson(Map<String, dynamic> json) {
    groceriesCode = json['groceriesCode'];
    orderText = json['orderText'];
    remarks = json['remarks'];
    spcode = json['spcode'];
    _price = json['_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groceriesCode'] = groceriesCode;
    data['orderText'] = orderText;
    data['remarks'] = remarks;
    data['spcode'] = spcode;
    data['_price'] = _price;
    return data;
  }
}