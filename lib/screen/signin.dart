import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabseauth/utils/constant.dart';

import '../widgets/customTextField.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({super.key});

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passWordController = TextEditingController();
    
    bool isLoading = false;
    Future<String?> userLogin(
        {required final String email, required final String password}) async {
      final AuthResponse response =
          await clint.auth.signInWithPassword(password: password,email: email);
      final Session? session = response.session;
     final User? user = response.user;
      return user?.id;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                controller: _emailController,
                hintText: "Enter Your Email",
                isObsecure: false),
            CustomTextField(
                controller: _passWordController,
                hintText: "Enter Your Password",
                isObsecure: true),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  dynamic loadingValue = await userLogin(
                      email: _emailController.text,
                      password: _passWordController.text);
                      setState(() {
                        isLoading = false;
                      });

                      if(loadingValue != null){
                        Navigator.pushReplacementNamed(context, "/simpleapp");
                      }
                      else{
                        context.showErrorMessage("Envalid Email or Password");
                      }
                },
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : Text("Log in"))
          ],
        ),
      ),
    );
  }
}
