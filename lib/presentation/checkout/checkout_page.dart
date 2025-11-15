import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Checkout')),
      content: const Center(child: Text('Checkout Page')),
    );
  }
}
