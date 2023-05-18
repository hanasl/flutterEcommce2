import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constance.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({super.key});

  @override
  State<PanierScreen> createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Mon Panier',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 21,
                      letterSpacing: 4))),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      //color: Color.fromARGB(115, 227, 206, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(115, 227, 206, 206),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            padding: EdgeInsets.only(left: 5),
                            child: Image.asset(
                              "asset/montre.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ggg",
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$ 1234',
                                  style: TextStyle(color: primaryColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    width: 140,
                                    color: Colors.grey.shade200,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 6,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 22, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '\$ 2000',
                          style: TextStyle(fontSize: 22, color: primaryColor),
                        )
                      ],
                    ),
                    Container(
                      height: 100,
                      width: 180,
                      padding: EdgeInsets.all(20),
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(10),
                        color: primaryColor,
                        onPressed: () {},
                        child: Text(
                          'Passer Commande',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
