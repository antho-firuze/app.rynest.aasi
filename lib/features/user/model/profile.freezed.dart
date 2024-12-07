// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  @JsonKey(name: 'id_user')
  @JsonIntConverter()
  int? get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_member')
  @JsonIntConverter()
  int? get idMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  String? get memberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_card')
  String? get cardNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullname')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  @JsonDateTimeConverter()
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  @JsonGenderConverter()
  String? get gender => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_idcard')
  String? get photoIdCard => throw _privateConstructorUsedError;
  @JsonIntConverter()
  int? get status => throw _privateConstructorUsedError;
  Company? get company => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') @JsonIntConverter() int? idUser,
      @JsonKey(name: 'id_member') @JsonIntConverter() int? idMember,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'identity_card') String? cardNo,
      @JsonKey(name: 'fullname') String? fullName,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'date_of_birth')
      @JsonDateTimeConverter()
      String? dateOfBirth,
      @JsonKey(name: 'gender') @JsonGenderConverter() String? gender,
      String? email,
      String? phone,
      String? photo,
      @JsonKey(name: 'photo_idcard') String? photoIdCard,
      @JsonIntConverter() int? status,
      Company? company});

  $CompanyCopyWith<$Res>? get company;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = freezed,
    Object? idMember = freezed,
    Object? memberId = freezed,
    Object? cardNo = freezed,
    Object? fullName = freezed,
    Object? placeOfBirth = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? photo = freezed,
    Object? photoIdCard = freezed,
    Object? status = freezed,
    Object? company = freezed,
  }) {
    return _then(_value.copyWith(
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int?,
      idMember: freezed == idMember
          ? _value.idMember
          : idMember // ignore: cast_nullable_to_non_nullable
              as int?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNo: freezed == cardNo
          ? _value.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      photoIdCard: freezed == photoIdCard
          ? _value.photoIdCard
          : photoIdCard // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company?,
    ) as $Val);
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res>? get company {
    if (_value.company == null) {
      return null;
    }

    return $CompanyCopyWith<$Res>(_value.company!, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') @JsonIntConverter() int? idUser,
      @JsonKey(name: 'id_member') @JsonIntConverter() int? idMember,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'identity_card') String? cardNo,
      @JsonKey(name: 'fullname') String? fullName,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'date_of_birth')
      @JsonDateTimeConverter()
      String? dateOfBirth,
      @JsonKey(name: 'gender') @JsonGenderConverter() String? gender,
      String? email,
      String? phone,
      String? photo,
      @JsonKey(name: 'photo_idcard') String? photoIdCard,
      @JsonIntConverter() int? status,
      Company? company});

  @override
  $CompanyCopyWith<$Res>? get company;
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = freezed,
    Object? idMember = freezed,
    Object? memberId = freezed,
    Object? cardNo = freezed,
    Object? fullName = freezed,
    Object? placeOfBirth = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? photo = freezed,
    Object? photoIdCard = freezed,
    Object? status = freezed,
    Object? company = freezed,
  }) {
    return _then(_$ProfileImpl(
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int?,
      idMember: freezed == idMember
          ? _value.idMember
          : idMember // ignore: cast_nullable_to_non_nullable
              as int?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNo: freezed == cardNo
          ? _value.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      photoIdCard: freezed == photoIdCard
          ? _value.photoIdCard
          : photoIdCard // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  _$ProfileImpl(
      {@JsonKey(name: 'id_user') @JsonIntConverter() this.idUser,
      @JsonKey(name: 'id_member') @JsonIntConverter() this.idMember,
      @JsonKey(name: 'member_id') this.memberId,
      @JsonKey(name: 'identity_card') this.cardNo,
      @JsonKey(name: 'fullname') this.fullName,
      @JsonKey(name: 'place_of_birth') this.placeOfBirth,
      @JsonKey(name: 'date_of_birth') @JsonDateTimeConverter() this.dateOfBirth,
      @JsonKey(name: 'gender') @JsonGenderConverter() this.gender,
      this.email,
      this.phone,
      this.photo,
      @JsonKey(name: 'photo_idcard') this.photoIdCard,
      @JsonIntConverter() this.status,
      this.company});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  @JsonIntConverter()
  final int? idUser;
  @override
  @JsonKey(name: 'id_member')
  @JsonIntConverter()
  final int? idMember;
  @override
  @JsonKey(name: 'member_id')
  final String? memberId;
  @override
  @JsonKey(name: 'identity_card')
  final String? cardNo;
  @override
  @JsonKey(name: 'fullname')
  final String? fullName;
  @override
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  @override
  @JsonKey(name: 'date_of_birth')
  @JsonDateTimeConverter()
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'gender')
  @JsonGenderConverter()
  final String? gender;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? photo;
  @override
  @JsonKey(name: 'photo_idcard')
  final String? photoIdCard;
  @override
  @JsonIntConverter()
  final int? status;
  @override
  final Company? company;

  @override
  String toString() {
    return 'Profile(idUser: $idUser, idMember: $idMember, memberId: $memberId, cardNo: $cardNo, fullName: $fullName, placeOfBirth: $placeOfBirth, dateOfBirth: $dateOfBirth, gender: $gender, email: $email, phone: $phone, photo: $photo, photoIdCard: $photoIdCard, status: $status, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.idMember, idMember) ||
                other.idMember == idMember) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.cardNo, cardNo) || other.cardNo == cardNo) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.photoIdCard, photoIdCard) ||
                other.photoIdCard == photoIdCard) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idUser,
      idMember,
      memberId,
      cardNo,
      fullName,
      placeOfBirth,
      dateOfBirth,
      gender,
      email,
      phone,
      photo,
      photoIdCard,
      status,
      company);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  factory _Profile(
      {@JsonKey(name: 'id_user') @JsonIntConverter() final int? idUser,
      @JsonKey(name: 'id_member') @JsonIntConverter() final int? idMember,
      @JsonKey(name: 'member_id') final String? memberId,
      @JsonKey(name: 'identity_card') final String? cardNo,
      @JsonKey(name: 'fullname') final String? fullName,
      @JsonKey(name: 'place_of_birth') final String? placeOfBirth,
      @JsonKey(name: 'date_of_birth')
      @JsonDateTimeConverter()
      final String? dateOfBirth,
      @JsonKey(name: 'gender') @JsonGenderConverter() final String? gender,
      final String? email,
      final String? phone,
      final String? photo,
      @JsonKey(name: 'photo_idcard') final String? photoIdCard,
      @JsonIntConverter() final int? status,
      final Company? company}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  @JsonIntConverter()
  int? get idUser;
  @override
  @JsonKey(name: 'id_member')
  @JsonIntConverter()
  int? get idMember;
  @override
  @JsonKey(name: 'member_id')
  String? get memberId;
  @override
  @JsonKey(name: 'identity_card')
  String? get cardNo;
  @override
  @JsonKey(name: 'fullname')
  String? get fullName;
  @override
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth;
  @override
  @JsonKey(name: 'date_of_birth')
  @JsonDateTimeConverter()
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'gender')
  @JsonGenderConverter()
  String? get gender;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get photo;
  @override
  @JsonKey(name: 'photo_idcard')
  String? get photoIdCard;
  @override
  @JsonIntConverter()
  int? get status;
  @override
  Company? get company;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  @JsonIntConverter()
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'kode_company')
  String? get code => throw _privateConstructorUsedError;
  @JsonIntConverter()
  int? get type => throw _privateConstructorUsedError;

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      String? name,
      @JsonKey(name: 'kode_company') String? code,
      @JsonIntConverter() int? type});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyImplCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$CompanyImplCopyWith(
          _$CompanyImpl value, $Res Function(_$CompanyImpl) then) =
      __$$CompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      String? name,
      @JsonKey(name: 'kode_company') String? code,
      @JsonIntConverter() int? type});
}

/// @nodoc
class __$$CompanyImplCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$CompanyImpl>
    implements _$$CompanyImplCopyWith<$Res> {
  __$$CompanyImplCopyWithImpl(
      _$CompanyImpl _value, $Res Function(_$CompanyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? type = freezed,
  }) {
    return _then(_$CompanyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyImpl implements _Company {
  _$CompanyImpl(
      {@JsonIntConverter() this.id,
      this.name,
      @JsonKey(name: 'kode_company') this.code,
      @JsonIntConverter() this.type});

  factory _$CompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyImplFromJson(json);

  @override
  @JsonIntConverter()
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'kode_company')
  final String? code;
  @override
  @JsonIntConverter()
  final int? type;

  @override
  String toString() {
    return 'Company(id: $id, name: $name, code: $code, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, type);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      __$$CompanyImplCopyWithImpl<_$CompanyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyImplToJson(
      this,
    );
  }
}

abstract class _Company implements Company {
  factory _Company(
      {@JsonIntConverter() final int? id,
      final String? name,
      @JsonKey(name: 'kode_company') final String? code,
      @JsonIntConverter() final int? type}) = _$CompanyImpl;

  factory _Company.fromJson(Map<String, dynamic> json) = _$CompanyImpl.fromJson;

  @override
  @JsonIntConverter()
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'kode_company')
  String? get code;
  @override
  @JsonIntConverter()
  int? get type;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
