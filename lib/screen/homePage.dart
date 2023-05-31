import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home Page")),
    
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Center(child: Icon(Icons.home,size: 100,)),
      ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, "/signin");
      }, child: Text("Sign in")),
      ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, "/signup");
      }, child: Text("Sign Up"))
    ],),
    );
  }
}