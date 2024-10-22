import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        tabBorderRadius: 12,
        onTabChange: (value)  {
          if (onTabChange != null) {
            onTabChange!(value);
          }
        },
        tabBackgroundColor: Colors.pink.shade200,
        mainAxisAlignment: MainAxisAlignment.center,
        backgroundColor: Colors.pink.shade100,
        activeColor: Colors.white, // Color of icon and text if active
        tabActiveBorder: Border.all(color: Colors.pink.shade400),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'SHOP',
          ),

          GButton(
            icon: Icons.shopping_cart,
            text: 'CART',
          ),
        ]
      ),
    );
  }
}
