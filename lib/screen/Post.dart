import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constance.dart';
import 'homescreen.dart';
import 'login.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? nomProjet;
    String? nomProduit;
    String? prix;
    String? description;
     File? _imageFile;
    User? _produit = FirebaseAuth.instance.currentUser;
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
          child: Form(
            key: _formKey,
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
                TextField(
                  //cursorColor: secondaryColor,
                  decoration: InputDecoration(
                    hintText: 'Nom Projet',
                    labelText: '  Entrer le nom de votre Projet',
                  ),
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
                SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.photo),
                label: Text('Télécharger une image'),
              ),
              if (_imageFile != null) ...[
                SizedBox(height: 16),
                Image.file(
                  _imageFile!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
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
                      await FirebaseFirestore.instance
                          .collection("Produit")
                          .doc(_produit!.uid)
                          .set({
                        "nomProjet": nomProjet,
                        "nomProduit": nomProduit,
                        "Prix": prix,
                        "Description": description,
                      });
                    }),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
