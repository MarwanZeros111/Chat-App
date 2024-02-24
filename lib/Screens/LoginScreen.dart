import 'package:chat_app/Screens/SignUP.dart';
import 'package:chat_app/Screens/chat_Screen.dart';
import 'package:chat_app/widget/Text_field.dart';
import 'package:chat_app/widget/bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Form(
          key: formkey,
          child: ListView(children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              'lib/assest/images/scholar.png',
              height: 100,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scholar chat',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            TextFieldd(
              text: 'Email',
              onChanged: (data) {
                email = data;
              },
            ),
            TextFieldd(
              obscure: true,
              text: 'Passwords',
              onChanged: (data) {
                password = data;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Bottom(
                text: 'Login',
                ontab: () async {
                  if (formkey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!, password: password!);
                      Navigator.pushNamed(context, ChatScreen.id,
                          arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('No user found for that email.')));
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Wrong password provided for that user.')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Erorr,try it.')));
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  }
                }),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'dont have an acount?',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegesterScreen.id);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
