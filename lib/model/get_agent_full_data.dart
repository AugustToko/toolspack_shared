/*
 * Project: tools_pack
 * Module: toolspack
 * Last Modified: 20-6-14 上午11:19
 * Copyright (c) 2020 August https://blog.geek-cloud.top/
 */

import 'dart:convert' as j;

import 'package:toolspack_shared/model/pack_data.dart';
import 'package:toolspack_shared/model/rec_course.dart';

class FullAgentData {
  AgentModelJsonPrivate agentModelJson;
  List<RecordCourse> orders;

  FullAgentData(this.agentModelJson, this.orders);

  FullAgentData.fromJson(Map<String, dynamic> json) {
    agentModelJson =
        AgentModelJsonPrivate.fromJson(j.json.decode(json['agentModelJson']));
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
