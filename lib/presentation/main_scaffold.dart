import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import '../core/providers/providers.dart';

class MainScaffold extends ConsumerWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    
    return Scaffold(
      body: child,
      bottomNavigationBar: FBottomNavigationBar(
        index: currentIndex,
        onChange: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/products');
              break;
            case 2:
              context.go('/cart');
              break;
            case 3:
              context.go('/profile');
              break;
          }
        },
        children: [
          FBottomNavigationBarItem(
            icon: FIcon(FIcons.home),
            label: 'Beranda',
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FIcons.shoppingBag),
            label: 'Produk',
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FIcons.shoppingCart),
            label: 'Keranjang',
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FIcons.user),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
