import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/pages/homepage.dart';
import 'package:sneaker_shop/pages/intro_screen.dart';
import 'package:sneaker_shop/pages/see_all.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: SneakerShop(),
  ));
}

class SneakerShop extends StatelessWidget {
  const SneakerShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        initialRoute: '/intro',

        routes: {
          '/intro': (context) => IntroScreen(),
          '/home': (context) => HomePage(),
          '/see_all': (context) => SeeAll(),
        },
    );
  }
}
