import 'package:cloud_firestore/cloud_firestore.dart';

class Vendeur_service {
  getVendeur() {
    return FirebaseFirestore.instance.collection("boutique").snapshots();
  }

  getProduitVendeur(V_id) {
    return FirebaseFirestore.instance
        .collection("boutique")
        .doc(V_id)
        .collection("tous les produit")
        .snapshots();
  }
}
