import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final Dio dio;
  QuestionRemoteDataSourceImpl({required this.dio});

  final URL = 'http://185.32.84.190/api/questions';

  @override
  Future<List<QuestionModel>> getQuestions() async {
    //return await loadQuestionLocal();
    try {
      final response = await dio.get(
        URL,
        queryParameters: {"limit": 5},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        final questions =
            (data as List).map((item) => QuestionModel.fromJson(item)).toList();

        return questions;
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        switch (dioError.response?.statusCode) {
          case 400:
            throw ServerException('Bad Request: Please check your input.');
          case 401:
            throw ServerException('Unauthorized: Please log in.');
          case 403:
            throw ServerException('Forbidden: Access is denied.');
          case 404:
            throw ServerException(
                'Not Found: The requested resource does not exist.');
          case 500:
            throw ServerException('Server error: Please try again later.');
          default:
            throw ServerException(
                'Unexpected error: ${dioError.response?.statusCode}');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<VariantModel>> answerToQuestion(
      String questionId, String selectedOption) async {
    try {
      final accessToken =
          await const FlutterSecureStorage().read(key: 'accessToken');
      final response = await dio.post('$URL/$questionId/answer',
          data: {
            "selectedOptions": [selectedOption]
          },
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((el) => VariantModel.fromJson(el)).toList();
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        switch (dioError.response?.statusCode) {
          case 400:
            throw ServerException('Bad Request: Please check your input.');
          case 401:
            throw ServerException('Unauthorized: Please log in.');
          case 403:
            throw ServerException('Forbidden: Access is denied.');
          case 404:
            throw ServerException(
                'Not Found: The requested resource does not exist.');
          case 500:
            throw ServerException('Server error: Please try again later.');
          default:
            throw ServerException(
                'Unexpected error: ${dioError.response?.statusCode}');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<QuestionModel>> getMistakes() async {
    try {
      final String accessToken = await const FlutterSecureStorage().read(key: 'accessToken')??'';
      final response = await dio.get(
        '$URL/mistakes',
        queryParameters: {"limit": 1000},
        options: Options(headers: {'Authorization':'Bearer $accessToken'})
      );


      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;


        final questions =
            (data as List).map((item) => QuestionModel.fromJson(item)).toList();
        return questions;
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        switch (dioError.response?.statusCode) {
          case 400:
            throw ServerException('Bad Request: Please check your input.');
          case 401:
            throw ServerException('Unauthorized: Please log in.');
          case 403:
            throw ServerException('Forbidden: Access is denied.');
          case 404:
            throw ServerException(
                'Not Found: The requested resource does not exist.');
          case 500:
            throw ServerException('Server error: Please try again later.');
          default:
            throw ServerException(
                'Unexpected error: ${dioError.response?.statusCode}');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<VariantModel>> answerToMistake(
      String mistakeQuestionId, String selectedOption) async {
    try {
      final accessToken =
          await const FlutterSecureStorage().read(key: 'accessToken');
      final response = await dio.post('$URL/mistakes/$mistakeQuestionId/answer',
          data: {
            "selectedOptions": [selectedOption]
          },
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      if (response.statusCode == 200||response.statusCode == 201) {
        final data = response.data as List;
        return data.map((el) => VariantModel.fromJson(el)).toList();
      } else {
        throw ServerException('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        switch (dioError.response?.statusCode) {
          case 400:
            throw ServerException('Bad Request: Please check your input.');
          case 401:
            throw ServerException('Unauthorized: Please log in.');
          case 403:
            throw ServerException('Forbidden: Access is denied.');
          case 404:
            throw ServerException(
                'Not Found: The requested resource does not exist.');
          case 500:
            throw ServerException('Server error: Please try again later.');
          default:
            throw ServerException(
                'Unexpected error: ${dioError.response?.statusCode}');
        }
      } else {
        throw ServerException('Network error: ${dioError.message}');
      }
    } catch (e) {
      rethrow;
    }
  }
}

//   Future<List<QuestionModel>> loadQuestionLocal() async {
//     final questions =
//         (a as List).map((item) => QuestionModel.fromJson(item)).toList();
//     await Future.delayed(const Duration(seconds: 2));
//     return questions;
//   }

//   Future<List<VariantModel>> loadVariantsLocal() async {
//     final questions =
//         (b as List).map((item) => VariantModel.fromJson(item)).toList();
//     await Future.delayed(const Duration(seconds: 2));
//     return questions;
//   }
// }

// var b = [
//   {"text": "string1", "selected": false, "correct": false},
//   {"text": "string2", "selected": true, "correct": true},
//   {"text": "string3", "selected": false, "correct": false},
//   {"text": "string4", "selected": false, "correct": false},
// ];
// var a = [
//   {
//     "questionId": "5",
//     "question": "What is the largest planet in our solar system?",
//     "topicName": "General Knowledge",
//     "topicIds": [
//       {"topicId": "1", "topicName": "General Knowledge"}
//     ],
//     "variants": [
//       {"text": "string1"},
//       {"text": "string2"},
//       {"text": "string3"},
//       {"text": "string4"}
//     ]
//   },
//   {
//     "questionId": "6",
//     "question": "What year did World War II end?",
//     "topicName": "General Knowledge",
//     "topicIds": [
//       {"topicId": "1", "topicName": "General Knowledge"}
//     ],
//     "variants": [
//       {"text": "string1"},
//       {"text": "string2"},
//       {"text": "string3"},
//       {"text": "string4"}
//     ]
//   },
//   {
//     "questionId": "7",
//     "question": "Who discovered gravity?",
//     "topicName": "General Knowledge",
//     "topicIds": [
//       {"topicId": "1", "topicName": "General Knowledge"}
//     ],
//     "variants": [
//       {"text": "string1"},
//       {"text": "string2"},
//       {"text": "string3"},
//       {"text": "string4"}
//     ]
//   },
//   {
//     "questionId": "8",
//     "question": "What is the currency of Japan?",
//     "topicName": "General Knowledge",
//     "topicIds": [
//       {"topicId": "1", "topicName": "General Knowledge"}
//     ],
//     "variants": [
//       {"text": "string1"},
//       {"text": "string2"},
//       {"text": "string3"},
//       {"text": "string4"}
//     ]
//   },
//   {
//     "questionId": "9",
//     "question": "What does DNA stand for?",
//     "topicName": "General Knowledge",
//     "topicIds": [
//       {"topicId": "1", "topicName": "General Knowledge"}
//     ],
//     "variants": [
//       {"text": "string1"},
//       {"text": "string2"},
//       {"text": "string3"},
//       {"text": "string4"}
//     ]
//   },
//   {
//     "questionId": "10",
//     "question": "What is the square root of 144?",
//     "topicName": "General Knowledge",
//     "topicIds": [
//       {"topicId": "1", "topicName": "General Knowledge"}
//     ],
//     "variants": [
//       {"text": "string1"},
//       {"text": "string2"},
//       {"text": "string3"},
//       {"text": "string4"}
//     ]
//   }
// ];
