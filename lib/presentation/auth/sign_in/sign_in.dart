import 'package:flutter/material.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';

import '../../../widgets/label_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In To Your Account'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding * 3),
              Text(
                'Inventory Management System',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: defaultPadding * 3),
              LabelText(
                controller: emailAddress,
                label: 'Enter Email Address',
                hintText: 'eg: abc@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: defaultPadding),
              LabelText(
                controller: password,
                label: 'Enter Password',
                hintText: 'eg: abc@gmail.com',
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: defaultPadding * 2),
              CustomButton(title: 'Submit', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
