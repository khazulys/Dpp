import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class AddAddressPage extends StatelessWidget {
  final String? addressId;
  const AddAddressPage({super.key, this.addressId});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: Text(addressId == null ? 'Tambah Alamat' : 'Edit Alamat')),
      content: const Center(child: Text('Add/Edit Address Page')),
    );
  }
}
