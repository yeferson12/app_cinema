import 'package:flutter/material.dart';


class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.home_max),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.label_outlined),
          label: 'Categori'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite_outline),
          label: 'favoritos'
        )
      ]
      );
  }
}