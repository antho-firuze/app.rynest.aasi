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
  @StringToIntConverter()
  int? get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_member')
  @StringToIntConverter()
  int? get idMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  String? get memberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_card')
  String? get cardNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullname')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  @StringToDateConverter()
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  @StringToGenderConverter()
  String? get gender => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_idcard')
  String? get photoIdCard => throw _privateConstructorUsedError;
  @StringToIntConverter()
  int? get status => throw _privateConstructorUsedError;
  Company? get company => throw _privateConstructorUsedError;
  Certificate? get certificate => throw _privateConstructorUsedError;
  Schedule? get schedule => throw _privateConstructorUsedError;
  Photos? get photos => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id_user') @StringToIntConverter() int? idUser,
      @JsonKey(name: 'id_member') @StringToIntConverter() int? idMember,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'identity_card') String? cardNo,
      @JsonKey(name: 'fullname') String fullName,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'date_of_birth')
      @StringToDateConverter()
      String? dateOfBirth,
      @JsonKey(name: 'gender') @StringToGenderConverter() String? gender,
      String email,
      String phone,
      String photo,
      @JsonKey(name: 'photo_idcard') String? photoIdCard,
      @StringToIntConverter() int? status,
      Company? company,
      Certificate? certificate,
      Schedule? schedule,
      Photos? photos});

  $CompanyCopyWith<$Res>? get company;
  $CertificateCopyWith<$Res>? get certificate;
  $ScheduleCopyWith<$Res>? get schedule;
  $PhotosCopyWith<$Res>? get photos;
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
    Object? fullName = null,
    Object? placeOfBirth = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? email = null,
    Object? phone = null,
    Object? photo = null,
    Object? photoIdCard = freezed,
    Object? status = freezed,
    Object? company = freezed,
    Object? certificate = freezed,
    Object? schedule = freezed,
    Object? photos = freezed,
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
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
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
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as Certificate?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as Photos?,
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

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CertificateCopyWith<$Res>? get certificate {
    if (_value.certificate == null) {
      return null;
    }

    return $CertificateCopyWith<$Res>(_value.certificate!, (value) {
      return _then(_value.copyWith(certificate: value) as $Val);
    });
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhotosCopyWith<$Res>? get photos {
    if (_value.photos == null) {
      return null;
    }

    return $PhotosCopyWith<$Res>(_value.photos!, (value) {
      return _then(_value.copyWith(photos: value) as $Val);
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
      {@JsonKey(name: 'id_user') @StringToIntConverter() int? idUser,
      @JsonKey(name: 'id_member') @StringToIntConverter() int? idMember,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'identity_card') String? cardNo,
      @JsonKey(name: 'fullname') String fullName,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'date_of_birth')
      @StringToDateConverter()
      String? dateOfBirth,
      @JsonKey(name: 'gender') @StringToGenderConverter() String? gender,
      String email,
      String phone,
      String photo,
      @JsonKey(name: 'photo_idcard') String? photoIdCard,
      @StringToIntConverter() int? status,
      Company? company,
      Certificate? certificate,
      Schedule? schedule,
      Photos? photos});

  @override
  $CompanyCopyWith<$Res>? get company;
  @override
  $CertificateCopyWith<$Res>? get certificate;
  @override
  $ScheduleCopyWith<$Res>? get schedule;
  @override
  $PhotosCopyWith<$Res>? get photos;
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
    Object? fullName = null,
    Object? placeOfBirth = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? email = null,
    Object? phone = null,
    Object? photo = null,
    Object? photoIdCard = freezed,
    Object? status = freezed,
    Object? company = freezed,
    Object? certificate = freezed,
    Object? schedule = freezed,
    Object? photos = freezed,
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
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
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
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as Certificate?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as Photos?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  _$ProfileImpl(
      {@JsonKey(name: 'id_user') @StringToIntConverter() this.idUser,
      @JsonKey(name: 'id_member') @StringToIntConverter() this.idMember,
      @JsonKey(name: 'member_id') this.memberId,
      @JsonKey(name: 'identity_card') this.cardNo,
      @JsonKey(name: 'fullname') this.fullName = '',
      @JsonKey(name: 'place_of_birth') this.placeOfBirth,
      @JsonKey(name: 'date_of_birth') @StringToDateConverter() this.dateOfBirth,
      @JsonKey(name: 'gender') @StringToGenderConverter() this.gender,
      this.email = '',
      this.phone = '',
      this.photo = '',
      @JsonKey(name: 'photo_idcard') this.photoIdCard,
      @StringToIntConverter() this.status,
      this.company,
      this.certificate,
      this.schedule,
      this.photos});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  @StringToIntConverter()
  final int? idUser;
  @override
  @JsonKey(name: 'id_member')
  @StringToIntConverter()
  final int? idMember;
  @override
  @JsonKey(name: 'member_id')
  final String? memberId;
  @override
  @JsonKey(name: 'identity_card')
  final String? cardNo;
  @override
  @JsonKey(name: 'fullname')
  final String fullName;
  @override
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  @override
  @JsonKey(name: 'date_of_birth')
  @StringToDateConverter()
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'gender')
  @StringToGenderConverter()
  final String? gender;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String photo;
  @override
  @JsonKey(name: 'photo_idcard')
  final String? photoIdCard;
  @override
  @StringToIntConverter()
  final int? status;
  @override
  final Company? company;
  @override
  final Certificate? certificate;
  @override
  final Schedule? schedule;
  @override
  final Photos? photos;

  @override
  String toString() {
    return 'Profile(idUser: $idUser, idMember: $idMember, memberId: $memberId, cardNo: $cardNo, fullName: $fullName, placeOfBirth: $placeOfBirth, dateOfBirth: $dateOfBirth, gender: $gender, email: $email, phone: $phone, photo: $photo, photoIdCard: $photoIdCard, status: $status, company: $company, certificate: $certificate, schedule: $schedule, photos: $photos)';
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
            (identical(other.company, company) || other.company == company) &&
            (identical(other.certificate, certificate) ||
                other.certificate == certificate) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.photos, photos) || other.photos == photos));
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
      company,
      certificate,
      schedule,
      photos);

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
      {@JsonKey(name: 'id_user') @StringToIntConverter() final int? idUser,
      @JsonKey(name: 'id_member') @StringToIntConverter() final int? idMember,
      @JsonKey(name: 'member_id') final String? memberId,
      @JsonKey(name: 'identity_card') final String? cardNo,
      @JsonKey(name: 'fullname') final String fullName,
      @JsonKey(name: 'place_of_birth') final String? placeOfBirth,
      @JsonKey(name: 'date_of_birth')
      @StringToDateConverter()
      final String? dateOfBirth,
      @JsonKey(name: 'gender') @StringToGenderConverter() final String? gender,
      final String email,
      final String phone,
      final String photo,
      @JsonKey(name: 'photo_idcard') final String? photoIdCard,
      @StringToIntConverter() final int? status,
      final Company? company,
      final Certificate? certificate,
      final Schedule? schedule,
      final Photos? photos}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  @StringToIntConverter()
  int? get idUser;
  @override
  @JsonKey(name: 'id_member')
  @StringToIntConverter()
  int? get idMember;
  @override
  @JsonKey(name: 'member_id')
  String? get memberId;
  @override
  @JsonKey(name: 'identity_card')
  String? get cardNo;
  @override
  @JsonKey(name: 'fullname')
  String get fullName;
  @override
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth;
  @override
  @JsonKey(name: 'date_of_birth')
  @StringToDateConverter()
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'gender')
  @StringToGenderConverter()
  String? get gender;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get photo;
  @override
  @JsonKey(name: 'photo_idcard')
  String? get photoIdCard;
  @override
  @StringToIntConverter()
  int? get status;
  @override
  Company? get company;
  @override
  Certificate? get certificate;
  @override
  Schedule? get schedule;
  @override
  Photos? get photos;

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
  @StringToIntConverter()
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'kode_company')
  String? get code => throw _privateConstructorUsedError;
  @StringToIntConverter()
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
      {@StringToIntConverter() int? id,
      String? name,
      @JsonKey(name: 'kode_company') String? code,
      @StringToIntConverter() int? type});
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
      {@StringToIntConverter() int? id,
      String? name,
      @JsonKey(name: 'kode_company') String? code,
      @StringToIntConverter() int? type});
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
      {@StringToIntConverter() this.id,
      this.name,
      @JsonKey(name: 'kode_company') this.code,
      @StringToIntConverter() this.type});

  factory _$CompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyImplFromJson(json);

  @override
  @StringToIntConverter()
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'kode_company')
  final String? code;
  @override
  @StringToIntConverter()
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
      {@StringToIntConverter() final int? id,
      final String? name,
      @JsonKey(name: 'kode_company') final String? code,
      @StringToIntConverter() final int? type}) = _$CompanyImpl;

  factory _Company.fromJson(Map<String, dynamic> json) = _$CompanyImpl.fromJson;

  @override
  @StringToIntConverter()
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'kode_company')
  String? get code;
  @override
  @StringToIntConverter()
  int? get type;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return _Certificate.fromJson(json);
}

/// @nodoc
mixin _$Certificate {
  @StringToIntConverter()
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_sertifikat')
  String? get certNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'realese_date')
  @StringToDateConverter()
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date')
  @StringToDateConverter()
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'extension_date')
  @StringToDateConverter()
  DateTime? get extensionDate => throw _privateConstructorUsedError;

  /// Serializes this Certificate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateCopyWith<Certificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateCopyWith<$Res> {
  factory $CertificateCopyWith(
          Certificate value, $Res Function(Certificate) then) =
      _$CertificateCopyWithImpl<$Res, Certificate>;
  @useResult
  $Res call(
      {@StringToIntConverter() int? id,
      @JsonKey(name: 'no_sertifikat') String? certNo,
      @JsonKey(name: 'realese_date')
      @StringToDateConverter()
      DateTime? releaseDate,
      @JsonKey(name: 'expired_date')
      @StringToDateConverter()
      DateTime? expiredDate,
      @JsonKey(name: 'extension_date')
      @StringToDateConverter()
      DateTime? extensionDate});
}

/// @nodoc
class _$CertificateCopyWithImpl<$Res, $Val extends Certificate>
    implements $CertificateCopyWith<$Res> {
  _$CertificateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? certNo = freezed,
    Object? releaseDate = freezed,
    Object? expiredDate = freezed,
    Object? extensionDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      certNo: freezed == certNo
          ? _value.certNo
          : certNo // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      extensionDate: freezed == extensionDate
          ? _value.extensionDate
          : extensionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificateImplCopyWith<$Res>
    implements $CertificateCopyWith<$Res> {
  factory _$$CertificateImplCopyWith(
          _$CertificateImpl value, $Res Function(_$CertificateImpl) then) =
      __$$CertificateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringToIntConverter() int? id,
      @JsonKey(name: 'no_sertifikat') String? certNo,
      @JsonKey(name: 'realese_date')
      @StringToDateConverter()
      DateTime? releaseDate,
      @JsonKey(name: 'expired_date')
      @StringToDateConverter()
      DateTime? expiredDate,
      @JsonKey(name: 'extension_date')
      @StringToDateConverter()
      DateTime? extensionDate});
}

/// @nodoc
class __$$CertificateImplCopyWithImpl<$Res>
    extends _$CertificateCopyWithImpl<$Res, _$CertificateImpl>
    implements _$$CertificateImplCopyWith<$Res> {
  __$$CertificateImplCopyWithImpl(
      _$CertificateImpl _value, $Res Function(_$CertificateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? certNo = freezed,
    Object? releaseDate = freezed,
    Object? expiredDate = freezed,
    Object? extensionDate = freezed,
  }) {
    return _then(_$CertificateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      certNo: freezed == certNo
          ? _value.certNo
          : certNo // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      extensionDate: freezed == extensionDate
          ? _value.extensionDate
          : extensionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CertificateImpl implements _Certificate {
  _$CertificateImpl(
      {@StringToIntConverter() this.id,
      @JsonKey(name: 'no_sertifikat') this.certNo,
      @JsonKey(name: 'realese_date') @StringToDateConverter() this.releaseDate,
      @JsonKey(name: 'expired_date') @StringToDateConverter() this.expiredDate,
      @JsonKey(name: 'extension_date')
      @StringToDateConverter()
      this.extensionDate});

  factory _$CertificateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CertificateImplFromJson(json);

  @override
  @StringToIntConverter()
  final int? id;
  @override
  @JsonKey(name: 'no_sertifikat')
  final String? certNo;
  @override
  @JsonKey(name: 'realese_date')
  @StringToDateConverter()
  final DateTime? releaseDate;
  @override
  @JsonKey(name: 'expired_date')
  @StringToDateConverter()
  final DateTime? expiredDate;
  @override
  @JsonKey(name: 'extension_date')
  @StringToDateConverter()
  final DateTime? extensionDate;

  @override
  String toString() {
    return 'Certificate(id: $id, certNo: $certNo, releaseDate: $releaseDate, expiredDate: $expiredDate, extensionDate: $extensionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.certNo, certNo) || other.certNo == certNo) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.extensionDate, extensionDate) ||
                other.extensionDate == extensionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, certNo, releaseDate, expiredDate, extensionDate);

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateImplCopyWith<_$CertificateImpl> get copyWith =>
      __$$CertificateImplCopyWithImpl<_$CertificateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificateImplToJson(
      this,
    );
  }
}

abstract class _Certificate implements Certificate {
  factory _Certificate(
      {@StringToIntConverter() final int? id,
      @JsonKey(name: 'no_sertifikat') final String? certNo,
      @JsonKey(name: 'realese_date')
      @StringToDateConverter()
      final DateTime? releaseDate,
      @JsonKey(name: 'expired_date')
      @StringToDateConverter()
      final DateTime? expiredDate,
      @JsonKey(name: 'extension_date')
      @StringToDateConverter()
      final DateTime? extensionDate}) = _$CertificateImpl;

  factory _Certificate.fromJson(Map<String, dynamic> json) =
      _$CertificateImpl.fromJson;

  @override
  @StringToIntConverter()
  int? get id;
  @override
  @JsonKey(name: 'no_sertifikat')
  String? get certNo;
  @override
  @JsonKey(name: 'realese_date')
  @StringToDateConverter()
  DateTime? get releaseDate;
  @override
  @JsonKey(name: 'expired_date')
  @StringToDateConverter()
  DateTime? get expiredDate;
  @override
  @JsonKey(name: 'extension_date')
  @StringToDateConverter()
  DateTime? get extensionDate;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateImplCopyWith<_$CertificateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  @JsonKey(name: 'schedule_request_id')
  @StringToIntConverter()
  int? get scheduleRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  @StringToIntConverter()
  int? get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_id')
  @StringToIntConverter()
  int? get locationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  @StringToIntConverter()
  int? get categoryId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @StringToIntConverter()
  int? get duration => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_registration')
  @StringToDateConverter()
  DateTime? get openRegistration => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_registration')
  @StringToDateConverter()
  DateTime? get closeRegistration => throw _privateConstructorUsedError;

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'schedule_request_id')
      @StringToIntConverter()
      int? scheduleRequestId,
      @JsonKey(name: 'schedule_id') @StringToIntConverter() int? scheduleId,
      @JsonKey(name: 'location_id') @StringToIntConverter() int? locationId,
      @JsonKey(name: 'category_id') @StringToIntConverter() int? categoryId,
      String? name,
      @StringToIntConverter() int? duration,
      String? notes,
      @JsonKey(name: 'open_registration')
      @StringToDateConverter()
      DateTime? openRegistration,
      @JsonKey(name: 'close_registration')
      @StringToDateConverter()
      DateTime? closeRegistration});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleRequestId = freezed,
    Object? scheduleId = freezed,
    Object? locationId = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? notes = freezed,
    Object? openRegistration = freezed,
    Object? closeRegistration = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleRequestId: freezed == scheduleRequestId
          ? _value.scheduleRequestId
          : scheduleRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      openRegistration: freezed == openRegistration
          ? _value.openRegistration
          : openRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeRegistration: freezed == closeRegistration
          ? _value.closeRegistration
          : closeRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'schedule_request_id')
      @StringToIntConverter()
      int? scheduleRequestId,
      @JsonKey(name: 'schedule_id') @StringToIntConverter() int? scheduleId,
      @JsonKey(name: 'location_id') @StringToIntConverter() int? locationId,
      @JsonKey(name: 'category_id') @StringToIntConverter() int? categoryId,
      String? name,
      @StringToIntConverter() int? duration,
      String? notes,
      @JsonKey(name: 'open_registration')
      @StringToDateConverter()
      DateTime? openRegistration,
      @JsonKey(name: 'close_registration')
      @StringToDateConverter()
      DateTime? closeRegistration});
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleRequestId = freezed,
    Object? scheduleId = freezed,
    Object? locationId = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? notes = freezed,
    Object? openRegistration = freezed,
    Object? closeRegistration = freezed,
  }) {
    return _then(_$ScheduleImpl(
      scheduleRequestId: freezed == scheduleRequestId
          ? _value.scheduleRequestId
          : scheduleRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      openRegistration: freezed == openRegistration
          ? _value.openRegistration
          : openRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeRegistration: freezed == closeRegistration
          ? _value.closeRegistration
          : closeRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl implements _Schedule {
  _$ScheduleImpl(
      {@JsonKey(name: 'schedule_request_id')
      @StringToIntConverter()
      this.scheduleRequestId,
      @JsonKey(name: 'schedule_id') @StringToIntConverter() this.scheduleId,
      @JsonKey(name: 'location_id') @StringToIntConverter() this.locationId,
      @JsonKey(name: 'category_id') @StringToIntConverter() this.categoryId,
      this.name,
      @StringToIntConverter() this.duration,
      this.notes,
      @JsonKey(name: 'open_registration')
      @StringToDateConverter()
      this.openRegistration,
      @JsonKey(name: 'close_registration')
      @StringToDateConverter()
      this.closeRegistration});

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  @JsonKey(name: 'schedule_request_id')
  @StringToIntConverter()
  final int? scheduleRequestId;
  @override
  @JsonKey(name: 'schedule_id')
  @StringToIntConverter()
  final int? scheduleId;
  @override
  @JsonKey(name: 'location_id')
  @StringToIntConverter()
  final int? locationId;
  @override
  @JsonKey(name: 'category_id')
  @StringToIntConverter()
  final int? categoryId;
  @override
  final String? name;
  @override
  @StringToIntConverter()
  final int? duration;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'open_registration')
  @StringToDateConverter()
  final DateTime? openRegistration;
  @override
  @JsonKey(name: 'close_registration')
  @StringToDateConverter()
  final DateTime? closeRegistration;

  @override
  String toString() {
    return 'Schedule(scheduleRequestId: $scheduleRequestId, scheduleId: $scheduleId, locationId: $locationId, categoryId: $categoryId, name: $name, duration: $duration, notes: $notes, openRegistration: $openRegistration, closeRegistration: $closeRegistration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.scheduleRequestId, scheduleRequestId) ||
                other.scheduleRequestId == scheduleRequestId) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.openRegistration, openRegistration) ||
                other.openRegistration == openRegistration) &&
            (identical(other.closeRegistration, closeRegistration) ||
                other.closeRegistration == closeRegistration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scheduleRequestId,
      scheduleId,
      locationId,
      categoryId,
      name,
      duration,
      notes,
      openRegistration,
      closeRegistration);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  factory _Schedule(
      {@JsonKey(name: 'schedule_request_id')
      @StringToIntConverter()
      final int? scheduleRequestId,
      @JsonKey(name: 'schedule_id')
      @StringToIntConverter()
      final int? scheduleId,
      @JsonKey(name: 'location_id')
      @StringToIntConverter()
      final int? locationId,
      @JsonKey(name: 'category_id')
      @StringToIntConverter()
      final int? categoryId,
      final String? name,
      @StringToIntConverter() final int? duration,
      final String? notes,
      @JsonKey(name: 'open_registration')
      @StringToDateConverter()
      final DateTime? openRegistration,
      @JsonKey(name: 'close_registration')
      @StringToDateConverter()
      final DateTime? closeRegistration}) = _$ScheduleImpl;

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  @JsonKey(name: 'schedule_request_id')
  @StringToIntConverter()
  int? get scheduleRequestId;
  @override
  @JsonKey(name: 'schedule_id')
  @StringToIntConverter()
  int? get scheduleId;
  @override
  @JsonKey(name: 'location_id')
  @StringToIntConverter()
  int? get locationId;
  @override
  @JsonKey(name: 'category_id')
  @StringToIntConverter()
  int? get categoryId;
  @override
  String? get name;
  @override
  @StringToIntConverter()
  int? get duration;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'open_registration')
  @StringToDateConverter()
  DateTime? get openRegistration;
  @override
  @JsonKey(name: 'close_registration')
  @StringToDateConverter()
  DateTime? get closeRegistration;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Photos _$PhotosFromJson(Map<String, dynamic> json) {
  return _Photos.fromJson(json);
}

/// @nodoc
mixin _$Photos {
  String get selfie => throw _privateConstructorUsedError;
  String get idCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_finish')
  String get examFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_start')
  String get examStart => throw _privateConstructorUsedError;

  /// Serializes this Photos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Photos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotosCopyWith<Photos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosCopyWith<$Res> {
  factory $PhotosCopyWith(Photos value, $Res Function(Photos) then) =
      _$PhotosCopyWithImpl<$Res, Photos>;
  @useResult
  $Res call(
      {String selfie,
      String idCard,
      @JsonKey(name: 'exam_finish') String examFinish,
      @JsonKey(name: 'exam_start') String examStart});
}

/// @nodoc
class _$PhotosCopyWithImpl<$Res, $Val extends Photos>
    implements $PhotosCopyWith<$Res> {
  _$PhotosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Photos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selfie = null,
    Object? idCard = null,
    Object? examFinish = null,
    Object? examStart = null,
  }) {
    return _then(_value.copyWith(
      selfie: null == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String,
      idCard: null == idCard
          ? _value.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as String,
      examFinish: null == examFinish
          ? _value.examFinish
          : examFinish // ignore: cast_nullable_to_non_nullable
              as String,
      examStart: null == examStart
          ? _value.examStart
          : examStart // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotosImplCopyWith<$Res> implements $PhotosCopyWith<$Res> {
  factory _$$PhotosImplCopyWith(
          _$PhotosImpl value, $Res Function(_$PhotosImpl) then) =
      __$$PhotosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selfie,
      String idCard,
      @JsonKey(name: 'exam_finish') String examFinish,
      @JsonKey(name: 'exam_start') String examStart});
}

/// @nodoc
class __$$PhotosImplCopyWithImpl<$Res>
    extends _$PhotosCopyWithImpl<$Res, _$PhotosImpl>
    implements _$$PhotosImplCopyWith<$Res> {
  __$$PhotosImplCopyWithImpl(
      _$PhotosImpl _value, $Res Function(_$PhotosImpl) _then)
      : super(_value, _then);

  /// Create a copy of Photos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selfie = null,
    Object? idCard = null,
    Object? examFinish = null,
    Object? examStart = null,
  }) {
    return _then(_$PhotosImpl(
      selfie: null == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String,
      idCard: null == idCard
          ? _value.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as String,
      examFinish: null == examFinish
          ? _value.examFinish
          : examFinish // ignore: cast_nullable_to_non_nullable
              as String,
      examStart: null == examStart
          ? _value.examStart
          : examStart // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotosImpl implements _Photos {
  _$PhotosImpl(
      {this.selfie = '',
      this.idCard = '',
      @JsonKey(name: 'exam_finish') this.examFinish = '',
      @JsonKey(name: 'exam_start') this.examStart = ''});

  factory _$PhotosImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotosImplFromJson(json);

  @override
  @JsonKey()
  final String selfie;
  @override
  @JsonKey()
  final String idCard;
  @override
  @JsonKey(name: 'exam_finish')
  final String examFinish;
  @override
  @JsonKey(name: 'exam_start')
  final String examStart;

  @override
  String toString() {
    return 'Photos(selfie: $selfie, idCard: $idCard, examFinish: $examFinish, examStart: $examStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosImpl &&
            (identical(other.selfie, selfie) || other.selfie == selfie) &&
            (identical(other.idCard, idCard) || other.idCard == idCard) &&
            (identical(other.examFinish, examFinish) ||
                other.examFinish == examFinish) &&
            (identical(other.examStart, examStart) ||
                other.examStart == examStart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, selfie, idCard, examFinish, examStart);

  /// Create a copy of Photos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosImplCopyWith<_$PhotosImpl> get copyWith =>
      __$$PhotosImplCopyWithImpl<_$PhotosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotosImplToJson(
      this,
    );
  }
}

abstract class _Photos implements Photos {
  factory _Photos(
      {final String selfie,
      final String idCard,
      @JsonKey(name: 'exam_finish') final String examFinish,
      @JsonKey(name: 'exam_start') final String examStart}) = _$PhotosImpl;

  factory _Photos.fromJson(Map<String, dynamic> json) = _$PhotosImpl.fromJson;

  @override
  String get selfie;
  @override
  String get idCard;
  @override
  @JsonKey(name: 'exam_finish')
  String get examFinish;
  @override
  @JsonKey(name: 'exam_start')
  String get examStart;

  /// Create a copy of Photos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotosImplCopyWith<_$PhotosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
