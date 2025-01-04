import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryRepository {
  Future<List<Category>> getLanguage() async {
    const url = 'http://10.0.0.2/quiz-db/api.php?endpoint=languages';
    final response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['data'];
    List<Category> categories = List<Category>.from(
        data.map((e) => Category.fromJson(jsonEncode(e))).toList());
    return categories;
  }

  Future<List<Category>> getTopic(int id) async {
    final url = 'http://10.0.0.2/quiz-db/api.php?endpoint=topics&id=1';
    final response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['data'];
    List<Category> categories = List<Category>.from(
        data.map((e) => Category.fromJson(jsonEncode(e))).toList());
    return categories;
  }
}
