import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Edit Profil')),
      content: const Center(child: Text('Edit Profile Page')),
    );
  }
}
