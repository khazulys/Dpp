import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Wishlist')),
      content: const Center(child: Text('Wishlist Page')),
    );
  }
}
