/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-4-11 上午9:39
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */

import 'package:toolspackshared/model/groceries.dart';

class PlatformType {
  PlatformType(this.id, this.name);

  int id;

  String name;

  PlatformType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
  }

  Map toJson() {
    final Map map = {};
    map["id"] = id;
    map["name"] = name;
    return map;
  }

  @override
  String toString() {
    return 'ID: $id, Name: $name';
  }

  static PlatformType getPlatform(final PackData packData, final String name) {
    if (packData == null || packData.platforms.length == 0 || name == null || name.trim().isEmpty) {
      return null;
    }

    PlatformType platformType;

    packData.platforms.forEach((p){
      if (p.name == name) {
        platformType = p;
      }
    });

    return platformType;
  }

//  @override
//  bool operator ==(other) {
//    if (other == null) return false;
//    if (other is PlatformType) {
//      PlatformType o = other;
//      return o.id == id;
//    } else {
//      return false;
//    }
//  }

//  @override
//  int get hashCode {
//    return id;
//  }
}

class PackData {
  /// 轮播图
  List<Banners> banners;

  /// 支持平台分类
  List<CategoryJson> categories;

  /// 预览价格（手动）
  double previewManualPrice;

  /// 公告
  String notice;

  /// 远端 APP 版本
  int versionCode;

  /// 支持平台列表
  List<PlatformType> platforms;

  // 代理人信息
  AgentModelJson agentModel;

  PackData(
      {this.banners,
      this.categories,
      this.previewManualPrice,
      this.notice,
      this.versionCode,
      this.platforms,
      this.agentModel});

  PackData.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<CategoryJson>();
      json['categories'].forEach((v) {
        categories.add(new CategoryJson.fromJson(v));
      });
    }
    if (json['platforms'] != null) {
      platforms = new List<PlatformType>();
      json['platforms'].forEach((v) {
        platforms.add(new PlatformType.fromJson(v));
      });
    }
    previewManualPrice = json['previewManualPrice'];
    notice = json['notice'];
    versionCode = json['versionCode'];
    agentModel = AgentModelJson.fromJson(json['agentModel']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['previewManualPrice'] = this.previewManualPrice;
    data['notice'] = this.notice;
    data['versionCode'] = this.versionCode;
    data['agentModel'] = agentModel.toJson();
    return data;
  }
}

class Banners {
  int id;
  String title;
  String assetUrl;
  String subTitle;
  String messageText;
  String assetAuthorName;
  String publisher;
  String onTapAction;

  Banners(
      {this.id,
      this.title,
      this.assetUrl,
      this.subTitle,
      this.messageText,
      this.assetAuthorName,
      this.publisher,
      this.onTapAction});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    assetUrl = json['assetUrl'];
    subTitle = json['subTitle'];
    messageText = json['messageText'];
    assetAuthorName = json['assetAuthorName'];
    publisher = json['publisher'];
    onTapAction = json['onTapAction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['assetUrl'] = this.assetUrl;
    data['subTitle'] = this.subTitle;
    data['messageText'] = this.messageText;
    data['assetAuthorName'] = this.assetAuthorName;
    data['publisher'] = this.publisher;
    data['onTapAction'] = this.onTapAction;
    return data;
  }
}

class CategoryJson {
  String title;
  String contentText;
  int lessonCount;
  double money;
  double rating;
  String imagePath;

  CategoryJson(
      {this.title,
      this.contentText,
      this.lessonCount,
      this.money,
      this.rating,
      this.imagePath});

  CategoryJson.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    contentText = json['contentText'];
    lessonCount = json['lessonCount'];
    money = json['money'];
    rating = json['rating'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['contentText'] = this.contentText;
    data['lessonCount'] = this.lessonCount;
    data['money'] = this.money;
    data['rating'] = this.rating;
    data['imagePath'] = this.imagePath;
    return data;
  }
}

class AgentModelJson {
  /// 价格
  /// 1 超星
  /// 2 智慧树
  /// 3 高校邦
  /// 5 名华
  /// 6 中国大学MOOC
  /// 7 优学院
  /// 8 云课堂智慧职教
  /// 12 u校园
  /// 14 创就业云课堂
  ///
  /// [otherPrice] 其他平台价格
  double otherPrice;

  double priceP1;

  double priceP2;

  double priceP3;

  double priceP5;

  double priceP6;

  double priceP7;

  double priceP8;

  double priceP12;

  double priceP14;

  /// 杂货
  /// see [Groceries]
  String groceries;

  /// 特征码
  String spcode;

  /// 总卖出的金钱
  double totalEarned;

  /// 代理的备注 （一般存储联系方式）
  /// 代理不可修改、获取
  /// 供管理员查看
//  String note;

  /// 密码
//  String password;

  AgentModelJson.fromJson(Map<String, dynamic> json) {
    otherPrice = json['otherPrice'];
    spcode = json['spcode'];
    priceP1 = json['priceP1'];
    priceP2 = json['priceP2'];
    priceP3 = json['priceP3'];
    priceP5 = json['priceP5'];
    priceP6 = json['priceP6'];
    priceP7 = json['priceP7'];
    priceP8 = json['priceP8'];
    priceP12 = json['priceP12'];
    priceP14 = json['priceP14'];
    spcode = json['spcode'];
    groceries = json['groceries'];
    totalEarned = json['totalEarned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceP1'] = this.priceP1;
    data['priceP2'] = this.priceP2;
    data['priceP3'] = this.priceP3;
    data['priceP5'] = this.priceP5;
    data['priceP6'] = this.priceP6;
    data['priceP7'] = this.priceP7;
    data['priceP8'] = this.priceP8;
    data['priceP12'] = this.priceP12;
    data['priceP12'] = this.priceP14;
    data['otherPrice'] = this.otherPrice;
    data['spcode'] = this.spcode;
    data['groceries'] = this.groceries;
    data['totalEarned'] = this.totalEarned;
    return data;
  }
}
