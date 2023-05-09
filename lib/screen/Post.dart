// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce/constance.dart';
// import 'package:e_commerce/provider/image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:provider/provider.dart';

// class postSCreen extends StatefulWidget {
//   const postSCreen({super.key});

//   @override
//   State<postSCreen> createState() => _postSCreenState();
// }

// class _postSCreenState extends State<postSCreen> {
//   final Random _random = Random();
//   String? imageUrl1;

//   String generateRandomName(int length) {
//     const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
//     return String.fromCharCodes(Iterable.generate(
//         length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
//   }

//   var _nomProjet = TextEditingController();
//   var _nomProduit = TextEditingController();
//   var _prix = TextEditingController();
//   var _description = TextEditingController();
//   String? nomProjet;
//   String? nomProduit;
//   String? prix;
//   String? description;
//   @override
//   Widget build(BuildContext context) {
//     final image = Provider.of<picture>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: Text("Ajouter Votre Produit"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 80,
//                 ),
//                 TextField(
//                   controller: _nomProjet,
//                   decoration: InputDecoration(
//                     hintText: 'Nom Projet',
//                     labelText: 'Entrer le nom de votre projet',
//                   ),
//                   onChanged: (value) {
//                     nomProjet = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextField(
//                   controller: _nomProduit,
//                   decoration: InputDecoration(
//                     hintText: 'Nom Produit',
//                     labelText: '  Entrer le nom de produit',
//                   ),
//                   // autofocus: false,
//                   keyboardType: TextInputType.emailAddress,
//                   maxLength: 40,
//                   onChanged: (value) {
//                     nomProduit = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextField(
//                   controller: _prix,
//                   decoration: InputDecoration(
//                     hintText: 'Prix',
//                     labelText: 'Entrer le prix',
//                   ),
//                   // autofocus: false,
//                   keyboardType: TextInputType.emailAddress,
//                   maxLength: 40,
//                   onChanged: (value) {
//                     prix = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextField(
//                   controller: _description,
//                   decoration: InputDecoration(
//                     hintText: 'Description',
//                     labelText: 'Entrer la description',
//                   ),
//                   // autofocus: false,
//                   keyboardType: TextInputType.emailAddress,
//                   maxLength: 40,
//                   onChanged: (value) {
//                     description = value;
//                   },
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 ElevatedButton(
//                   child: Text("camera"),
//                   onPressed: () => image.addCamera(),
//                   style:
//                       ElevatedButton.styleFrom(backgroundColor: primaryColor),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 ElevatedButton(
//                     child: Text("Gallery"),
//                     onPressed: () => image.addGallery(),
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: primaryColor)),
//                 ElevatedButton(
//                     child: Text("Ajouter"),
//                     onPressed: () async {
//                       print(image.imagee);

//                       final randomName = generateRandomName(10);

//                       final ref = FirebaseStorage.instance
//                           .ref()
//                           .child('les produits')
//                           .child(randomName + '.jpg');
//                       await ref.putFile(image.imagee);
//                       imageUrl1 = await ref.getDownloadURL();
//                       print(imageUrl1);
//                       final User? _userr = FirebaseAuth.instance.currentUser;
//                       final _uid = _userr!.uid;
//                       await FirebaseFirestore.instance
//                           .collection("utilisateur")
//                           .doc(_uid)
//                           .collection('produit')
//                           .doc()
//                           .set({
//                         "nomProjet": nomProjet,
//                         "nomProduit": nomProduit,
//                         "Prix": '${prix}€',
//                         "Description": description,
//                         "imageUrl": imageUrl1
//                       });
//                     },
//                     style: ElevatedButton.styleFrom()),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }