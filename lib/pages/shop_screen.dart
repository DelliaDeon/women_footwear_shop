import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/shoe_tile.dart';
import 'package:sneaker_shop/models/shoe_details.dart';
import 'package:sneaker_shop/pages/see_all.dart';

import '../models/cart.dart';

class ShopScreen extends StatefulWidget {
  ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // search bar
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.pink.shade50,
                    fontSize: 20,
                  ),
                  icon: Icon(Icons.search, color: Colors.pink.shade50,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
            SizedBox(height: 10,),

            // message
            Text('Everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.pink.shade400),
            ),

            SizedBox(height: 22,),

            // hot picks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hot Picks', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade900,
                ),), 

                GestureDetector(
                  onTap: (){
                    print('Tapped on see all');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SeeAll()),
                    );
                  },
                  child: Text('See All', style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),),
                )
              ],
            ),
            SizedBox(height: 10,),

            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
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
            )
          ],
        ),
      ),
    );
  }
}
