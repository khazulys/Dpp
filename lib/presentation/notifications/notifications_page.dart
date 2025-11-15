import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Notifikasi')),
      content: const Center(child: Text('Notifications Page')),
    );
  }
}
