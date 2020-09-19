import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:todo_list/model/todo.dart';

const Map<String, String> commonHeaders = {'Content-Type': 'application/json'};
final String baseUrl =
    Platform.isAndroid ? 'http://10.0.2.2:8989' : 'http://localhost:8989';

class NetworkClient {
  NetworkClient._();

  static NetworkClient _client = NetworkClient._();

  factory NetworkClient.instance() => _client;

  Future<String> login(String email, String password) async {
    String successResult = '';
    if (email.contains('@') && password.length >= 6) {
      if (email.contains('lazy')) {
        return Future.delayed(Duration(seconds: 2), () => successResult);
      }
      return Future.value(successResult);
    }
    String failedResult = '用户名或密码不正确';
    return failedResult;
  }

  Future<String> register(
    String email,
    String password, {
    File image,
  }) async {
    return '';
  }

  Future<String> uploadList(List<Todo> list, String userKey) async {
    return '';
  }

  Future<FetchListResult> fetchList(String userKey) async {
    FetchListResult result = FetchListResult.fromJson({
      'data': {
        'data': [
          {
            "id": "d5c84ab0-fa5c-11ea-bfb9-995fca0419d8",
            "title": "买早餐",
            "description": "豆浆和油条",
            "date": '1600444800000',
            "start_time": "0:0",
            "end_time": "0:0",
            "priority": 0,
            "is_finished": 0,
            "is_star": 0,
            "location_latitude": "0.0",
            "location_longitude": "0.0",
            "location_description": ""
          },
          {
            "id": "de88bd60-fa5c-11ea-bfb9-995fca0419d8",
            "title": "买午餐",
            "description": "小鸡炖蘑菇",
            "date": '1600444800000',
            "start_time": "0:0",
            "end_time": "0:0",
            "priority": 3,
            "is_finished": 0,
            "is_star": 0,
            "location_latitude": "0.0",
            "location_longitude": "0.0",
            "location_description": ""
          },
          {
            "id": "84d07d20-fa5d-11ea-bfb9-995fca0419d8",
            "title": "买晚餐",
            "description": "猪肉炖粉条",
            "date": '1600444800000',
            "start_time": "0:0",
            "end_time": "0:0",
            "priority": 3,
            "is_finished": 0,
            "is_star": 0,
            "location_latitude": "0.0",
            "location_longitude": "0.0",
            "location_description": ""
          }
        ],
        'timestamp': '1600509378000',
      },
    });
    return result;
  }
}

class FetchListResult {
  final List<Todo> data;
  final DateTime timestamp;
  final String error;

  FetchListResult({this.data, this.timestamp, this.error = ''});

  factory FetchListResult.fromJson(Map<dynamic, dynamic> json) {
    return FetchListResult(
      data: json['data']['data'].map<Todo>((e) => Todo.fromMap(e)).toList(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['data']['timestamp']),
      ),
    );
  }
}
