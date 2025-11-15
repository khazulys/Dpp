import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class VouchersPage extends StatelessWidget {
  const VouchersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Voucher Saya')),
      content: const Center(child: Text('Vouchers Page')),
    );
  }
}
