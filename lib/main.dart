import 'package:flutter/material.dart';
import 'package:supabseauth/screen/homePage.dart';
import 'package:supabseauth/screen/signUp.dart';
import 'package:supabseauth/screen/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabseauth/screen/simpleApp.dart';
import 'package:supabseauth/utils/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://gblkmbedfrhcgyqlduwq.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdibGttYmVkZnJoY2d5cWxkdXdxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU1NDg0NDUsImV4cCI6MjAwMTEyNDQ0NX0.eNsU1X5UNXo3o6n9cghowHoShLhw2n2dRbKXqTWq7HA",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    initialRoute: clint.auth.currentSession != null?"/simpleapp":"/",
    routes: {
      "/":(context)=> HomePage(),
      "/signin":(context) => EmailAuth(),
      "/signup":(context) => SignUp(),
      "/simpleapp":(context) => SimpleApp(),
    }
    );
  }
}
