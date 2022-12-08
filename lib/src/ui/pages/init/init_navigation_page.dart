import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:animated_navigations/src/ui/pages/navigations/animated_bottom_navigation_bar_page.dart';
import 'package:animated_navigations/src/ui/pages/navigations/animated_tab_bar_navigation_page.dart';
import 'package:animated_navigations/src/ui/pages/navigations/bottom_navigation_bar_page.dart';
import 'package:animated_navigations/src/ui/pages/navigations/bounce_tab_bar_navigation_page.dart';
import 'package:animated_navigations/src/ui/pages/navigations/drawer_navigation_page.dart';
import 'package:animated_navigations/src/ui/pages/navigations/hidden_drawer_navigation_page.dart';
import 'package:animated_navigations/src/ui/pages/navigations/pageview_navigation_page.dart';
import 'package:animated_navigations/src/ui/pages/navigations/tab_bar_navigation_page.dart';
import 'package:flutter/material.dart';

class InitNavigationPage extends StatelessWidget {
  InitNavigationPage({Key? key}) : super(key: key);

  final navigations = <NavigationModel>[
    NavigationModel(
      title: 'Bottom Navigation Bar',
      widget: const BottomNavigationBarPage(),
    ),
    NavigationModel(
      title: 'Animated Bottom Navigation Bar',
      widget: const AnimatedBottomNavigationBarPage(),
    ),
    NavigationModel(
      title: 'PageView Navigation',
      widget: const PageViewNavigationPage(),
    ),
    NavigationModel(
      title: 'Tab Bar',
      widget: const TabBarNavigationPage(),
    ),
    NavigationModel(
      title: 'Animated Tab Bar',
      widget: const AnimatedTabBarNavigationPage(),
    ),
    NavigationModel(
      title: 'Drawer Navigation',
      widget: const DrawerNavigationPage(),
    ),
    NavigationModel(
      title: 'Hidden Drawer Navigation',
      widget: const HiddenDrawerNavigationPage(),
    ),
    NavigationModel(
      title: 'Bounce Tab Bar',
      widget: const BounceTabBarNavigationPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Navigations'),
      ),
      body: ListView.separated(
        itemCount: navigations.length,
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber[300]),
                  shadowColor: const MaterialStatePropertyAll(Colors.black26),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              child: Text(
                navigations[index].title,
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: RouteSettings(arguments: navigations[index]),
                      builder: (context) => navigations[index].widget,
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
