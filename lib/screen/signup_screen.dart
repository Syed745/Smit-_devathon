// import 'package:chat_app/component/myButton.dart';
// import 'package:chat_app/component/textField.dart';
// import 'package:chat_app/screen/auth/authServices.dart';
import 'package:chat_app/auth/authServices.dart';
import 'package:chat_app/componend/myButton.dart';
import 'package:chat_app/componend/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  final void Function()? ontap;
  const SignUpScreen({super.key, required this.ontap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirPasswordController = TextEditingController();

//
  void signUp() async {
    if (passwordController.text != confirPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password do not match'),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                'assets/images/person.png',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Register",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Email'),
              ),
              MyTextField(
                controller: emailController,
                textHint: "Email",
                abscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Password'),
              ),
              MyTextField(
                controller: passwordController,
                textHint: "Password",
                abscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Confirm Password'),
              ),
              MyTextField(
                controller: confirPasswordController,
                textHint: "Confirm Password",
                abscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: MyButton(
                  ontap: signUp,
                  text: 'Sign Up',
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
