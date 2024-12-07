import 'package:app.rynest.aasi/common/views/dashboard_view.dart';
import 'package:app.rynest.aasi/common/views/splash_view.dart';
import 'package:app.rynest.aasi/common/views/walkthrough_view.dart';
import 'package:app.rynest.aasi/features/user/views/home_view.dart';
import 'package:app.rynest.aasi/features/user/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Private Navigators
final rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _messageNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'message');
final _alertNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'alert');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final goRouterProvider = Provider<GoRouter>((ref) => router);

final GoRouter router = GoRouter(
  initialLocation: SplashView.routeName,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: false,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => DashboardView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: HomeView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HomeView(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ProfileView(),
              ),
            )
          ],
        ),
      ],
    ),
    // COMMON PAGES
    GoRoute(
      path: SplashView.routeName,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: WalkthroughView.routeName,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const WalkthroughView(),
    ),
  ],
);
