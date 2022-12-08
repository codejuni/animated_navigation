import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(navigationModel.title)),
      body: NavigationModel.list[page].widget,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey[900],
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          currentIndex: page,
          backgroundColor: Colors.white,
          items: List.generate(
            NavigationModel.list.length,
            (index) => BottomNavigationBarItem(
              label: index == page ? NavigationModel.list[index].title : '',
              icon: Image.asset(
                NavigationModel.list[index].icon!,
                height: 22,
                color: index == page ? Colors.black : Colors.grey,
              ),
            ),
          )),
    );
  }
}
