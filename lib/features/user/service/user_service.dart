
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserService {
  final Ref ref;
  UserService(this.ref);

}

final userServiceProvider = Provider(UserService.new);
