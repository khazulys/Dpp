import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/providers/providers.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/cart_repository.dart';
import 'data/repositories/wishlist_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize repositories
  final authRepo = AuthRepository();
  await authRepo.init();
  
  final cartRepo = CartRepository();
  await cartRepo.init();
  
  final wishlistRepo = WishlistRepository();
  await wishlistRepo.init();
  
  runApp(
    const ProviderScope(
      child: DPPStoreApp(),
    ),
  );
}

class DPPStoreApp extends ConsumerWidget {
  const DPPStoreApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final theme = isDarkMode ? AppTheme.createDarkTheme() : AppTheme.createLightTheme();
    final materialTheme = isDarkMode ? AppTheme.materialDarkTheme() : AppTheme.materialLightTheme();
    
    return MaterialApp.router(
      title: 'DPP Store',
      debugShowCheckedModeBanner: false,
      theme: materialTheme,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return FAnimatedTheme(
          data: theme,
          child: child!,
        );
      },
    );
  }
}
