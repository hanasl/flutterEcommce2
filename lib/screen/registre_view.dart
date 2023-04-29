import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constance.dart';
import 'MainScreen.dart';
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
                  decoration: InputDecoration(
                    hintText: 'Name',
                    // ),
                    labelText: '  Enter Name',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: '  Enter your number',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    numero = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'address@mail.com',
                    labelText: '  addresse e-mail',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10),
                  onPressed: () {},
                  // color: primaryColor,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '*******',
                      labelText: '  Mot de passe',
                    ),
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    maxLength: 8,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
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
                        final User? _userr = FirebaseAuth.instance.currentUser;
                        final _uid = _userr!.uid;
                        await FirebaseFirestore.instance
                            .collection("utilisateur")
                            .doc(_uid)
                            .set({
                          "Email": email,
                          "Password": password,
                          "Name": name,
                          "Number": numero,
                          "id": _uid
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => mainScreen(),
                        //         maintainState: false));
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
