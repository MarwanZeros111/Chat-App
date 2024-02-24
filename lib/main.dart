import 'package:chat_app/Screens/LoginScreen.dart';
import 'package:chat_app/Screens/SignUP.dart';
import 'package:chat_app/Screens/chat_Screen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});
  // sThis widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        RegesterScreen.id: (context) => RegesterScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
      initialRoute: LoginScreen.id,
    );
  }
}
