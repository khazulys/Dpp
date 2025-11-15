import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class ProductListPage extends StatelessWidget {
  final String category;
  const ProductListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: Text(category)),
      content: const Center(child: Text('Product List Page')),
    );
  }
}
