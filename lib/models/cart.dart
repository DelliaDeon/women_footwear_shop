import 'package:flutter/cupertino.dart';
import 'package:sneaker_shop/models/shoe_details.dart';

class Cart extends ChangeNotifier{

  // list of shoes for sale
  List<ShoeDetails> shoeShop = [
    ShoeDetails(
      name: 'Fur Heels',
      price: 100,
      image: 'lib/images/pink heel.png',
      description: 'Fur Ankle Strap Sandal Heels - Beige',
    ),

    ShoeDetails(
      name: 'Platform Heels',
      price: 170,
      image: 'lib/images/black heel.png',
      description: 'TRIZCHLOR 2022 Summer 9_5Cm High Heels ',
    ),

    ShoeDetails(
      name: 'Casual Shoes',
      price: 100,
      image: 'lib/images/white-women-sneakers-small.png',
      description: 'Versatile Casual Elevator Shoes - Milk tea color, 36',
    ),

    ShoeDetails(
      name: 'Trizchlor Shoes',
      price: 50,
      image: 'lib/images/white-women-sneakers.png',
      description: 'Casual Platform Sneakers Basket - White1 _ 36',
    ),

    ShoeDetails(
      name: 'Heel Boots',
      price: 250,
      image: 'lib/images/black boots.png',
      description: 'Platform Heel Boots - Black',
    ),

    ShoeDetails(
      name: 'Elegant Heel',
      price: 100,
      image: 'lib/images/one black heel.png',
      description: 'Feminine and Elegant Heel for Women - Black & Silver',
    ),

  ];

  // get list of shoes for sale
  List<ShoeDetails> getShoeList (){
    return shoeShop;
  }


  // list of items in user cart
  List<ShoeDetails> userCart = [];

  // get cart
  List <ShoeDetails> getUserCart(){
    return userCart;
  }

  // add items to the cart
  void addItemToCart(ShoeDetails shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from the cart
  void removeItemFromCart(ShoeDetails shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}