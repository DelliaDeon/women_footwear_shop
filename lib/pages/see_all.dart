import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe_details.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  Cart cart = Cart();

  // adding a shoe to cart
  void addShoeToCart(ShoeDetails shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert to show when it has been added succesfully
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.pink.shade500,
        title: Text('Successfully added!', style: TextStyle(
          color: Colors.white,
        ),),
        content: Text('Check your cart', style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.all(25),
        child: Scaffold(
          backgroundColor: Colors.pink.shade100,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('All Items', style: TextStyle(
              color: Colors.pink.shade800,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),),

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
                        onTap: (){
                          Navigator.pushNamed(context, '/home');
                        },
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
          ),

          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: cart.shoeShop.length,
              itemBuilder: (context, index){
                // get a shoe
                ShoeDetails shoe = value.getShoeList()[index];

                // return a shoe
                return ShoeTile(shoe: shoe, onTap: (){
                  addShoeToCart(shoe);
                },);
              }
            ),
         ),
        ),
      ),
    );
  }
}
