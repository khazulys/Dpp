import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Register')),
      content: const Center(child: Text('Register Page')),
    );
  }
}
