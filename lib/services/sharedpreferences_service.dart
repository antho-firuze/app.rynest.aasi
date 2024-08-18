import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._(this._preferences);

  static SharedPreferencesService? _instance;

  final SharedPreferences _preferences;

  static Future<SharedPreferencesService> getInstance() async {
    return _instance ??=
        SharedPreferencesService._(await SharedPreferences.getInstance());
  }

  void clearPreferences() {
    _preferences.clear();
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  void _saveToDisk(String key, dynamic content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  // ===== Additional Method
  // =========================

  static const _isFirstRun = '_isFirstRun';
  static const _userLangKey = '_userLangKey';
  static const _tokenKey = '_tokenKey';
  static const _userFontSizeKey = '_userFontSizeKey';
  static const _autoNextQuestionKey = '_autoNextQuestionKey';
  static const _userKey = '_userKey';
  // static const _topicUser = 'topic_user_key';
  static const _isRememberKey = '_isRememberKey';
  static const _gpsLocationKey = '_gpsLocationKey';
  static const _usernameKey = '_usernameKey';
  static const _examKey = '_examKey';
  static const _profileKey = '_profileKey';
  // static const _scheduleKey = '_scheduleKey';
  // static const _certificateKey = '_certificateKey';
  // static const _photosKey = '_photosKey';

  Future isFirstRun({bool? value}) async {
    if (value == null) {
      return _getFromDisk(_isFirstRun) ?? true;
    } else {
      _saveToDisk(_isFirstRun, value);
    }
  }

  Future lang({String? value}) async {
    if (value == null) {
      return _getFromDisk(_userLangKey) ?? 'id';
    } else {
      _saveToDisk(_userLangKey, value);
    }
  }

  Future token({String? value, bool clear = false}) async {
    if (clear) {
      return await _preferences.remove(_tokenKey);
    }
    if (value == null) {
      return _getFromDisk(_tokenKey) ?? '';
    } else {
      _saveToDisk(_tokenKey, value);
    }
  }

  Future gpsLocation({String? value}) async {
    if (value == null) {
      return _getFromDisk(_gpsLocationKey) ?? '';
    } else {
      _saveToDisk(_gpsLocationKey, value);
    }
  }

  Future fontSize({int? value}) async {
    if (value == null) {
      return _getFromDisk(_userFontSizeKey) ?? 16;
    } else {
      _saveToDisk(_userFontSizeKey, value);
    }
  }

  Future autoNextQuestion({bool? value}) async {
    if (value == null) {
      return _getFromDisk(_autoNextQuestionKey) ?? true;
    } else {
      _saveToDisk(_autoNextQuestionKey, value);
    }
  }

  Future user({String? value, bool clear = false}) async {
    if (clear) {
      return await _preferences.remove(_userKey);
    }
    if (value == null) {
      return _getFromDisk(_userKey) ?? '';
    } else {
      _saveToDisk(_userKey, value);
    }
  }

  Future remember({String? value}) async {
    if (value == null) {
      return _getFromDisk(_isRememberKey) ?? '';
    } else {
      _saveToDisk(_isRememberKey, value);
    }
  }

  // Future topicUser({String? value}) async {
  //   if (value == null) {
  //     return _getFromDisk(_topicUser) ?? '';
  //   } else {
  //     _saveToDisk(_topicUser, value);
  //   }
  // }

  Future username({String? value, bool clear = false}) async {
    if (clear) {
      return await _preferences.remove(_usernameKey);
    }
    if (value == null) {
      return _getFromDisk(_usernameKey) ?? '';
    } else {
      _saveToDisk(_usernameKey, value);
    }
  }

  Future exam({String? value, bool clear = false}) async {
    if (clear) {
      return await _preferences.remove(_examKey);
    }
    if (value == null) {
      return _getFromDisk(_examKey) ?? '';
    } else {
      _saveToDisk(_examKey, value);
    }
  }

  Future profile({String? value, bool clear = false}) async {
    if (clear) {
      return await _preferences.remove(_profileKey);
    }
    if (value == null) {
      return _getFromDisk(_profileKey) ?? '';
    } else {
      _saveToDisk(_profileKey, value);
    }
  }

  Future removeAll() async {
    await _preferences.clear();
    // await _preferences.remove(_tokenKey);
    // await _preferences.remove(_userKey);
  }
}
