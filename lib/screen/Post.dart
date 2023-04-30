import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constance.dart';
import 'homescreen.dart';
import 'login.dart';
import 'package:e_commerce/provider/image.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<picture>(context, listen: false);
    final Random _random = Random();
    String? imageUrl1;

    String generateRandomName(int length) {
      const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
      return String.fromCharCodes(Iterable.generate(
          length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
    }

    var _nomProjet = TextEditingController();
    var _nomProduit = TextEditingController();
    var _prix = TextEditingController();
    var _description = TextEditingController();
    String? nomProjet;
    String? nomProduit;
    String? prix;
    String? description;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Column(
            children: [
              Text(
                "Ajouter Votre Produit,",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // TextField(
              //   controller: _nomProjet,
              //   //cursorColor: secondaryColor,
              //   decoration: InputDecoration(
              //     hintText: 'Nom Projet',
              //     labelText: '  Entrer le nom de votre Projet',
              //   ),
              //   // autofocus: false,
              //   keyboardType: TextInputType.emailAddress,
              //   maxLength: 40,
              //   onChanged: (value) {
              //     nomProjet = value;
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              // TextField(
              //   controller: _nomProduit,
              //   decoration: InputDecoration(
              //     hintText: 'Nom Produit',
              //     labelText: '  Entrer le nom de produit',
              //   ),
              //   // autofocus: false,
              //   keyboardType: TextInputType.emailAddress,
              //   maxLength: 40,
              //   onChanged: (value) {
              //     nomProduit = value;
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              // TextField(
              //   controller: _prix,
              //   decoration: InputDecoration(
              //     hintText: 'Prix',
              //     labelText: 'Entrer le prix',
              //   ),
              //   // autofocus: false,
              //   keyboardType: TextInputType.emailAddress,
              //   maxLength: 40,
              //   onChanged: (value) {
              //     prix = value;
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              // TextField(
              //   controller: _description,
              //   decoration: InputDecoration(
              //     hintText: 'Description',
              //     labelText: 'Entrer la description',
              //   ),
              //   // autofocus: false,
              //   keyboardType: TextInputType.emailAddress,
              //   maxLength: 40,
              //   onChanged: (value) {
              //     description = value;
              //   },
              // ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  child: Text("camera"), onPressed: () => image.addCamera()),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  child: Text("Gallery"),
                  onPressed: () => image.addGallery(),
                  style: ElevatedButton.styleFrom()),
              InkWell(
                child: Text("tester upload"),
                onTap: () async {
                  // print(image.imagee);
                  //? houni atytou ism aleatoire

                  final randomName = generateRandomName(10);
                  //? edheya script li yaaml upload
                  final ref = FirebaseStorage.instance
                      .ref()
                      .child('les produits')
                      .child(randomName + '.jpg');
                  await ref.putFile(image.imagee);

                  imageUrl1 = await ref.getDownloadURL();
                  print(imageUrl1);
                  EasyLoading.showSuccess("mriguel");
                },
              ),
              MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  color: primaryColor,
                  child: Text(
                    "Ajouter",
                    style: TextStyle(),
                  ),
<<<<<<< HEAD
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    nomProjet = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _nomProduit,
                  decoration: InputDecoration(
                    hintText: 'Nom Produit',
                    labelText: '  Entrer le nom de produit',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    nomProduit = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _prix,
                  decoration: InputDecoration(
                    hintText: 'Prix',
                    labelText: 'Entrer le prix',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    prix = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _description,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    labelText: 'Entrer la description',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    description = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Ajouter des images"),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    child: Text("camera"), onPressed: () => image.addCamera()),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    child: Text("Gallery"),
                    onPressed: () => image.addGallery(),
                    style: ElevatedButton.styleFrom()),
                InkWell(
                  child: Text("tester upload"),
                  onTap: () async {
                    // print(image.imagee);
                    //? houni atytou ism aleatoire
=======
                  padding: EdgeInsets.all(10),
                  onPressed: () async {
                    print(image.imagee);
>>>>>>> af519397ea1633ef19134d890fac28f9b3dbae18

                    final randomName = generateRandomName(10);

                    final ref = FirebaseStorage.instance
                        .ref()
                        .child('les produits')
                        .child(randomName + '.jpg');
                    await ref.putFile(image.imagee);
                    imageUrl1 = await ref.getDownloadURL();
                    print(imageUrl1);
<<<<<<< HEAD
                    EasyLoading.showSuccess("Succesfull");
                  },
                ),
                MaterialButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    color: primaryColor,
                    child: Text(
                      "Ajouter",
                      style: TextStyle(),
                    ),
                    padding: EdgeInsets.all(10),
                    onPressed: () async {
                      print(image.imagee);

                      final randomName = generateRandomName(10);

                      final ref = FirebaseStorage.instance
                          .ref()
                          .child('les produits')
                          .child(randomName + '.jpg');
                      await ref.putFile(image.imagee);
                      imageUrl1 = await ref.getDownloadURL();
                      print(imageUrl1);
                      final User? _userr = FirebaseAuth.instance.currentUser;
                      final _uid = _userr!.uid;
                      await FirebaseFirestore.instance
                          .collection("utilisateur")
                          .doc(_uid)
                          .collection('produit')
                          .doc()
                          .set({
                        "nomProjet": nomProjet,
                        "nomProduit": nomProduit,
                        "Prix": prix,
                        "Description": description,
                        "imageUrl": imageUrl1
                      });
                    }),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
=======
                    final User? _userr = FirebaseAuth.instance.currentUser;
                    final _uid = _userr!.uid;
                    await FirebaseFirestore.instance
                        .collection("utilisateur")
                        .doc(_uid)
                        .collection('produit')
                        .doc()
                        .set({
                      "nomProjet": nomProjet,
                      "nomProduit": nomProduit,
                      "Prix": prix,
                      "Description": description,
                      "imageUrl": imageUrl1
                    });
                  }),
              SizedBox(
                height: 40,
              ),
            ],
>>>>>>> af519397ea1633ef19134d890fac28f9b3dbae18
          ),
        ),
      ),
    );
  }
}
