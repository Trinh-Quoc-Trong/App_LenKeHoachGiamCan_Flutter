import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizgame/models/question_model.dart';

class QuestionRepository {
  Future<List<Question>> getQuestion(int idTopic) async {
    final url = 'http://10.0.0.2/quiz-db/api.php?endpoint=questions&id=1';
    final response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['data'];
    List<Question> questions = List<Question>.from(
        data.map((e) => Question.fromJson(jsonEncode(e))).toList());
    return questions;
  }
}
