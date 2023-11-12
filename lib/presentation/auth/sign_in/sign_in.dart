import 'package:flutter/material.dart';
import 'package:inventory/controller/auth_controller.dart';
import 'package:inventory/presentation/auth/sign_up.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';

import '../../../routes/routes.dart';
import '../../../widgets/label_text.dart';
import '../../home_page/homepage.dart';

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
          child: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Dont have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                        child: const Text('Sign Up'))
                  ],
                ),
                const SizedBox(height: defaultPadding),
                CustomButton(
                    title: 'Submit',
                    onPressed: () async {
                      await AuthController()
                          .loginMethod(
                              email: emailAddress.text, password: password.text)
                          .then((value) {
                        if (value != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
