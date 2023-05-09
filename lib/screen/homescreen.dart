import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constance.dart';
import 'package:e_commerce/screen/produit_vendeur.dart';
import 'package:e_commerce/services/vendeurService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  Vendeur_service _vendeur_service = Vendeur_service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: StreamBuilder<QuerySnapshot>(
            stream: _vendeur_service.getVendeur(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
              // }
              return Column(
                verticalDirection: VerticalDirection.down,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Tous les boutiques',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: primaryColor,
                                    fontSize: 21,
                                    letterSpacing: 4))),
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
                            return InkWell(
                              onTap: () {
                                EasyLoading.showInfo(document['id']);
                                // print(document['id']);
                                print(document['insta_boutique']);
                                print(document['nom boutique']);
                                print(document["id"]);
                                // print(document['Number']);

                                pushNewScreenWithRouteSettings(context,
                                    screen: produit_vendeur(
                                      name: document['nom boutique'],
                                      uid: document['id'],
                                      number: document['emailVendeur'],
                                    ),
                                    settings: RouteSettings(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.transparent,
                                        ),
                                        child: ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15.0,
                                                    vertical: 0.0),
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
                                                    "${document['image boutique']}"),
                                              ),
                                            ),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // CircleAvatar(
                                                        //   backgroundImage:
                                                        //       NetworkImage(
                                                        //           "${document['image boutique']}"),
                                                        //   radius: 18,
                                                        //   backgroundColor:
                                                        //       Colors
                                                        //           .transparent,
                                                        // ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "${document['nom boutique']}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          // style: GoogleFonts.montserrat(
                                                          //     textStyle: TextStyle(
                                                          //         color:
                                                          //             Colors.black,
                                                          //         fontWeight: FontWeight.w400,
                                                          //         fontSize: 15))
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            "${document['insta_boutique']}"),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "",
                                                          // style: GoogleFonts.montserrat(
                                                          //     textStyle: TextStyle(
                                                          //         color:
                                                          //             Colors.black,
                                                          //         fontWeight: FontWeight.w400,
                                                          //         fontSize: 15))
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "asset/montre.jpg",
                                                  height: 15,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "",
                                                  // style: GoogleFonts.montserrat(
                                                  //     textStyle: TextStyle(
                                                  //         fontSize: 8,
                                                  //         color:
                                                  //             taktak_color2,
                                                  //         fontWeight:
                                                  //             FontWeight
                                                  //                 .w400)),
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
                                    indent: MediaQuery.of(context).size.width *
                                        0.21,
                                    endIndent:
                                        MediaQuery.of(context).size.width *
                                            0.21,
                                    thickness: 1.5,
                                  )
                                ],
                              ),
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
