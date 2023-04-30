import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constance.dart';
import 'package:e_commerce/services/vendeurService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

class produit_vendeur extends StatefulWidget {
  final String name;
  final String uid;
  final String number;

  const produit_vendeur(
      {super.key, required this.uid, required this.name, required this.number});

  @override
  State<produit_vendeur> createState() => _produit_vendeurState();
}

class _produit_vendeurState extends State<produit_vendeur> {
  User? _user = FirebaseAuth.instance.currentUser;
  Vendeur_service _vendeur_service = Vendeur_service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          widget.name,
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: StreamBuilder<QuerySnapshot>(
            stream: _vendeur_service.getProduitVendeur(widget.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
              return Column(
                verticalDirection: VerticalDirection.down,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          color: Colors.white),
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.transparent,
                                      ),
                                      child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 0.0),
                                          leading: Container(
                                            padding:
                                                EdgeInsets.only(right: 12.0),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: new BorderSide(
                                                        width: 1.0,
                                                        color: Color(
                                                            0xFFD9D9D9)))),
                                            child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    "${document['imageUrl']}")),
                                          ),
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Prix :${document['Prix']}",
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    document["Description"],
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            letterSpacing: 5),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(document["nomProjet"])
                                                ],
                                              ),
                                            ],
                                          ),
                                          subtitle: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(document["nomProduit"]),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "",
                                              ),
                                            ],
                                          ),
                                          trailing: Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Color(0xFFD9D9D9),
                                              size: 30.0)),
                                    )),
                                Divider(
                                  color: Color(0xFFD9D9D9),
                                  indent:
                                      MediaQuery.of(context).size.width * 0.21,
                                  endIndent:
                                      MediaQuery.of(context).size.width * 0.21,
                                  thickness: 1.5,
                                )
                              ],
                            );
                          }).toList()),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
