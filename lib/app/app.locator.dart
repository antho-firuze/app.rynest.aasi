// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_shared/stacked_shared.dart';

import '../services/account_service.dart';
import '../services/app_service.dart';
import '../services/auth_service.dart';
import '../services/exam_service.dart';
import '../services/media_service.dart';
import '../services/sharedpreferences_service.dart';
import '../ui/views/dashboard/dashboard_viewmodel.dart';
import '../ui/views/home/home_viewmodel.dart';
import '../ui/views/profile/profile_viewmodel.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerSingleton(AppService());
  locator.registerSingleton(AuthService());
  locator.registerSingleton(AccountService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => ExamService());
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPreferencesService);

  locator.registerLazySingleton(() => DashboardViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => ProfileViewModel());
}
