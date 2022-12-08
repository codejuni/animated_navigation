import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:flutter/material.dart';

class TabBarNavigationPage extends StatefulWidget {
  const TabBarNavigationPage({Key? key}) : super(key: key);

  @override
  State<TabBarNavigationPage> createState() => _TabBarNavigationPageState();
}

class _TabBarNavigationPageState extends State<TabBarNavigationPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    return DefaultTabController(
      length: NavigationModel.list.length,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(navigationModel.title),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: TabBar(
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              tabs: List.generate(NavigationModel.list.length, (index) {
                return Tab(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    NavigationModel.list[index].title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ));
              }),
            ),
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            NavigationModel.list.length,
            (index) => NavigationModel.list[index].widget,
          ),
        ),
      ),
    );
  }
}
