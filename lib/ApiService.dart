// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String apiUrl = 'http://10.0.2.2/api.php';

//   // Lấy danh sách người dùng từ API
//   Future<List<dynamic>> fetchUsers() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load users');
//     }
//   }

//   // Thêm người dùng mới
//   Future<void> addUser(String name, String email) async {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       body: {'name': name, 'email': email},
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to add user');
//     }
//   }

//   static Future<bool> deleteUser(int id) async {
//     final response = await http.post(
//       Uri.parse('$apiUrl/delete_user.php'),
//       body: json.encode({'id': id}),
//       headers: {'Content-Type': 'application/json'},
//     );
//     return response.statusCode == 200;
//   }
// }



// code mới 

import 'dart:convert';  
import 'package:http/http.dart' as http;  

class ApiService {  
  static const String apiUrl = 'http://10.0.2.2/api.php';  

  // Lấy danh sách người dùng từ API  
  Future<List<dynamic>> fetchUsers() async {  
    // Chỉnh sửa URL để chỉ rõ bảng là "users"  
    final response = await http.get(  
      Uri.parse('$apiUrl?table=users'), // Thêm `?table=users` vào URL  
    );  

    if (response.statusCode == 200) {  
      // Giải mã JSON phản hồi  
      return json.decode(response.body);  
    } else {  
      throw Exception('Failed to load users');  
    }  
  }  

  // Thêm người dùng mới (giữ nguyên)  
  Future<void> addUser(String name, String email) async {  
    final response = await http.post(  
      Uri.parse(apiUrl),  
      body: {'name': name, 'email': email},  
    );  

    if (response.statusCode != 200) {  
      throw Exception('Failed to add user');  
    }  
  }  

  // Xóa người dùng (giữ nguyên)  
  static Future<bool> deleteUser(int id) async {  
    final response = await http.post(  
      Uri.parse('$apiUrl/delete_user.php'),  
      body: json.encode({'id': id}),  
      headers: {'Content-Type': 'application/json'},  
    );  
    return response.statusCode == 200;  
  }  
}