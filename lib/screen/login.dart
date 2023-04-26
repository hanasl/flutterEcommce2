import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce/screen/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      body: Padding(
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
                    // Get.to(RegisterView());
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
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
            Text("Forget Password?"),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10),
              onPressed: () {
                // Get.to(HomeView());
                /* _formKey.currentState?.save();
                if (_formKey.currentState!.validate()) {
                  controller.signInWithEmailAndPassword();
                }*/
              },
              // color: primaryColor,
              child: TextField(
                decoration: InputDecoration(
                  // hintStyle: GoogleFonts.raleway(),
                  // labelStyle: GoogleFonts.raleway(),
                  // counterStyle: GoogleFonts.raleway(),
                  hintText: '*******',
                  // border:
                  //     OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                  labelText: '  Mot de passe',
                  // counterText:
                  //     '*Please use a verified e-mail',
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
              height: 30,
            ),
            // Text("-OR-"),
            // SizedBox(
            //   height: 40,
            // ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.grey.shade50,
              ),
              child: MaterialButton(
                color: Colors.green,
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
                            builder: (context) => homescreen(),
                            maintainState: false));
                    // EasyLoading.showInfo(ex);
                  } on FirebaseAuthException catch (ex) {
                    if (ex.code == 'user-not-found') {
                      print("not found");
                      AnimatedSnackBar.material(
                        "pas d'utilisateur avec cet e-mail",
                        type: AnimatedSnackBarType.error,
                        duration: Duration(seconds: 4),
                        mobileSnackBarPosition: MobileSnackBarPosition
                            .bottom, // Position of snackbar on mobile devices
                      ).show(context);
                    } else if (ex.code == 'wrong-password') {
                      AnimatedSnackBar.material(
                        'mot de passe incorrect',
                        type: AnimatedSnackBarType.error,
                        duration: Duration(seconds: 6),
                        mobileSnackBarPosition: MobileSnackBarPosition
                            .bottom, // Position of snackbar on mobile devices
                        // Position of snackbar on desktop devices
                      ).show(context);
                    } else if (ex.code == 'invalid-email') {
                      AnimatedSnackBar.material(
                        'addresse-email est invalide',
                        type: AnimatedSnackBarType.error,
                        duration: Duration(seconds: 4),
                        mobileSnackBarPosition: MobileSnackBarPosition
                            .bottom, // Position of snackbar on mobile devices
                        // Position of snackbar on desktop devices
                      ).show(context);
                    }
                  }
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // FlutterLogo(),
                  // SizedBox(
                  //   width: 100,
                  // ),
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
    ));
  }
}
