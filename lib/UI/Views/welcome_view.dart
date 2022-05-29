import 'package:chatapp/Core/utils/helpers.dart';
import 'package:chatapp/UI/Views/register_view.dart';
import 'package:chatapp/UI/Views/signin_view.dart';
import 'package:chatapp/UI/Widgets/app_button.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Image.asset('assets/images/logo.png'),
          ),
          AppButton(
            label: 'Sign In',
            color: Colors.white,
            bgColor: const Color(0xff854ff5),
            onPressed: () => push(context: context, page: SignInView()),
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            label: 'Register',
            color: const Color(0xff854ff5),
            bgColor: Colors.white,
            onPressed: () => push(context: context, page: RegisterView()),
          ),
        ],
      ),
    );
  }
}
