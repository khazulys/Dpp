import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Alamat')),
      content: const Center(child: Text('Address List Page')),
    );
  }
}
