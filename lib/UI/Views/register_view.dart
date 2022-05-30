import 'package:chatapp/Core/utils/helpers.dart';
import 'package:chatapp/UI/Views/messages_view.dart';
import 'package:chatapp/UI/Widgets/app_button.dart';
import 'package:chatapp/UI/Widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;

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
                    isLoading: isLoading,
                    onPressed: () async {
                      try {
                        setState(() => isLoading = true);
                        await _auth.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        setState(() => isLoading = false);
                        push(context: context, page: MessagesView());
                      } on FirebaseAuthException catch (e) {
                        setState(() => isLoading = false);
                        showSnackBar(context, e.message.toString(), Colors.red);
                      }
                    })
              ],
            ),
          )),
    );
  }
}
