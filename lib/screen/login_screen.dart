// import 'package:chat_app/component/myButton.dart';
// import 'package:chat_app/component/textField.dart';
// import 'package:chat_app/screen/auth/authServices.dart';
import 'package:chat_app/auth/authServices.dart';
import 'package:chat_app/componend/myButton.dart';
import 'package:chat_app/componend/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? ontap;
  const LoginScreen({super.key, required this.ontap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//
  void login() async {
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
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
                height: 50,
              ),
              Image.asset(
                'assets/images/person.png',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
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
              const Align(
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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: const Text(
                      "Register",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: MyButton(
                  ontap: login,
                  text: 'LOGIN',
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
