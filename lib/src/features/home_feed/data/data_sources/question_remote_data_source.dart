import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kz_h/src/core/dio/dio_client.dart';
import 'package:kz_h/src/core/error/exceptions.dart';
import 'package:kz_h/src/features/home_feed/data/models/variant_model.dart';

import '../models/question_model.dart';

abstract class QuestionRemoteDataSource {
  Future<List<QuestionModel>> getQuestions();
  Future<List<VariantModel>> answerToQuestion(
      String quesitonId, String selectedOption);
  Future<List<QuestionModel>> getMistakes();
  Future<List<VariantModel>> answerToMistake(
      String quesitonId, String selectedOption);
}

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  final DioClient dioClient;
  QuestionRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<QuestionModel>> getQuestions() async {
    //return await loadQuestionLocal();
    final response = await dioClient.get(
      '/questions',
      queryParameters: {"limit": 5},
    );

    final data = response.data;

    final questions =
        (data as List).map((item) => QuestionModel.fromJson(item)).toList();

    return questions;
  }

  @override
  Future<List<VariantModel>> answerToQuestion(
      String questionId, String selectedOption) async {
    final accessToken =
        await const FlutterSecureStorage().read(key: 'accessToken');
    final response = await dioClient.post('/questions/$questionId/answer',
        data: {
          "selectedOptions": [selectedOption]
        },
        headers: accessToken != null
            ? {'Authorization': 'Bearer $accessToken'}
            : null);

    final data = response.data as List;
    return data.map((el) => VariantModel.fromJson(el)).toList();
  }

  @override
  Future<List<QuestionModel>> getMistakes() async {
    final String? accessToken =
        await const FlutterSecureStorage().read(key: 'accessToken');
    if (accessToken == null || accessToken == '') {
      throw AuthException('Unauthorized');
    } else {
      final response = await dioClient.get('/questions/mistakes',
          queryParameters: {"limit": 1000},
          headers: {'Authorization': 'Bearer $accessToken'});

      final data = response.data;

      final questions =
          (data as List).map((item) => QuestionModel.fromJson(item)).toList();
      return questions;
    }
  }

  @override
  Future<List<VariantModel>> answerToMistake(
      String mistakeQuestionId, String selectedOption) async {
    final accessToken =
        await const FlutterSecureStorage().read(key: 'accessToken');
    final response = await dioClient
        .post('/questions/mistakes/$mistakeQuestionId/answer', data: {
      "selectedOptions": [selectedOption]
    }, headers: {
      'Authorization': 'Bearer $accessToken'
    });

    final data = response.data as List;
    return data.map((el) => VariantModel.fromJson(el)).toList();
  }
}
