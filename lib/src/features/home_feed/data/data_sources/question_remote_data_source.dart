import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/question_model.dart';

abstract class QuestionRemoteDataSource {
  Future<List<QuestionModel>> getQuestions();
}

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  @override
  Future<List<QuestionModel>> getQuestions() {
    return loadQuestionLocal();
  }

  Future<List<QuestionModel>> loadQuestionLocal() async {
    final String response = await rootBundle
        .loadString('lib/src/features/home_feed/data/data_sources/sample_data.json');
    final Map<String, dynamic> data = json.decode(response);

    final questions = (data['content'] as List)
        .map((item) => QuestionModel.fromJson(item))
        .toList();
    await Future.delayed(const Duration(seconds: 2));
    return questions;
  }
}



var a = [{
      "questionId": "5",
      "question": "What is the largest planet in our solar system?",
      "topicName": "General Knowledge",
      "topicIds": [
        {
          "topicId": "1",
          "topicName": "General Knowledge"
        }
      ],
      "variants": [
        {
          "text": "Jupiter",
          "correct": true
        },
        {
          "text": "Saturn",
          "correct": false
        },
        {
          "text": "Earth",
          "correct": false
        },
        {
          "text": "Mars",
          "correct": false
        }
      ]
    },
    {
      "questionId": "6",
      "question": "What year did World War II end?",
      "topicName": "General Knowledge",
      "topicIds": [
        {
          "topicId": "1",
          "topicName": "General Knowledge"
        }
      ],
      "variants": [
        {
          "text": "1945",
          "correct": true
        },
        {
          "text": "1939",
          "correct": false
        },
        {
          "text": "1941",
          "correct": false
        },
        {
          "text": "1950",
          "correct": false
        }
      ]
    },
    {
      "questionId": "7",
      "question": "Who discovered gravity?",
      "topicName": "General Knowledge",
      "topicIds": [
        {
          "topicId": "1",
          "topicName": "General Knowledge"
        }
      ],
      "variants": [
        {
          "text": "Isaac Newton",
          "correct": true
        },
        {
          "text": "Albert Einstein",
          "correct": false
        },
        {
          "text": "Galileo Galilei",
          "correct": false
        },
        {
          "text": "Niels Bohr",
          "correct": false
        }
      ]
    },
    {
      "questionId": "8",
      "question": "What is the currency of Japan?",
      "topicName": "General Knowledge",
      "topicIds": [
        {
          "topicId": "1",
          "topicName": "General Knowledge"
        }
      ],
      "variants": [
        {
          "text": "Yen",
          "correct": true
        },
        {
          "text": "Won",
          "correct": false
        },
        {
          "text": "Dollar",
          "correct": false
        },
        {
          "text": "Euro",
          "correct": false
        }
      ]
    },
    {
      "questionId": "9",
      "question": "What does DNA stand for?",
      "topicName": "General Knowledge",
      "topicIds": [
        {
          "topicId": "1",
          "topicName": "General Knowledge"
        }
      ],
      "variants": [
        {
          "text": "Deoxyribonucleic Acid",
          "correct": true
        },
        {
          "text": "Deoxyribonitrogen Acid",
          "correct": false
        },
        {
          "text": "Dioxyribonucleic Acid",
          "correct": false
        },
        {
          "text": "Deoxynucleic Acid",
          "correct": false
        }
      ]
    },
    {
      "questionId": "10",
      "question": "What is the square root of 144?",
      "topicName": "General Knowledge",
      "topicIds": [
        {
          "topicId": "1",
          "topicName": "General Knowledge"
        }
      ],
      "variants": [
        {
          "text": "12",
          "correct": true
        },
        {
          "text": "14",
          "correct": false
        },
        {
          "text": "16",
          "correct": false
        },
        {
          "text": "18",
          "correct": false
        }
      ]
    }];
