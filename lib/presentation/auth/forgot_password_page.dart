import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Forgot Password')),
      content: const Center(child: Text('Forgot Password Page')),
    );
  }
}
