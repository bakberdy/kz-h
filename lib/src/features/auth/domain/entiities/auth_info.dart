// class AuthInfo{
//   final String refreshToken;
//   final String accessToken;

//   AuthInfo({required this.refreshToken, required this.accessToken});
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_info.freezed.dart';
part 'auth_info.g.dart';

@freezed
class AuthInfo with _$AuthInfo {
  const factory AuthInfo({
    required String refreshToken,
    required String accessToken,
  }) = _AuthInfo;

  factory AuthInfo.fromJson(Map<String, dynamic> json) => _$AuthInfoFromJson(json);
}
