import 'package:cloud_firestore/cloud_firestore.dart';

class Vendeur_service {
  getVendeur() {
    return FirebaseFirestore.instance.collection("utilisateur").snapshots();
  }

  getProduitVendeur(V_id) {
    return FirebaseFirestore.instance
        .collection("utilisateur")
        .doc(V_id)
        .collection("produit")
        .snapshots();
  }
}
