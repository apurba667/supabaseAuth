
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabseauth/utils/constant.dart';
import 'package:flutter/material.dart';
import '../widgets/customTextField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passWordController = TextEditingController();

    Future<String?> createUser(
        {required final String email, required final String password}) async {
      final AuthResponse response = await clint.auth.signUp(password: password,email: email);
     final User? user = response.user;
     return user!.id;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
                  final userValue = await createUser(
                      email: _emailController.text,
                      password: _passWordController.text);
                      if(userValue != null){
                        Navigator.pushNamed(context, "/signin");
                        context.showErrorMessage("Send an OTP to your email");
                      }
                  setState(() {
                    isLoading = false;
                  });
                },
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
