import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Keranjang')),
      content: const Center(child: Text('Cart Page')),
    );
  }
}
