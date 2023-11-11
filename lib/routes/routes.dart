import 'package:flutter/material.dart';
import 'package:inventory/presentation/add_product/add_product.dart';
import 'package:inventory/presentation/auth/sign_in/sign_in.dart';
import 'package:inventory/presentation/home_page/homepage.dart';
import 'package:inventory/presentation/remove_item/remove_item.dart';

class Routes {
  static const String homePage = '/homepage_page';
  static const String addProduct = '/add_items';
  static const String removeItem = '/remove_item';
  static const String signIn = '/sign_in';

  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => const HomePage(),
    addProduct: (context) => const AddProducts(),
    removeItem: (context) => const RemoveItems(),
    signIn: (context) => const SignIn(),
  };
}
