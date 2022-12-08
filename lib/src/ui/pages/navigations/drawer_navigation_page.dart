import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:flutter/material.dart';

class DrawerNavigationPage extends StatefulWidget {
  const DrawerNavigationPage({Key? key}) : super(key: key);

  @override
  State<DrawerNavigationPage> createState() => _DrawerNavigationPageState();
}

class _DrawerNavigationPageState extends State<DrawerNavigationPage> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    return Scaffold(
      key: globalKey,
      drawer: Drawer(
        child: SafeArea(
            child: ListView.separated(
          itemCount: NavigationModel.list.length,
          padding: const EdgeInsets.symmetric(vertical: 10),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            NavigationModel model = NavigationModel.list[index];
            bool selectPage = index == page;
            return ListTile(
              leading: Image.asset(
                model.icon!,
                height: selectPage ? 22 : 20,
                color: selectPage ? Colors.black : Colors.grey,
              ),
              title: Text(
                model.title,
                style: TextStyle(
                  color: selectPage ? Colors.black : Colors.grey,
                  fontSize: selectPage ? 16 : 15,
                  fontWeight: selectPage ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              tileColor: selectPage ? Colors.amber[300] : Colors.transparent,
              onTap: () {
                setState(() {
                  page = index;
                });
                Navigator.pop(context);
              },
            );
          },
        )),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              globalKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.black)),
        title: Text(navigationModel.title),
      ),
      body: NavigationModel.list[page].widget,
    );
  }
}
