import 'package:animated_navigations/src/ui/pages/pages/page_a.dart';
import 'package:animated_navigations/src/ui/pages/pages/page_b.dart';
import 'package:animated_navigations/src/ui/pages/pages/page_c.dart';
import 'package:animated_navigations/src/ui/pages/pages/page_d.dart';
import 'package:animated_navigations/src/ui/pages/pages/page_e.dart';
import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  String? icon;
  Widget widget;

  NavigationModel({
    required this.title,
    this.icon,
    required this.widget,
  });

  static List<NavigationModel> list = <NavigationModel>[
    NavigationModel(
      title: 'Home',
      icon: 'assets/home.png',
      widget: const PageA(),
    ),
    NavigationModel(
      title: 'My Orders',
      icon: 'assets/orders.png',
      widget: const PageB(),
    ),
    NavigationModel(
      title: 'Search',
      icon: 'assets/search.png',
      widget: const PageC(),
    ),
    NavigationModel(
      title: 'Favorites',
      icon: 'assets/favorite.png',
      widget: const PageD(),
    ),
    NavigationModel(
      title: 'Profile',
      icon: 'assets/user.png',
      widget: const PageE(),
    ),
  ];
}
