import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:animated_navigations/src/ui/widgets/bounce_tab_bar.dart';
import 'package:flutter/material.dart';

class BounceTabBarNavigationPage extends StatefulWidget {
  const BounceTabBarNavigationPage({Key? key}) : super(key: key);

  @override
  State<BounceTabBarNavigationPage> createState() =>
      _BounceTabBarNavigationPageState();
}

class _BounceTabBarNavigationPageState extends State<BounceTabBarNavigationPage>
    with SingleTickerProviderStateMixin {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(navigationModel.title),
      ),
      body: NavigationModel.list[page].widget,
      bottomNavigationBar: BounceTabBar(
        items: NavigationModel.list,
        currentIndex: page,
        onChange: (int value) {
          setState(() {
            page = value;
          });
        },
      ),
    );
  }
}
