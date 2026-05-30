import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCtrl {
  final Ref ref;
  HomeCtrl(this.ref);
}

final homeCtrlProvider = Provider(HomeCtrl.new);
