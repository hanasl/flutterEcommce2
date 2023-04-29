import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce/screen/homescreen.dart';
import 'package:e_commerce/screen/registre_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constance.dart';
import 'MainScreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistreScreen(),
                              maintainState: false));
                    },
                  ),
                ],
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
              SizedBox(height: 10,),
              Text("Forget Password?"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.grey.shade50,
                ),
                child: MaterialButton(
                  color: primaryColor,
                  onPressed: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    //EasyLoading.showToast('Loading...');
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!.trim(), password: password!.trim());
                      //  CircularProgressIndicator();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => mainScreen(),
                              maintainState: false));
                      // EasyLoading.showInfo(ex);
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
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign In "),
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
