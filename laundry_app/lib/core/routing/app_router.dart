import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/admin_billing_screen.dart';
import '../../features/admin/presentation/admin_challan_detail_screen.dart';
import '../../features/admin/presentation/admin_dashboard_screen.dart';
import '../../features/admin/presentation/admin_hotel_detail_screen.dart';
import '../../features/admin/presentation/admin_hotels_screen.dart';
import '../../features/admin/presentation/admin_items_screen.dart';
import '../../features/admin/presentation/admin_mappings_screen.dart';
import '../../features/admin/presentation/admin_quality_screen.dart';
import '../../features/admin/presentation/admin_shell.dart';
import '../../features/admin/presentation/admin_users_screen.dart';
import '../../features/agent/presentation/agent_shell.dart';
import '../../features/agent/presentation/challan_detail_screen.dart';
import '../../features/agent/presentation/challan_history_screen.dart';
import '../../features/agent/presentation/departments_screen.dart';
import '../../features/agent/presentation/edit_challan_screen.dart';
import '../../features/agent/presentation/pending_deliveries_screen.dart';
import '../../features/agent/presentation/pending_sync_screen.dart';
import '../../features/agent/presentation/pickup_form_screen.dart';
import '../../features/agent/presentation/delivery_form_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/challans/data/models/challan_models.dart';
import '../../features/hotel/presentation/hotel_billing_screen.dart';
import '../../features/hotel/presentation/hotel_challan_detail_screen.dart';
import '../../features/hotel/presentation/hotel_challan_history_screen.dart';
import '../../features/hotel/presentation/hotel_damage_report_screen.dart';
import '../../features/hotel/presentation/hotel_dashboard_screen.dart';
import '../../features/hotel/presentation/hotel_shell.dart';
import '../../features/hotel/presentation/live_inventory_screen.dart';
import '../constants/enums.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _agentShellKey = GlobalKey<NavigatorState>();
final _hotelShellKey = GlobalKey<NavigatorState>();
final _adminShellKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = _RouterRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    debugLogDiagnostics: true,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);
      final isOnLogin = state.matchedLocation == '/login';

      if (authState is AuthLoading) {
        return null;
      }

      if (authState case final Authenticated auth) {
        if (isOnLogin) {
          return _homeRouteForRole(auth.role);
        }

        final location = state.matchedLocation;
        if (location.startsWith('/agent') &&
            auth.role != UserRole.serviceAgent) {
          return _homeRouteForRole(auth.role);
        }
        if (location.startsWith('/hotel') && auth.role != UserRole.hotelAdmin) {
          return _homeRouteForRole(auth.role);
        }
        if (location.startsWith('/admin') && auth.role != UserRole.superAdmin) {
          return _homeRouteForRole(auth.role);
        }

        return null;
      }

      return isOnLogin ? null : '/login';
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

      // --- Agent routes ---
      ShellRoute(
        navigatorKey: _agentShellKey,
        builder: (context, state, child) => AgentShell(child: child),
        routes: [
          GoRoute(
            path: '/agent/home',
            builder: (context, state) => const AgentHomeScreen(),
          ),
          GoRoute(
            path: '/agent/history',
            builder: (context, state) => const AgentHistoryScreen(),
          ),
          GoRoute(
            path: '/agent/settings',
            builder: (context, state) => const AgentSettingsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/agent/hotel/:hotelId/departments',
        builder: (context, state) =>
            AgentDepartmentsScreen(hotelId: state.pathParameters['hotelId']!),
      ),
      GoRoute(
        path: '/agent/challan/pickup/:hotelId',
        builder: (context, state) =>
            PickupFormScreen(hotelId: state.pathParameters['hotelId']!),
      ),
      GoRoute(
        path: '/agent/challan/delivery/:hotelId',
        builder: (context, state) =>
            DeliveryFormScreen(hotelId: state.pathParameters['hotelId']!),
      ),
      GoRoute(
        path: '/agent/challan/:challanId',
        builder: (context, state) {
          final challanId = state.pathParameters['challanId']!;
          final hotelId = state.uri.queryParameters['hotelId'] ?? '';
          final extra = state.extra;
          ChallanResponse? challan;
          if (extra is ChallanResponse) {
            challan = extra;
          }
          return ChallanDetailScreen(
            challanId: challanId,
            hotelId: hotelId.isNotEmpty ? hotelId : challan?.hotelId ?? '',
            challan: challan,
          );
        },
      ),
      GoRoute(
        path: '/agent/challan/:challanId/edit',
        builder: (context, state) {
          final challanId = state.pathParameters['challanId']!;
          final extra = state.extra;
          ChallanResponse? challan;
          String hotelId = state.uri.queryParameters['hotelId'] ?? '';
          if (extra is Map<String, dynamic>) {
            final mapChallan = extra['challan'];
            if (mapChallan is ChallanResponse) {
              challan = mapChallan;
              hotelId = (extra['hotelId'] as String?) ?? challan.hotelId;
            }
          } else if (extra is ChallanResponse) {
            challan = extra;
            hotelId = challan.hotelId;
          }
          return EditChallanScreen(
            challanId: challanId,
            hotelId: hotelId,
            initialChallan: challan,
          );
        },
      ),
      GoRoute(
        path: '/agent/pending-deliveries/:hotelId',
        builder: (context, state) =>
            PendingDeliveriesScreen(hotelId: state.pathParameters['hotelId']!),
      ),
      GoRoute(
        path: '/agent/history/:hotelId',
        builder: (context, state) =>
            ChallanHistoryScreen(hotelId: state.pathParameters['hotelId']!),
      ),
      GoRoute(
        path: '/agent/pending-sync',
        builder: (context, state) => const PendingSyncScreen(),
      ),

      // --- Hotel Admin routes ---
      ShellRoute(
        navigatorKey: _hotelShellKey,
        builder: (context, state, child) => HotelShell(child: child),
        routes: [
          GoRoute(
            path: '/hotel/dashboard',
            builder: (context, state) => const HotelDashboardScreen(),
          ),
          GoRoute(
            path: '/hotel/inventory',
            builder: (context, state) => const LiveInventoryScreen(),
          ),
          GoRoute(
            path: '/hotel/challans',
            builder: (context, state) => const HotelChallanHistoryScreen(),
          ),
          GoRoute(
            path: '/hotel/quality',
            builder: (context, state) => const HotelDamageReportScreen(),
          ),
          GoRoute(
            path: '/hotel/billing',
            builder: (context, state) => const HotelBillingScreen(),
          ),
          GoRoute(
            path: '/hotel/more',
            builder: (context, state) => const HotelMoreScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/hotel/challan/:challanId',
        builder: (context, state) {
          final challanId = state.pathParameters['challanId']!;
          final extra = state.extra;
          ChallanResponse? challan;
          if (extra is ChallanResponse) {
            challan = extra;
          }
          return HotelChallanDetailScreen(
            challanId: challanId,
            challan: challan,
          );
        },
      ),
      GoRoute(
        path: '/hotel/challan/:challanId/edit',
        builder: (context, state) {
          final challanId = state.pathParameters['challanId']!;
          final extra = state.extra;
          ChallanResponse? challan;
          if (extra is ChallanResponse) {
            challan = extra;
          }
          final hotelId =
              state.uri.queryParameters['hotelId'] ?? challan?.hotelId ?? '';
          return EditChallanScreen(
            challanId: challanId,
            hotelId: hotelId,
            initialChallan: challan,
          );
        },
      ),

      // --- Super Admin routes ---
      ShellRoute(
        navigatorKey: _adminShellKey,
        builder: (context, state, child) => AdminShell(child: child),
        routes: [
          GoRoute(
            path: '/admin/dashboard',
            builder: (context, state) => const AdminDashboardScreen(),
          ),
          GoRoute(
            path: '/admin/hotels',
            builder: (context, state) => const AdminHotelsScreen(),
          ),
          GoRoute(
            path: '/admin/items',
            builder: (context, state) => const AdminItemsScreen(),
          ),
          GoRoute(
            path: '/admin/users',
            builder: (context, state) => const AdminUsersScreen(),
          ),
          GoRoute(
            path: '/admin/agents',
            builder: (context, state) => const AdminMappingsScreen(),
          ),
          GoRoute(
            path: '/admin/quality',
            builder: (context, state) => const AdminQualityScreen(),
          ),
          GoRoute(
            path: '/admin/reports',
            builder: (context, state) => const AdminBillingScreen(),
          ),
          GoRoute(
            path: '/admin/more',
            builder: (context, state) => const AdminMoreScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/admin/hotels/:hotelId',
        builder: (context, state) =>
            AdminHotelDetailScreen(hotelId: state.pathParameters['hotelId']!),
      ),
      GoRoute(
        path: '/admin/challan/:challanId',
        builder: (context, state) {
          final challanId = state.pathParameters['challanId']!;
          final extra = state.extra;
          ChallanResponse? challan;
          if (extra is ChallanResponse) {
            challan = extra;
          }
          return AdminChallanDetailScreen(
            challanId: challanId,
            challan: challan,
          );
        },
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
});

class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier(this.ref) {
    _sub = ref.listen<AuthState>(
      authStateProvider,
      (_, next) => notifyListeners(),
    );
  }

  final Ref ref;
  late final ProviderSubscription<AuthState> _sub;

  @override
  void dispose() {
    _sub.close();
    super.dispose();
  }
}

String _homeRouteForRole(UserRole role) {
  return switch (role) {
    UserRole.serviceAgent => '/agent/home',
    UserRole.hotelAdmin => '/hotel/dashboard',
    UserRole.superAdmin => '/admin/dashboard',
  };
}
