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
      for(final i in j.json.decode(json['orders'])) {
        orders.add(RecordCourse.fromJson(i));

      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    data['agentModelJson'] = j.json.encode(agentModelJson);
    return data;
  }
}
