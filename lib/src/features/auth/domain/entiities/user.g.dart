// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      username: json['username'] as String,
      imageUrl: json['imageUrl'] as String?,
      email: json['email'] as String,
      fireDays: (json['fireDays'] as num?)?.toInt() ?? 0,
      wasPlayedYesterday: json['wasPlayedYesterday'] as bool? ?? false,
      answeredQuestionsCount:
          (json['answeredQuestionsCount'] as num?)?.toInt() ?? 0,
      score: (json['score'] as num?)?.toInt() ?? 0,
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0,
      joinedDate: _fromJsonDate(json['joinedDate'] as String?),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
      'fireDays': instance.fireDays,
      'wasPlayedYesterday': instance.wasPlayedYesterday,
      'answeredQuestionsCount': instance.answeredQuestionsCount,
      'score': instance.score,
      'accuracy': instance.accuracy,
      'joinedDate': _toJsonDate(instance.joinedDate),
    };
