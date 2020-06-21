/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-6-21 下午7:04
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */

import 'package:toolspackshared/model/pack_data.dart';

/// 查课返回 json 实体类
class StudentInfoUnit {
  String status;
  StuObjInfo obj;
  int code;
  bool success;
  String msg;

  /// 手动添加平台信息
  @Deprecated('Use StuObjInfo.platformType')
  PlatformType _platformType;

  @Deprecated('Use StuObjInfo.platformType')
  set platformType(PlatformType p) {
    _platformType = p;
    obj.platformType = p;
  }

  @Deprecated('Use StuObjInfo.platformType')
  PlatformType get platformType => _platformType;

  StudentInfoUnit({this.status, this.obj, this.code, this.success, this.msg});

  StudentInfoUnit.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    obj = json['obj'] != null ? new StuObjInfo.fromJson(json['obj']) : null;
    code = json['code'];
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.obj != null) {
      data['obj'] = this.obj.toJson();
    }
    data['code'] = this.code;
    data['success'] = this.success;
    data['msg'] = this.msg;
    data['platformType'] = platformType.id;
    return data;
  }

  @override
  bool operator ==(other) {
    if (other == null) return false;
    if (!(other is StudentInfoUnit)) return false;
    final StudentInfoUnit s = other;
    return s.platformType == platformType &&
        s.obj.userName == obj.userName &&
        s.obj.account == obj.account &&
        s.obj.password == obj.password;
  }

  @override
  int get hashCode {
    return platformType.hashCode + obj.account.hashCode + obj.password.hashCode;
  }
}

class StuObjInfo {
  String phone;
  String schoolName;
  bool status;
  String msg;
  String password;
  String cookie;
  int statusCode;
  String userId;
  String userName;
  String account;
  List<CourseData> courseList;
  String schoolId;

  /// 手动添加平台信息
  PlatformType platformType;

  /// 手动添加已选课程
  List<CourseData> checkedCourseList = [];

  @override
  bool operator ==(other) {
    if (other == null) return false;
    if (!(other is StuObjInfo)) return false;
    final StuObjInfo s = other as StuObjInfo;
    return s.platformType == platformType &&
        s.userName == userName &&
        s.account == account &&
        s.password == password;
  }

  @override
  int get hashCode {
    return platformType.hashCode + account.hashCode + password.hashCode;
  }

  StuObjInfo(
      {phone,
      schoolName,
      status,
      msg,
      password,
      cookie,
      statusCode,
      userId,
      userName,
      account,
      courseList,
      schoolId});

  StuObjInfo.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] as String;
    schoolName = json['schoolName'] as String;
    status = json['status'] as bool;
    msg = json['msg'] as String;
    password = json['password'] as String;
    cookie = json['cookie'] as String;
    statusCode = json['statusCode'] as int;
    userId = json['userId'] as String;
    userName = json['userName'] as String;
    account = json['account'] as String;
    if (json['courseList'] != null) {
      courseList = new List<CourseData>();
      json['courseList'].forEach((v) {
        courseList.add(new CourseData.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['checkedCourseList'] != null) {
      checkedCourseList = new List<CourseData>();
      json['checkedCourseList'].forEach((v) {
        checkedCourseList
            .add(new CourseData.fromJson(v as Map<String, dynamic>));
      });
    }
    schoolId = json['schoolId'] as String;
    if (json['platformType'] != null) {
      platformType =
          PlatformType.fromJson(json['platformType'] as Map<String, dynamic>);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['schoolName'] = this.schoolName;
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['password'] = this.password;
    data['cookie'] = this.cookie;
    data['statusCode'] = this.statusCode;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['account'] = this.account;
    if (this.courseList != null) {
      data['courseList'] = this.courseList.map((v) => v.toJson()).toList();
    }
    data['schoolId'] = this.schoolId;
    if (platformType != null) {
      data['platformType'] = this.platformType.toJson();
    }
    data['checkedCourseList'] =
        this.checkedCourseList.map((v) => v.toJson()).toList();
    return data;
  }

  String getCheckedCourseListString() {
    return checkedCourseList
        .toString()
        .replaceAll(' ', '')
        .replaceAll(',', ',\n')
        .replaceAll('[', '')
        .replaceAll(']', '');
  }

  /// 等价于 [fullToString] 但是不显示密码 [StuObjInfo.password]
  @override
  String toString() {
    return '${platformType.name}: \n$schoolName $account $userName \n${getCheckedCourseListString()}';
  }

  /// 等价于 [toString] 但是显示密码 [StuObjInfo.password]
  String fullToString() {
    return '${platformType.name}: \n校名: $schoolName, 账号: $account, 密码:$password, 用户名: $userName, \n课程: ${getCheckedCourseListString()}';
  }
}

class CourseData {
  int unfinishedChapterCount;
  int examScore;
  ExamStartTime examStartTime;
  String serialId;
  String classId;
  String courseId;
  ExamStartTime courseEndTime;
  int courseState;
  int chapterCount;
  ExamStartTime courseStartTime;
  String courseStartTimeStr;
  String examEndTimeStr;
  String examStartTimeStr;
  ExamStartTime examEndTime;
  String courseEndTimeStr;
  int examState;
  int unfinishedJobCount;
  int jobCount;
  String courseName;

  CourseData(
      {unfinishedChapterCount,
      examScore,
      examStartTime,
      serialId,
      classId,
      courseId,
      courseEndTime,
      courseState,
      chapterCount,
      courseStartTime,
      courseStartTimeStr,
      examEndTimeStr,
      examStartTimeStr,
      examEndTime,
      courseEndTimeStr,
      examState,
      unfinishedJobCount,
      jobCount,
      courseName});

  @override
  bool operator ==(other) {
    if (other == null) return false;
    if (!(other is CourseData)) return false;
    CourseData o = other as CourseData;
    return o.courseName == courseName && o.courseId == courseId;
  }

  @override
  int get hashCode {
    return courseName.hashCode + courseId.hashCode;
  }

  @override
  String toString() {
    return courseName;
  }

  CourseData.fromJson(Map<String, dynamic> json) {
    unfinishedChapterCount = json['unfinishedChapterCount'] as int;
    examScore = json['examScore'] as int;
    examStartTime = json['examStartTime'] != null
        ? ExamStartTime.fromJson(json['examStartTime'] as Map<String, dynamic>)
        : null;
    serialId = json['serialId'] as String;
    classId = json['classId'] as String;
    courseId = json['courseId'] as String;
    courseEndTime = json['courseEndTime'] != null
        ? ExamStartTime.fromJson(json['courseEndTime'] as Map<String, dynamic>)
        : null;
    courseState = json['courseState'] as int;
    chapterCount = json['chapterCount'] as int;
    courseStartTime = json['courseStartTime'] != null
        ? ExamStartTime.fromJson(
            json['courseStartTime'] as Map<String, dynamic>)
        : null;
    courseStartTimeStr = json['courseStartTimeStr'] as String;
    examEndTimeStr = json['examEndTimeStr'] as String;
    examStartTimeStr = json['examStartTimeStr'] as String;
    examEndTime = json['examEndTime'] != null
        ? ExamStartTime.fromJson(json['examEndTime'] as Map<String, dynamic>)
        : null;
    courseEndTimeStr = json['courseEndTimeStr'] as String;
    examState = json['examState'] as int;
    unfinishedJobCount = json['unfinishedJobCount'] as int;
    jobCount = json['jobCount'] as int;
    courseName = json['courseName'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['unfinishedChapterCount'] = unfinishedChapterCount;
    data['examScore'] = examScore;
    if (examStartTime != null) {
      data['examStartTime'] = examStartTime.toJson();
    }
    data['serialId'] = serialId;
    data['classId'] = classId;
    data['courseId'] = courseId;
    if (courseEndTime != null) {
      data['courseEndTime'] = courseEndTime.toJson();
    }
    data['courseState'] = courseState;
    data['chapterCount'] = chapterCount;
    if (courseStartTime != null) {
      data['courseStartTime'] = courseStartTime.toJson();
    }
    data['courseStartTimeStr'] = courseStartTimeStr;
    data['examEndTimeStr'] = examEndTimeStr;
    data['examStartTimeStr'] = examStartTimeStr;
    if (examEndTime != null) {
      data['examEndTime'] = examEndTime.toJson();
    }
    data['courseEndTimeStr'] = courseEndTimeStr;
    data['examState'] = examState;
    data['unfinishedJobCount'] = unfinishedJobCount;
    data['jobCount'] = jobCount;
    data['courseName'] = courseName;
    return data;
  }
}

class ExamStartTime {
  ExamStartTime(
      {time, minutes, seconds, hours, month, year, timezoneOffset, day, date});

  int time;
  int minutes;
  int seconds;
  int hours;
  int month;
  int year;
  int timezoneOffset;
  int day;
  int date;

  ExamStartTime.fromJson(Map<String, dynamic> json) {
    time = json['time'] as int;
    minutes = json['minutes'] as int;
    seconds = json['seconds'] as int;
    hours = json['hours'] as int;
    month = json['month'] as int;
    year = json['year'] as int;
    timezoneOffset = json['timezoneOffset'] as int;
    day = json['day'] as int;
    date = json['date'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time'] = time;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
    data['hours'] = hours;
    data['month'] = month;
    data['year'] = year;
    data['timezoneOffset'] = timezoneOffset;
    data['day'] = day;
    data['date'] = date;
    return data;
  }
}

class CoursePack2Server {
  CoursePack2Server.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = List<StuObjInfo>();
      json['user'].forEach((v) {
        user.add(StuObjInfo.fromJson(v as Map<String, dynamic>));
      });
    }
    miaoshua = json['miaoshua'] as int;
    orderText = json['orderText'] as String;
    spcode = json['spcode'] as String;
    isBot = json['isBot'] as bool;
    _price = json['_price'] as double;
    couponCode = json['couponCode'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (user != null) {
      data['user'] = user.map((v) => v.toJson()).toList();
    }
    data['miaoshua'] = miaoshua;
    data['orderText'] = orderText;
    data['spcode'] = spcode;
    data['isBot'] = isBot;
    data['_price'] = _price;
    data['couponCode'] = couponCode;
    return data;
  }

  /// 订单价格
  /// 只能通过 [setPrice] 来手动设置
  /// 该字段仅用于记录
  /// For lingyunserver::_sendCourseData
  /// 用于计入数据库 _recordcoursedata 所用
  ///
  /// 通过服务器计算价格，然后设置此值。此值不应该于客户端进行任何操作！
  double _price;

  double get price => _price;

  void setPrice(double price) {
    _price = price;
  }

  List<StuObjInfo> user;

  /// 0 关闭
  /// 1 开启
  int miaoshua;

  /// 装饰
  bool isBot;

  /// 订单编号
  String orderText;

  /// 特征码
  String spcode;

  /// 优惠券代码, 可空
  String couponCode;


  CoursePack2Server(this.user, this.miaoshua, this.spcode, this.orderText,
      this.isBot, this.couponCode);
}

///------------------------------------------
class SendCourseResultList {
  List<SendCourseResult> results;

  SendCourseResultList(this.results);

  SendCourseResultList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<SendCourseResult>();
      json['results'].forEach((v) {
        results.add(new SendCourseResult.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SendCourseResult {
  SendCourseResult(
    this.code,
    this.status,
    this.msg,
    this.success,
    this.obj,
  );

  String status;
  StuObjInfo obj;
  int code;
  bool success;
  String msg;

  SendCourseResult.fromJson(Map<String, dynamic> json) {
    status = json['status'] as String;
    code = json['code'] as int;
    success = json['success'] as bool;
    msg = json['msg'] as String;
    if (json['obj'] != null) {
      obj = StuObjInfo.fromJson(json['obj'] as Map<String, dynamic>);
    }
  }

  Map toJson() {
    final Map map = {};
    map["status"] = status;
    if (obj != null) {
      map["obj"] = obj.toJson();
    }
    map["code"] = code;
    map["success"] = success;
    map["msg"] = msg;
    return map;
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
