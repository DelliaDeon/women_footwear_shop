import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/bottom_nav_bar.dart';
import 'package:sneaker_shop/pages/cart_screen.dart';
import 'package:sneaker_shop/pages/shop_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void navigateBottomBar(index){
    setState(() {
      _selectedTabIndex = index;
    });
  }

  List _pages = [
    ShopScreen(),

    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 32,),
              );
            }
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.pink.shade50,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09,),

                    Image.asset('lib/images/shoe-logo.png',
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    SizedBox(height: 12,),

                    Divider(height: 5, color: Colors.pink.shade200,),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('H O M E'),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('A B O U T'),
                    ),
                  ],
                ),

                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('L O G O U T'),
                  onTap: (){
                    Navigator.pushNamed(context, '/intro');
                  },
                ),
              ],
            ),
          ),
          //width: MediaQuery.of(context).size.width * 0.7,
        ),

        backgroundColor: Colors.pink.shade100,
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectedTabIndex],
      ),
    );
  }
}
