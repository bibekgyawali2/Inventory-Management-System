import 'package:flutter/material.dart';
import 'package:inventory/routes/routes.dart';
import 'package:inventory/themes/theme_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextThemes.textTheme(),
      ),
      initialRoute: Routes.signIn,
      routes: Routes.routes,
    );
  }
}
