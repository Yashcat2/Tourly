import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigatioItems = [
  NavigationModel(title: "Compass", icon: Icons.compass_calibration_outlined),
  NavigationModel(title: "Translator", icon: Icons.translate),
  NavigationModel(title: "Weather", icon: Icons.sunny),
  NavigationModel(title: "Currency Convertor", icon: Icons.currency_exchange),
  NavigationModel(title: "Map", icon: Icons.map),
];
