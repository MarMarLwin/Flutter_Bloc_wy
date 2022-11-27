import 'package:flutter/material.dart';
import 'package:flutter_bloc_articles/screens/article_list_screen.dart';
import 'package:flutter_bloc_articles/screens/estate_list.dart';
import 'package:flutter_bloc_articles/utils/dimensions.dart';
import 'package:flutter_bloc_articles/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const EstateListScreen(), //const CovidScreen()
      routes: RouteHelper.routes,
    );
  }
}
