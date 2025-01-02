import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int? id;
  final String name;
  final String email;

  User({this.id, required this.name, required this.email});

  // Chuyển đổi từ JSON thành User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] != null ? int.parse(json['id'].toString()) : null,
      name: json['name'],
      email: json['email'],
    );
  }

  // Chuyển đổi từ User object sang JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, if (id != null) 'id': id.toString()};
  }
}

class UserService {
  static const String apiUrl = 'http://10.0.2.2/api.php'; // API URL

  // Lấy danh sách tất cả người dùng (GET)
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('$apiUrl?table=users'), // Gửi yêu cầu GET tới table=users
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to fetch users: ${response.body}');
    }
  }

  // Thêm người dùng mới (POST)
  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('$apiUrl?table=users'), // Chỉ rõ POST đến table=users
      body: json.encode(user.toJson()), // Gửi dữ liệu dưới dạng JSON
      headers: {'Content-Type': 'application/json'}, // Thêm header JSON
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add user: ${response.body}');
    }
  }

  // Cập nhật người dùng (PUT)
  Future<void> updateUser(int id, User user) async {
    final response = await http.put(
      Uri.parse(
          '$apiUrl?table=users&id=$id'), // Chỉ rõ PUT đến id và table=users
      body: json.encode(user.toJson()), // Gửi dữ liệu dưới dạng JSON
      headers: {'Content-Type': 'application/json'}, // Thêm header JSON
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user: ${response.body}');
    }
  }

  // Xóa người dùng (DELETE)
  Future<void> deleteUser(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl?table=users&id=$id'), // Chỉ rõ DELETE đến id
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user: ${response.body}');
    }
  }
}
