import 'package:talker_flutter/talker_flutter.dart';

extension CustomTalker on Talker {
  void logx(String message, {String name = ''}) => logCustom(TalkerLog(
        message,
        title: name,
        pen: AnsiPen()..xterm(121),
      ));

  void errx(dynamic message, {String name = '', Object? error, StackTrace? stackTrace}) => logCustom(TalkerLog(
        message,
        title: name,
        exception: error,
        stackTrace: stackTrace,
        pen: AnsiPen()..red(),
      ));
}
