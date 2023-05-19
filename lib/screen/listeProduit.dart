import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screen/panierScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constance.dart';
import '../services/vendeurService.dart';

class ListeProduit extends StatefulWidget {
  final String name;
  final String uid;
  final String number;

  const ListeProduit(
      {super.key, required this.uid, required this.name, required this.number});

  @override
  State<ListeProduit> createState() => _ListeProduitState();
}

class _ListeProduitState extends State<ListeProduit> {
  User? _user = FirebaseAuth.instance.currentUser;
  Vendeur_service _vendeur_service = Vendeur_service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          " ${widget.name}",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 21,
              letterSpacing: 4,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PanierScreen(),
                  maintainState: false,
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: StreamBuilder<QuerySnapshot>(
          stream: _vendeur_service.getProduitVendeur(widget.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data!.docs;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 2.8 / 4.4,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext ctx, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(115, 227, 206, 206),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          ////Row(
                          //children: [
                          //IconButton(
                          // onPressed: (() {}),
                          // icon: Icon(Icons.heat_pump_rounded))
                          // ],
                          //),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Container(
                              height: 100,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                // image: DecorationImage(
                                //     image: NetworkImage(
                                //         "${product['imageUrl']}"
                                //         )
                                //         )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Prix :${product['Prix']}",
                            style: TextStyle(color: primaryColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            product["Description"],
                            style: TextStyle(color: primaryColor),
                          ),

                          TextButton(
                              onPressed: (() {}),
                              child: Text(
                                "Add to cart",
                                style: TextStyle(color: primaryColor),
                              ))
                        ],
                      ),

                      // Text("your text"),
                    ),
                  ); // Replace with your custom item widget
                },
              );
            } else if (snapshot.hasError) {
              return Text("Une erreur s'est produite.");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: (() {}), icon: Icon(Icons.heat_pump_rounded))
              ],
            ),
            Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.lightBlue),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'rrrr',
              style: TextStyle(color: Colors.orange),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              " your describtion bla bla",
              style: TextStyle(color: Colors.orange),
            ),
            Divider(
              thickness: 1.4,
            ),
            TextButton(
                onPressed: (() {}),
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.orange),
                ))
          ],
        ),

        // Text("your text"),
      ),
    );
  }
}
