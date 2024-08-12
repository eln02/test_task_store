import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_store/ui/auth/sign_up_form.dart';
import 'package:test_task_store/ui/products/favorite_products_page.dart';

import 'package:test_task_store/ui/products/product_page.dart';
import 'package:test_task_store/ui/products/products_page.dart';
import 'package:test_task_store/ui/products/search_page.dart';
import 'package:test_task_store/ui/profile/profile_page.dart';
import 'package:test_task_store/ui/routing/root_screen.dart';
import 'package:test_task_store/ui/state/auth/auth_provider.dart';

import '../auth/sign_in_form.dart';



final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/notes',
    routes: [
      // BottomNavigationBar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        redirect: (context, state) {
          final isAuthenticated = ref.read(authProvider).isAuthenticated;
          if (!isAuthenticated) {
            return '/sign_up';
          } else {
            return null;
          }
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/notes',
                  builder: (context, state) => const ProductsPage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => ProductPage(id: state.pathParameters['id']!),
                    ),
                    GoRoute(
                      path: 'search',
                      builder: (context, state) => const SearchPage(),
                      routes: [
                        GoRoute(
                          path: 'detail/:id',
                          builder: (context, state) => ProductPage(id: state.pathParameters['id']!),
                        ),
                      ]
                    ),
                  ],

              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoriteProductsPage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => ProductPage(id: state.pathParameters['id']!),
                    ),
                  ]
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => const SignInForm(),
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) => const SignUpForm(),
      ),
    ],
  );
});
