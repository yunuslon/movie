import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie/common/helper/navigation/app_navigation.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/data/auth/repositories/auth.dart';
import 'package:movie/data/auth/source/auth_api_service.dart';
import 'package:movie/domain/auth/usecases/signup.dart';
import 'package:movie/presentation/auth/pages/signin.dart';
import 'package:reactive_button/reactive_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

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
            _signInButton(),
            SizedBox(height: 20),
            _signInText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign Up",
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

  Widget _signInButton() {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {
        await SignupUseCase(
          authRepository: AuthRepositoryImpl(
            authApiService: AuthApiServiceImpl(),
          ),
        ).call(
          params: SignupReqParams(
            email: _emailCont.text,
            password: _passwordCont.text,
          ),
        );
      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Do you have account? "),
          TextSpan(
            text: "Sign In",
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigatior.push(context, const SignInPage());
              },
          ),
        ],
      ),
    );
  }
}
