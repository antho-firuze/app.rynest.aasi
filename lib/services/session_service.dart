class SessionService {
  // Future isFirstRun({bool? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getBool('isFirstRun') ?? true;
  //   } else {
  //     pref.setBool('isFirstRun', value);
  //   }
  // }

  // Future gpsLocation({Gps? gps}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (gps == null) {
  //     var value = pref.getString('gpsLocation');
  //     return value == null ? null : Gps.fromJson(jsonDecode(value));
  //   } else {
  //     var value = jsonEncode(gps.toJson());
  //     pref.setString('gpsLocation', value);
  //   }
  // }

  // Future lang({String? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getString('lang') ?? 'id';
  //   } else {
  //     pref.setString('lang', value);
  //   }
  // }

  // Future token({String? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getString('token') ?? '';
  //   } else {
  //     pref.setString('token', value);
  //   }
  // }

  // Future fontSize({int? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getInt('fontSize') ?? 16;
  //   } else {
  //     pref.setInt('fontSize', value);
  //   }
  // }

  // Future isAutoNextQuestion({bool? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getBool('isAutoNextQuestion') ?? false;
  //   } else {
  //     pref.setBool('isAutoNextQuestion', value);
  //   }
  // }

  // Future getExam({required String username}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var value = pref.getString('exam-$username');
  //   return F.isNullOrEmpty(value) ? null : Exam.fromJson(jsonDecode(value!));
  // }

  // Future setExam({required String username, Exam? exam}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var value = exam == null ? '' : jsonEncode(exam.toJson());
  //   pref.setString('exam-$username', value);
  // }

  // Future questions({List<Question>? values}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (values == null) {
  //     var value = pref.getString('questions');
  //     return value == null ? null : Question.fromJsonList(jsonDecode(value));
  //   } else {
  //     var value = jsonEncode(values);
  //     pref.setString('questions', value);
  //   }
  // }

  // Future getProfile({required String username}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var value = pref.getString('profile-$username');
  //   return F.isNullOrEmpty(value) ? null : Profile.fromJson(jsonDecode(value!));
  // }

  // Future setProfile({required String username, Profile? profile}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var value = profile == null ? '' : jsonEncode(profile.toJson());
  //   pref.setString('profile-$username', value);
  // }

  // Future username({String? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getString('username') ?? '';
  //   } else {
  //     pref.setString('username', value);
  //   }
  // }

  // Future remember({String? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getString('isRemember') ?? '';
  //   } else {
  //     pref.setString('isRemember', value);
  //   }
  // }

  // Future topicSignIn({String? value}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (value == null) {
  //     return pref.getString('topicSignIn') ?? '';
  //   } else {
  //     pref.setString('topicSignIn', value);
  //   }
  // }

  // Future remove(String key) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.remove(key);
  // }

  // Future removeAll() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.remove('isFirstRun');
  //   pref.remove('gpsLocation');
  //   pref.remove('lang');
  //   pref.remove('token');
  //   pref.remove('fontSize');
  //   pref.remove('isAutoNextQuestion');
  //   pref.remove('username');
  //   pref.remove('isRemember');
  //   pref.remove('topicSignIn');
  //   pref.clear();
  // }
}
