import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constance.dart';
import 'package:e_commerce/provider/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ajouterProduit extends StatefulWidget {
  const ajouterProduit({super.key});

  @override
  State<ajouterProduit> createState() => _ajouterProduitState();
}

class _ajouterProduitState extends State<ajouterProduit> {
  final Random _random = Random();
  String? imageUrl1;

  String generateRandomName(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
  }

  var _nomProjet = TextEditingController();
  var _nomBoutique = TextEditingController();
  var _nomProduit = TextEditingController();
  var _prix = TextEditingController();
  var _description = TextEditingController();
  var _instagram = TextEditingController();
  File? _pickedImage;
  ImagePicker? imagePicker;
  final ImagePicker _picker = ImagePicker();
  String? nomProjet;
  String? nomProduit;
  String? prix;
  String? description;
  String? nom_boutique;
  String? insta_boutique;
//! edheya fonction li taaml read lil donnée te3 current user
  @override
  void initState() {
    getUser_Data();
    super.initState();
  }

  var user_data;

  Future<DocumentSnapshot> getUser_Data() async {
    final User? user1 = FirebaseAuth.instance.currentUser;
    String? _uid = user1!.uid;
    var result1 = await FirebaseFirestore.instance
        .collection('utilisateur')
        .doc(_uid)
        .get();
    setState(() {
      user_data = result1;
    });
    return result1;
  }

  @override
  Widget build(BuildContext context) {
    // final image = Provider.of<picture>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Ajouter produit"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                // TextField(
                //   controller: _nomBoutique,
                //   decoration: InputDecoration(
                //     hintText: 'Nom Projet',
                //     labelText: "Entrer le nom du boutique",
                //   ),
                //   onChanged: (value) {
                //     nom_boutique = value;
                //   },
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                TextField(
                  controller: _nomProjet,
                  decoration: InputDecoration(
                    hintText: 'Nom Projet',
                    labelText: 'Entrer le nom de votre projet',
                  ),
                  onChanged: (value) {
                    nomProjet = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _nomProduit,
                  decoration: InputDecoration(
                    hintText: 'Nom Produit',
                    labelText: '  Entrer le nom de produit',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    nomProduit = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _prix,
                  decoration: InputDecoration(
                    hintText: 'Prix',
                    labelText: 'Entrer le prix',
                  ),
                  // autofocus: false,
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  onChanged: (value) {
                    prix = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      description = value;
                    },
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      // hintStyle: GoogleFonts.raleway(
                      //   letterSpacing: 14,
                      // ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
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
                  height: 30,
                ),
                // TextField(
                //   controller: _instagram,
                //   decoration: InputDecoration(
                //     hintText: 'insta boutique',
                //     labelText: 'Entrer le compte instagram de la boutique',
                //   ),
                //   // autofocus: false,
                //   keyboardType: TextInputType.emailAddress,
                //   maxLength: 40,
                //   onChanged: (value) {
                //     insta_boutique = value;
                //   },
                // ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text("camera"),
                      onPressed: () => addCamera(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        child: Text("Gallery"),
                        onPressed: () => addGallery(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.41,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: _pickedImage == null
                          ? Center(
                              child: Text(
                                'Add a picture',
                              ),
                            )
                          : InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.598,
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(164, 76, 175, 79),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(_pickedImage!),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                ),
                ElevatedButton(
                    child: Text("Ajouter cet produit"),
                    onPressed: () async {
                      print(_pickedImage);

                      final randomName = generateRandomName(10);

                      final ref = FirebaseStorage.instance
                          .ref()
                          .child('les produits')
                          .child(randomName + '.jpg');
                      await ref.putFile(_pickedImage!);
                      imageUrl1 = await ref.getDownloadURL();
                      print(imageUrl1);
                      final User? _userr = FirebaseAuth.instance.currentUser;
                      final _uid = _userr!.uid;
                      // await FirebaseFirestore.instance
                      //     .collection('boutique')
                      //     .doc(_uid)
                      //     .set({
                      //   "nom boutique": nom_boutique,
                      //   // "image boutique": imageUrl1,
                      //   "insta_boutique": insta_boutique,
                      //   "nomVendeur": user_data["Name"],
                      //   "emailVendeur": user_data["Email"],
                      //   "num Vendeur": user_data["Number"],
                      //   'id': user_data["id"],
                      // });

                      await FirebaseFirestore.instance
                          .collection("boutique")
                          .doc(_uid)
                          .collection('tous les produit')
                          .doc()
                          .set({
                        // "nomVendeur": user_data["Name"],
                        // "emailVendeur": user_data["Email"],
                        // "num Vendeur": user_data["Number"],
                        // "nom boutique": nom_boutique,
                        "nomProjet": nomProjet,
                        "nomProduit": nomProduit,
                        "Prix": '${prix}€',
                        "Description": description,
                        "imageUrl": imageUrl1,
                        // "insta_boutique": ""
                      });
                    },
                    style: ElevatedButton.styleFrom()),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _pickedImage = File(pickedFile!.path);
    // notifyListeners();
    if (_pickedImage != null) {
      _pickedImage;

      // notifyListeners();
    } else {}
  }

  addGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _pickedImage = File(pickedFile!.path);
    // notifyListeners();
    if (_pickedImage != null) {
      _pickedImage;
      // notifyListeners();
    } else {}
  }
}
