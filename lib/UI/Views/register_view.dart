import 'package:chatapp/UI/Widgets/app_button.dart';
import 'package:chatapp/UI/Widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: theme.primaryColor,
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset('assets/images/logo.png'),
                ),
                AppTextFormField(
                  controller: emailController,
                  hint: 'Email',
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextFormField(
                  controller: passwordController,
                  isPassword: true,
                  hint: 'Password',
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  label: 'Register',
                  color: Colors.white,
                  bgColor: theme.primaryColor,
                  onPressed: () => _auth.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text),
                )
              ],
            ),
          )),
    );
  }
}
