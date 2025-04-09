import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _handleLogin(BuildContext context) {
    final user = _userController.text.trim();
    final pass = _passController.text.trim();

    if (user == 'admin' && pass == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('https://flutter.dev/images/flutter-logo-sharing.png', height: 100),
        const SizedBox(height: 16),
        TextField(
          controller: _userController,
          decoration: const InputDecoration(labelText: 'Usuário'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passController,
          decoration: const InputDecoration(labelText: 'Senha'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () => _handleLogin(context),
          child: const Icon(Icons.login),
        )
      ],
    );
  }
}
