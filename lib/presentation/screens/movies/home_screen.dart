import 'package:cinema_pedia/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomaScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(Environment.theMovieDbKey),
      ),
    );
  }
}
