import 'dart:convert';
import 'package:atg_assginment/models/lesson_model.dart';
import 'package:atg_assginment/models/program_model.dart';
import 'package:atg_assginment/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class ItemService {
  Future<LessonModel> lessonsList() async {
    final response = await http.get(Uri.parse(AppUrl.lessonEndpoint));
    final data = await jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return LessonModel.fromJson(data);
    } else {
      throw Exception('Error Occured while fetching');
    }
  }

  Future<ProgramModel> programsList() async {
    final response = await http.get(Uri.parse(AppUrl.programsEndpoint));
    final data = await jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProgramModel.fromJson(data);
    } else {
      throw Exception('Error Occured while fetching');
    }
  }
}
