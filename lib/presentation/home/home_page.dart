import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredProducts = ref.watch(featuredProductsProvider);
    
    return FScaffold(
      header: FHeader(
        title: const Text('DPP Store'),
        actions: [
          FButton(
            onPress: () => context.push('/notifications'),
            style: FButtonStyle.outline,
            child: const FIcon(FIcons.bell),
          ),
        ],
      ),
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Selamat Datang di DPP Store', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            featuredProducts.when(
              data: (products) => Wrap(
                spacing: 12,
                runSpacing: 12,
                children: products.take(6).map((product) {
                  return FCard(
                    child: InkWell(
                      onTap: () => context.push('/product/${product.id}'),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                            Text('Rp ${product.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
            ),
          ],
        ),
      ),
    );
  }
}
