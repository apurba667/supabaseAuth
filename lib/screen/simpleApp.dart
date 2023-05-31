import 'package:flutter/material.dart';
import 'package:supabseauth/utils/constant.dart';

class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Simple App"),),
    
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Welcome to This App")),
        ElevatedButton(onPressed: (){
          clint.auth.signOut();
          Navigator.pushReplacementNamed(context, "/");
        }, child: Text("Log out"))
      ],
    ),
    );
  }
}