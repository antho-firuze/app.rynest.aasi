import 'package:app.rynest.aasi/services/account_service.dart';
import 'package:app.rynest.aasi/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:app.rynest.aasi/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/app_service.dart';
import '../services/auth_service.dart';
import '../services/exam_service.dart';
import '../services/media_service.dart';
import '../services/sharedpreferences_service.dart';
import '../ui/views/home/home_viewmodel.dart';
import '../ui/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
  ],
  dependencies: [
    // Singleton(classType: SessionService),
    Singleton(classType: AppService),
    Singleton(classType: AuthService),
    // Singleton(classType: FcmService),
    Singleton(classType: AccountService),

    LazySingleton(classType: MediaService),
    LazySingleton(classType: ExamService),
    // LazySingleton(classType: GpsService),
    // LazySingleton(classType: CDNService),

    // LazySingleton(classType: FirebaseAuthenticationService),
    // LazySingleton(classType: DialogService),
    // LazySingleton(classType: SnackbarService),

    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),

    // InitializableSingleton(
    //   classType: SharedPreferencesService,
    // ),
    LazySingleton(classType: DashboardViewModel),
    LazySingleton(classType: HomeViewModel),
    LazySingleton(classType: ProfileViewModel),
  ],
)
class App {}
