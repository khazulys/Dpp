import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Pesanan Saya')),
      content: const Center(child: Text('Orders Page')),
    );
  }
}
