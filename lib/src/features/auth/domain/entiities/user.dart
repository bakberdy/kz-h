// class User{
//   final String id;
//   final String? fullName;
//   final String username;
//   final String? imageUrl;
//   final String email;
//   final int fireDays;
//   final bool wasPlayedYesterday;
//   final int questions;
//   final int score;
//   final int accuracy;

//   User({required this.id, required this.fullName, required this.username, this.imageUrl, required this.email, this.fireDays = 0, this.wasPlayedYesterday = false, required this.questions, this.score = 0, this.accuracy = 0});

// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? fullName,
    required String username,
    String? imageUrl,
    required String email,
    @Default(0) int fireDays,
    @Default(false) bool wasPlayedYesterday,
    @Default(0) int answeredQuestionsCount,
    @Default(0) int score,
    @Default(0) double accuracy,
    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? joinedDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

DateTime? _fromJsonDate(String? date) =>
    date == null ? null : DateTime.parse(date);

String? _toJsonDate(DateTime? date) => date?.toIso8601String();
