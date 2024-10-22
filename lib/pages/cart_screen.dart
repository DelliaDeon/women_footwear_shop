import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/cart_item.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            // heading
            Text('My Cart', style: TextStyle(
              color: Colors.pink.shade800,
              fontSize: 28,
            ),),

            SizedBox(height: 30,),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index){
                  // get a shoe
                  ShoeDetails individualShoe = value.getUserCart()[index];

                  // return the cart items
                  return CartItem(shoe: individualShoe);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
