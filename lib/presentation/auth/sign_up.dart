import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory/controller/auth_controller.dart';
import 'package:inventory/utils/constants.dart';
import 'package:inventory/widgets/custom_button.dart';

import '../../../widgets/label_text.dart';
import '../../routes/routes.dart';
import '../home_page/homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                const SizedBox(height: defaultPadding),
                LabelText(
                  controller: name,
                  label: 'Enter Full Name',
                  hintText: 'eg: John Doe',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: defaultPadding),
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
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signIn);
                        },
                        child: const Text('Sign In'))
                  ],
                ),
                const SizedBox(height: defaultPadding),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        title: 'Submit',
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            UserCredential? userCredential =
                                await AuthController().signUpMethod(
                                    emailAddress.text, password.text);
                            // Check if the signup was successful before storing user data
                            if (userCredential != null) {
                              await AuthController().storeUserData(
                                name: name.text,
                                email: emailAddress.text,
                                password: password.text,
                              );
                              Navigator.pushNamed(context, Routes.homePage);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          } catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                            print(e);
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
