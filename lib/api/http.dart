import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wechat/services/models/circle_friend.dart';

class ApiService {
  static Future<List<CircleFriendInfo>> list() async {
    var response =
        await Dio().get("http://192.168.4.43:9090/api/v1/find/circle-friend");
    if (response.statusCode == 200) {
      // var jsonString = response.data['result'];
      return circleFriendFromJson(json.encode(response.data));
    }
    return response.data;
  }
}
