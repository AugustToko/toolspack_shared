/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-5-17 上午10:30
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */

import 'dart:convert' as j;

import 'package:toolspackshared/model/pack_data.dart';
import 'package:toolspackshared/model/rec_course.dart';

class FullAgentData {
  AgentModelJson agentModelJson;
  List<RecordCourse> orders;

  FullAgentData(this.agentModelJson, this.orders);

  FullAgentData.fromJson(Map<String, dynamic> json) {
    agentModelJson =
        AgentModelJson.fromJson(j.json.decode(json['agentModelJson']));
    if (json['orders'] != null) {
      orders = new List<RecordCourse>();
      for (final i in json['orders']) {
        orders.add(RecordCourse.fromJson(j.json.decode(i)));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
//      data['orders'] = this.orders.map((v) => v.toJson()).toList();
      data['orders'] =
          this.orders.map((v) => j.json.encode(v.toJson())).toList();
    }
    data['agentModelJson'] = j.json.encode(agentModelJson);
    return data;
  }
}
