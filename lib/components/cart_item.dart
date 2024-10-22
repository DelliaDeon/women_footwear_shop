import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe_details.dart';

class CartItem extends StatefulWidget {
  ShoeDetails shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.shoe.image),
      title: Text(widget.shoe.name),
      subtitle: Text("\$" + widget.shoe.price.toString()),
      trailing: IconButton(
        onPressed: removeItemFromCart,
        icon: Icon(Icons.delete),
      ),
    );
  }
}
