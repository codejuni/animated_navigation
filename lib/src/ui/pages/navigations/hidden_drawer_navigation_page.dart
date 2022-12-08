import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:flutter/material.dart';

class HiddenDrawerNavigationPage extends StatefulWidget {
  const HiddenDrawerNavigationPage({Key? key}) : super(key: key);

  @override
  State<HiddenDrawerNavigationPage> createState() =>
      _HiddenDrawerNavigationPageState();
}

class _HiddenDrawerNavigationPageState
    extends State<HiddenDrawerNavigationPage> {
  int page = 0;
  Duration duration = const Duration(seconds: 1);

  bool openDrawer = false;
  double drawerWidth = 200;

  @override
  Widget build(BuildContext context) {
    NavigationModel navigationModel =
        ModalRoute.of(context)!.settings.arguments as NavigationModel;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
                width: drawerWidth,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  itemCount: NavigationModel.list.length,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
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
                          fontWeight:
                              selectPage ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      tileColor:
                          selectPage ? Colors.amber[300] : Colors.transparent,
                      onTap: () {
                        setState(() {
                          page = index;
                          openDrawer = !openDrawer;
                        });
                      },
                    );
                  },
                )),
          ),
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(openDrawer ? drawerWidth : 0,
                openDrawer ? size.width * 0.5 : 0, 0)
              ..scale(openDrawer ? 0.5 : 1.0),
            child: Card(
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.black38,
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(openDrawer ? 25 : 0)),
              child: Column(
                children: [
                  AppBar(
                      leading: IconButton(
                          onPressed: () {
                            setState(() {
                              openDrawer = !openDrawer;
                            });
                          },
                          icon: const Icon(Icons.menu, color: Colors.black)),
                      title: Text(navigationModel.title)),
                  Expanded(child: NavigationModel.list[page].widget)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
