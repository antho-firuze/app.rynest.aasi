// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/jwt_decoder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_token.freezed.dart';
part 'jwt_token.g.dart';

@freezed
class JwtToken with _$JwtToken {
  factory JwtToken({
    // @JsonKey(name: 'token_type') @Default('Bearer') String type,
    // @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _JwtToken;

  factory JwtToken.fromJson(Map<String, dynamic> json) => _$JwtTokenFromJson(json);
}

extension JwtTokenX on JwtToken {
  bool hasExpired() => JwtDecoder.isExpired(accessToken!);
}
