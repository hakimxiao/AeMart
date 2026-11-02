import 'package:aemart/common/helper/navigator/app_navigator.dart';
import 'package:aemart/common/widgets/appbar/app_bar.dart';
import 'package:aemart/common/widgets/button/basic_app_button.dart';
import 'package:aemart/presentation/auth/pages/enter_password.dart';
import 'package:aemart/presentation/auth/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signUpText(context),
            const SizedBox(height: 20),
            _firstNameField(context),
            const SizedBox(height: 20),
            _lastNameField(context),
            const SizedBox(height: 20),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 20),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text(
      'Create Account',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Fill your first name'),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Fill your last name'),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: 'Enter email'));
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Enter your password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordPage());
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Do you have an account? '),
          TextSpan(
            text: 'Sign In',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SignInPage());
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
