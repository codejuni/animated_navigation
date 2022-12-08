import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:flutter/material.dart';

class AnimatedTabBarNavigationPage extends StatefulWidget {
  const AnimatedTabBarNavigationPage({Key? key}) : super(key: key);

  @override
  State<AnimatedTabBarNavigationPage> createState() =>
      _AnimatedTabBarNavigationPageState();
}

class _AnimatedTabBarNavigationPageState
    extends State<AnimatedTabBarNavigationPage>
    with SingleTickerProviderStateMixin {
  int page = 0;
  Duration duration = const Duration(seconds: 10);

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: NavigationModel.list.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        page = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    return DefaultTabController(
      length: NavigationModel.list.length,
      animationDuration: duration,
      initialIndex: page,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(navigationModel.title),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: List.generate(
            NavigationModel.list.length,
            (index) => NavigationModel.list[index].widget,
          ),
        ),
        bottomNavigationBar: Card(
          margin: const EdgeInsets.all(15),
          shadowColor: Colors.black26,
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  page = index;
                });
              },
              controller: tabController,
              indicatorColor: Colors.transparent,
              splashBorderRadius: BorderRadius.circular(25),
              labelColor: Colors.amber,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber[300],
              ),
              tabs: List.generate(NavigationModel.list.length, (index) {
                bool selectedPage = index == page;
                NavigationModel model = NavigationModel.list[index];
                return Tab(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          model.icon!,
                          height: 22,
                          color: selectedPage ? Colors.black : Colors.grey,
                        )));
              }),
            ),
          ),
        ),
      ),
    );
  }
}
