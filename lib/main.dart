import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/ui/routing/app_routing.dart';
import 'package:test_task_store/ui/state/auth/auth_controller.dart';
import 'package:test_task_store/ui/state/auth/auth_provider.dart';
import 'package:test_task_store/ui/state/auth/auth_state.dart';
import 'package:test_task_store/ui/state/products/auth_controller.dart';
import 'package:test_task_store/ui/state/products/auth_state.dart';
import 'package:test_task_store/ui/state/products/products_provider.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // предзагрузка
  final n = MyStateController(ProductState(
      myProducts: [],
      selectedProducts: [],
      searchResults: [],
      isLoaded: false));

  final AuthController a = AuthController(AuthState(
      isAuthenticated: false, name: null, mail: null, password: null));

  await n.refreshData();
  await a.loadData();

  runApp(ProviderScope(
    overrides: [
      productProvider.overrideWith((ref) => n),
      authProvider.overrideWith((ref) => a)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      theme: theme,
    );
  }
}
