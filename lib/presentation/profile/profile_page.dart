import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    
    return FScaffold(
      header: FHeader(title: const Text('Profil')),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(user?.name ?? 'Guest', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(user?.email ?? ''),
            const SizedBox(height: 32),
            ListTile(
              leading: const FIcon(FIcons.package),
              title: const Text('Pesanan Saya'),
              onTap: () => context.push('/orders'),
            ),
            ListTile(
              leading: const FIcon(FIcons.mapPin),
              title: const Text('Alamat'),
              onTap: () => context.push('/addresses'),
            ),
            ListTile(
              leading: const FIcon(FIcons.tag),
              title: const Text('Voucher'),
              onTap: () => context.push('/vouchers'),
            ),
            ListTile(
              leading: const FIcon(FIcons.settings),
              title: const Text('Pengaturan'),
              onTap: () => context.push('/settings'),
            ),
            const SizedBox(height: 32),
            if (user != null) 
              FButton(
                onPress: () => context.go('/login'),
                style: FButtonStyle.destructive,
                child: const Text('Logout'),
              )
            else
              FButton(
                onPress: () => context.push('/login'),
                child: const Text('Login'),
              ),
          ],
        ),
      ),
    );
  }
}
