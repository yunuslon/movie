
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie/common/helper/message/display_message.dart';
import 'package:movie/common/helper/navigation/app_navigation.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/data/auth/models/signin_req_params.dart';
import 'package:movie/domain/auth/usecases/signin.dart';
import 'package:movie/presentation/auth/pages/signup.dart';
import 'package:movie/presentation/home/pages/home.dart';
import 'package:movie/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

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
            _signInButton(context),
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
    return TextField(
      controller: _emailCont,
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCont,
      obscureText: true,
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {
        return await sl<SigninUseCase>().call(
          params: SigninReqParams(
            email: _emailCont.text,
            password: _passwordCont.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
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
                AppNavigator.push(context, SignUpPage());
              },
          ),
        ],
      ),
    );
  }
}
