
import '../screens/result_screen.dart';
import 'package:flutter/material.dart';
import '../models/BMI_arguments.dart';
import 'models/BMI_arguments.dart';
import 'screens/home_screen.dart';

class RouteGenerator {
  static const String firstPage =  MyHomePage.id;
  static const String secondPage = ResultsPage.id;

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstPage:
        return MaterialPageRoute(
          builder: (_) =>  MyHomePage(),
        );
      case secondPage:
        var myArgument = settings.arguments as BMIArguments;
        return MaterialPageRoute(
          builder: (_) =>  ResultsPage(),
        );
      default:
        throw FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
