import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: const Text('Login'),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FTextField(
              controller: _emailController,
              hint: 'Email',
            ),
            const SizedBox(height: 16),
            FTextField(
              controller: _passwordController,
              hint: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 24),
            FButton(
              onPress: () => context.go('/home'),
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            FButton(
              onPress: () => context.push('/register'),
              style: FButtonStyle.secondary,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
