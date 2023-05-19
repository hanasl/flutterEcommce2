import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../services/vendeurService.dart';
import 'EditProduit.dart';
import 'editprofil.dart';
import 'login.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    image:
                        DecorationImage(image: AssetImage('asset/montre.jpg')),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Hana',
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      'Hana@gmail.com',
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                pushNewScreenWithRouteSettings(context,
                    screen: EditProfil(),
                    settings: RouteSettings(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
              child: ListTile(
                title: Text("Modifier Profile"),
                leading: Image.asset(
                  'asset/editprofil.png',
                  width: 30,
                  height: 30,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),

          Container(
            child: MaterialButton(
              onPressed: () {},
              child: ListTile(
                title: Text("Historique"),
                leading: Image.asset(
                  'asset/historique.png',
                  width: 30,
                  height: 30,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                pushNewScreenWithRouteSettings(context,
                    screen: EditProfil(),
                    settings: RouteSettings(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
              child: ListTile(
                title: Text("Modifier Votre Boutique"),
                leading: Image.asset(
                  'asset/boutique.png',
                  width: 30,
                  height: 30,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                pushNewScreenWithRouteSettings(context,
                    screen: EditProfil(),
                    settings: RouteSettings(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
              child: ListTile(
                title: Text("Modifier Votre Boutique"),
                leading: Image.asset(
                  'asset/boutique.png',
                  width: 30,
                  height: 30,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: MaterialButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => loginScreen(),
                        maintainState: false));
              },
              child: ListTile(
                title: Text("LogOut"),
                leading: Image.asset(
                  'asset/logoutt.png',
                  width: 30,
                  height: 30,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          // Text('creer votre boutique')
        ],
      ),
    ));
  }
}
