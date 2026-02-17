import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie/common/helper/navigation/app_navigation.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 20),
            _passwordField(),
            SizedBox(height: 60),
            _signInButton(),
            SizedBox(height: 20),
            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign In",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(decoration: InputDecoration(hintText: "Email"));
  }

  Widget _passwordField() {
    return TextField(decoration: InputDecoration(hintText: "Password"));
  }

  Widget _signInButton() {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Don't you have account? "),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigatior.push(context, SignUpPage());
              },
          ),
        ],
      ),
    );
  }
}
