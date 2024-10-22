import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/pages/homepage.dart';
import 'package:sneaker_shop/pages/intro_screen.dart';

void main(){
  runApp(SneakerShop());
}

class SneakerShop extends StatelessWidget {
  const SneakerShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/intro',

        routes: {
          '/intro': (context) => IntroScreen(),
          '/home': (context) => HomePage(),
        },
      ) ,
    );

    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro',

      routes: {
        '/intro': (context) => IntroScreen(),
        '/home': (context) => HomePage(),
      },
    );*/
  }
}
