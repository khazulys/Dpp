import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Pengaturan')),
      content: const Center(child: Text('Settings Page')),
    );
  }
}
