import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe_details.dart';

class ShoeTile extends StatelessWidget {
  ShoeTile({
    super.key,
    required this.shoe,
    required this.onTap,
  });

  ShoeDetails shoe;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // image
          Container(
          height: MediaQuery.of(context).size.width * 0.7,
            child: Image.asset(shoe.image)),

          // description
          Text(shoe.description, style: TextStyle(
            color: Colors.black54,
            fontSize: MediaQuery.of(context).size.width * 0.05,//20,
            fontWeight: FontWeight.w500,
          ),),

          // name and price
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shoe.name, style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.054,//18,
                    fontWeight: FontWeight.w800,
                  ),),

                  // price
                  Text("\$ ${shoe.price}", style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.045,//16,
                  ),),
                ],
              ),



              // button to add to cart
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.width * 0.14,
                  child: Center(child: Icon(Icons.add_shopping_cart_rounded, color: Colors.white,)),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
