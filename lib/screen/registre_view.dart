import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constance.dart';
import 'login.dart';

class RegistreScreen extends StatefulWidget {
  const RegistreScreen({super.key});

  @override
  State<RegistreScreen> createState() => _RegistreScreenState();
}

class _RegistreScreenState extends State<RegistreScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    String? name;
    String? numero;
    User? _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => loginScreen(),
                      maintainState: false));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
                  "Sign Up,",
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
                    // hintStyle: GoogleFonts.raleway(),
                    // labelStyle: GoogleFonts.raleway(),
                    // counterStyle: GoogleFonts.raleway(),
                    hintText: 'Name',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    labelText: '  Enter Name',
                    // counterText:
                    //     '*Please use a verified e-mail',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  //cursorColor: secondaryColor,
                  decoration: InputDecoration(
                    // hintStyle: GoogleFonts.raleway(),
                    // labelStyle: GoogleFonts.raleway(),
                    // counterStyle: GoogleFonts.raleway(),
                    hintText: 'Numero',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    labelText: '  Enter your number',
                    // counterText:
                    //     '*Please use a verified e-mail',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    numero = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  //cursorColor: secondaryColor,
                  decoration: InputDecoration(
                    // hintStyle: GoogleFonts.raleway(),
                    // labelStyle: GoogleFonts.raleway(),
                    // counterStyle: GoogleFonts.raleway(),
                    hintText: 'address@mail.com',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    labelText: '  addresse e-mail',
                    // counterText:
                    //     '*Please use a verified e-mail',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  //cursorColor: secondaryColor,
                  decoration: InputDecoration(
                    hintText: '*******',
                    labelText: '  Password',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homescreen(),
                                maintainState: false));
                        await FirebaseFirestore.instance
                            .collection("utilisateur")
                            .doc(_user!.uid)
                            .set({
                          "Email": email,
                          "Password": password,
                          "Name": name,
                          "Number": numero,
                        });
                        await FirebaseFirestore.instance
                            .collection("utilisateur")
                            .doc(_user!.uid)
                            .collection("Produit")
                            .doc()
                            .set({
                          "Description": " ",
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          var snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'mot de passe faible',
                                  ),
                                ],
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == 'email-already-in-use') {
                          var snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'cette addresse e-mail est déja utilisé',
                                  ),
                                ],
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } catch (ex) {
                        print(ex);
                      }
                    }
                  },
                  color: primaryColor,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(),
                  ),
                ),
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
