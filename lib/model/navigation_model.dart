import 'package:flutter/material.dart';
import 'package:tourly/commons/sidebarComponents/currency_convertor.dart';
import 'package:tourly/commons/sidebarComponents/translator.dart';
import 'package:tourly/commons/sidebarComponents/weather_screen/weather_screen.dart';

class NavigationModel {
  String title;
  IconData icon;
  final Widget? targetWidget; // Target widget to navigate to

  NavigationModel({
    required this.title,
    required this.icon,
    this.targetWidget,
  });
}

List<NavigationModel> navigatioItems = [
  NavigationModel(title: "Compass", icon: Icons.compass_calibration_outlined),
  NavigationModel(
      title: "Translator", icon: Icons.translate, targetWidget: Translator()),
  NavigationModel(title: "Weather", icon: Icons.sunny,targetWidget:WeatherScreen()),
  NavigationModel(title: "Currency Convertor", icon: Icons.currency_exchange,targetWidget: CurrencyConverterApp()),
  NavigationModel(title: "Map", icon: Icons.map),
];
