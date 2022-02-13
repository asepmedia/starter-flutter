import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/services/http_service.dart';
import 'package:http/http.dart' as http;

class TaskService {
  Future<List<Task>> fetchTask() async {
    List<Task> _lists = [];
    HttpService httpService = HttpService();
    var url = httpService.url("/api/v2/products");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponses = json.decode(response.body) as Map<String, dynamic>;
        var results = jsonResponses['data']['data'] as List<dynamic>;
        results.map((row) {
          _lists.add(Task.fromJson(row));
        }).toList();
      }
    } catch (error) {
      rethrow;
    }
    return _lists;
  }
}
