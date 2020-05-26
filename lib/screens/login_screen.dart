import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/widgets/button.dart';
import 'package:flash_chat/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool isSaving = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isSaving,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: KCustomTextDecoration.copyWith(hintText: "Enyer your Email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: KCustomTextDecoration.copyWith(hintText: "Enter you password"),
              ),
              SizedBox(
                height: 24.0,
              ),

              Button(buttonOnPressed: () async {
                setState(() {
                  isSaving = true;
                });
                try{
                  final checkUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if (checkUser != null) {
                    print("success");
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    isSaving = false;
                  });
                } catch(e) {
                  print(e);
                }

              }, color: Colors.lightBlueAccent, buttonText: 'Log In',)
            ],
          ),
        ),
      ),
    );
  }
}
