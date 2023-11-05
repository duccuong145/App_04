import 'package:flutter/material.dart';
import 'package:my_app/apps/routes/routes.dart';
import 'package:my_app/pages/category/widget/category.dart';
import 'package:my_app/pages/home/home.dart';

class RouteCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutesName.categoryPage:
        return MaterialPageRoute(builder: (_) => const CategoryPage());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
