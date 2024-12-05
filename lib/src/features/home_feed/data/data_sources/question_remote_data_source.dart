import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/question_model.dart';

abstract class QuestionRemoteDataSource {
  Future<List<QuestionModel>> getQuestions();
}

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  @override
  Future<List<QuestionModel>> getQuestions() {
    // TODO: implement getQuestions
    return loadQuestionLocal();
  }

  Future<List<QuestionModel>> loadQuestionLocal() async {
    final String response = await rootBundle
        .loadString('lib/src/features/home_feed/data/data_sources/sample_data.json');
    final Map<String, dynamic> data = json.decode(response);

    final questions = (data['content'] as List)
        .map((item) => QuestionModel.fromJson(item))
        .toList();
    return questions;
  }
}
