import 'package:flutter/material.dart';
import 'package:my_app/apps/routes/routes_name.dart';
import 'package:my_app/pages/category/widget/category_body.dart';
import 'package:my_app/pages/home/home.dart';
import 'package:my_app/provider/category_provider.dart';
import 'package:my_app/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo app',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
        onGenerateRoute: RouteCustom.onGenerateRoute,
      ),
    );
  }
}
