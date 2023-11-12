import 'package:flutter/material.dart';
import 'package:inventory/presentation/add_product/add_product.dart';
import 'package:inventory/presentation/add_product_item/add_product_item.dart';
import 'package:inventory/presentation/auth/sign_in/sign_in.dart';
import 'package:inventory/presentation/auth/sign_up.dart';
import 'package:inventory/presentation/home_page/homepage.dart';
import 'package:inventory/presentation/remove_item/remove_item.dart';
import 'package:inventory/presentation/view_product/view_products.dart';

class Routes {
  static const String homePage = '/homepage_page';
  static const String addProduct = '/add_items';
  static const String removeItem = '/remove_item';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String viewProducts = '/view_product';
  static const String addItem = '/add_item';

  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => const HomePage(),
    addProduct: (context) => const AddProducts(),
    removeItem: (context) => const RemoveItems(),
    signIn: (context) => const SignIn(),
    signUp: (context) => const SignUp(),
    viewProducts: (context) => const ViewProducts(),
    addItem: (context) => const AddItem(),
  };
}
