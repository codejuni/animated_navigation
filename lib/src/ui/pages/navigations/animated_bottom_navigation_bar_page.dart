import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:animated_navigations/src/ui/widgets/animated_bottom_navigation.dart';
import 'package:flutter/material.dart';

class AnimatedBottomNavigationBarPage extends StatefulWidget {
  const AnimatedBottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<AnimatedBottomNavigationBarPage> createState() =>
      _AnimatedBottomNavigationBarPageState();
}

class _AnimatedBottomNavigationBarPageState
    extends State<AnimatedBottomNavigationBarPage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(navigationModel.title)),
      body: NavigationModel.list[page].widget,
      bottomNavigationBar: AnimatedBottomNavigation(
        currentIndex: page,
        onChange: (value) {
          setState(() {
            page = value;
          });
        },
        items: NavigationModel.list, //required icon, required title
      ),
    );
  }
}
