// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get fireDays => throw _privateConstructorUsedError;
  bool get wasPlayedYesterday => throw _privateConstructorUsedError;
  int get questions => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get accuracy => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String username,
      String? imageUrl,
      String email,
      int fireDays,
      bool wasPlayedYesterday,
      int questions,
      int score,
      int accuracy});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? username = null,
    Object? imageUrl = freezed,
    Object? email = null,
    Object? fireDays = null,
    Object? wasPlayedYesterday = null,
    Object? questions = null,
    Object? score = null,
    Object? accuracy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fireDays: null == fireDays
          ? _value.fireDays
          : fireDays // ignore: cast_nullable_to_non_nullable
              as int,
      wasPlayedYesterday: null == wasPlayedYesterday
          ? _value.wasPlayedYesterday
          : wasPlayedYesterday // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String username,
      String? imageUrl,
      String email,
      int fireDays,
      bool wasPlayedYesterday,
      int questions,
      int score,
      int accuracy});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? username = null,
    Object? imageUrl = freezed,
    Object? email = null,
    Object? fireDays = null,
    Object? wasPlayedYesterday = null,
    Object? questions = null,
    Object? score = null,
    Object? accuracy = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fireDays: null == fireDays
          ? _value.fireDays
          : fireDays // ignore: cast_nullable_to_non_nullable
              as int,
      wasPlayedYesterday: null == wasPlayedYesterday
          ? _value.wasPlayedYesterday
          : wasPlayedYesterday // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      this.fullName,
      required this.username,
      this.imageUrl,
      required this.email,
      this.fireDays = 0,
      this.wasPlayedYesterday = false,
      this.questions = 0,
      this.score = 0,
      this.accuracy = 0});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String? fullName;
  @override
  final String username;
  @override
  final String? imageUrl;
  @override
  final String email;
  @override
  @JsonKey()
  final int fireDays;
  @override
  @JsonKey()
  final bool wasPlayedYesterday;
  @override
  @JsonKey()
  final int questions;
  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final int accuracy;

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, username: $username, imageUrl: $imageUrl, email: $email, fireDays: $fireDays, wasPlayedYesterday: $wasPlayedYesterday, questions: $questions, score: $score, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fireDays, fireDays) ||
                other.fireDays == fireDays) &&
            (identical(other.wasPlayedYesterday, wasPlayedYesterday) ||
                other.wasPlayedYesterday == wasPlayedYesterday) &&
            (identical(other.questions, questions) ||
                other.questions == questions) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, username, imageUrl,
      email, fireDays, wasPlayedYesterday, questions, score, accuracy);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      final String? fullName,
      required final String username,
      final String? imageUrl,
      required final String email,
      final int fireDays,
      final bool wasPlayedYesterday,
      final int questions,
      final int score,
      final int accuracy}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String? get fullName;
  @override
  String get username;
  @override
  String? get imageUrl;
  @override
  String get email;
  @override
  int get fireDays;
  @override
  bool get wasPlayedYesterday;
  @override
  int get questions;
  @override
  int get score;
  @override
  int get accuracy;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
