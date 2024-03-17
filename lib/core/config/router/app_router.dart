import 'package:flutter/material.dart';
import 'package:product_list/core/exception/router_exception.dart';
import 'package:product_list/presentation/home/view/home_view.dart';
import 'package:product_list/presentation/products/view/products_view.dart';

class AppRouter {
  //main menu
  static const String home = '/';
  //products
  static const String products = '/products';
  //other

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case products:
        return MaterialPageRoute(builder: (_) => const ProductView());
      default:
        throw RouterException(overrideMessage: 'Route not found!');
    }
  }
}
