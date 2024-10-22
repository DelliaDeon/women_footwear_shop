import 'dart:math';

import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink.shade100,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(child: Image.asset('lib/images/shoe-logo.png',
                  height: MediaQuery.of(context).size.width * 0.5,),
                ),
                // logo


                Expanded(child: Column(
                  children: [
                     //title
                    Text('Comfort Wherever You Go', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    Spacer(),

                    // sub title
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              letterSpacing: 0.8,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Brand new ',
                                  style: TextStyle(
                                  )
                              ),
                              TextSpan(
                                  text: 'women sneakers and heels ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent,
                                    fontStyle: FontStyle.italic,
                                  )
                              ),
                              TextSpan(
                                  text: 'made with '
                              ),
                              TextSpan(
                                  text: 'premium quality',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.pinkAccent,
                                  )
                              ),

                            ]
                        )
                    ),
                    Spacer(),
                    Spacer(),


                    // start now button
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Text('Shop Now', style: TextStyle(
                              fontSize: 28,
                              color: Colors.pink.shade50,
                              fontWeight: FontWeight.w400,
                            ),),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade900,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),


                  ],
                )),
                // title


              ],
            ),
          ),
        ),
      ),
    );
  }
}
