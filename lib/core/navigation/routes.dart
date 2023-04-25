import 'package:digifood/features/cart/presentation/screen/cart.dart';
import 'package:digifood/features/catalog/presentation/screen/catalog.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey, child: const CatalogPage()),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
  ],
);
