import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Product Detail')),
      content: Center(child: Text('Product: $productId')),
    );
  }
}
