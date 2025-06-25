import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static const baseUrl = 'http://192.168.1.33:8000/api';
  static final storage = FlutterSecureStorage();

  static Future<String?> getToken() async => await storage.read(key: 'token');

  static Future<bool> signup(String username, String password) async {

  final response = await http.post(
    Uri.parse('$baseUrl/signup/'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'username': username, 'password': password}),
  );
  return response.statusCode == 201;
}
  

  static Future<bool> login(String username, String password) async {
    print('Logging in with username: $username');
    print('Logging in with password: $password');
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      await storage.write(key: 'token', value: data['access']);
      return true;
    }
    return false;
  }

  static Future<List<dynamic>> getPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  static Future<Map<String, dynamic>> getPostDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$id/'));
    return json.decode(response.body);
  }

  static Future<bool> createPost(String title, String content) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/posts/create/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: json.encode({'title': title, 'content': content}),
    );
    return response.statusCode == 201 || response.statusCode == 200;
  }
}