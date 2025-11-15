import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderId;
  const OrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Detail Pesanan')),
      content: Center(child: Text('Order: $orderId')),
    );
  }
}
