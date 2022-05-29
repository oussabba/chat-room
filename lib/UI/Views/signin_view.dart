import 'package:chatapp/UI/Widgets/app_button.dart';
import 'package:chatapp/UI/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: theme.primaryColor,
      ),
      body: Form(
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
              hint: 'Password',
            ),
            const SizedBox(
              height: 30,
            ),
            AppButton(
              label: 'Sign in',
              color: Colors.white,
              bgColor: theme.primaryColor,
              onPressed: () {},
            )
          ],
        ),
      )),
    );
  }
}
