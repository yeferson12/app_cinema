import 'package:flutter/material.dart';

class HomaScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
