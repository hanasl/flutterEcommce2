import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constance.dart';
import 'Profil.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
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
                      builder: (context) => ProfilScreen(),
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
                  onPressed: () async {},
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
