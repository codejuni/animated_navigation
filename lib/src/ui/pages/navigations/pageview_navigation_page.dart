import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:animated_navigations/src/ui/widgets/animated_bottom_navigation.dart';
import 'package:flutter/material.dart';

class PageViewNavigationPage extends StatefulWidget {
  const PageViewNavigationPage({Key? key}) : super(key: key);

  @override
  State<PageViewNavigationPage> createState() => _PageViewNavigationPageState();
}

class _PageViewNavigationPageState extends State<PageViewNavigationPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 1200);
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
      body: PageView.builder(
        itemCount: NavigationModel.list.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemBuilder: (context, index) {
          NavigationModel model = NavigationModel.list[index];
          return model.widget;
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigation(
        currentIndex: page,
        items: NavigationModel.list,
        onChange: (value) {
          setState(() {
            page = value;
          });
          pageController.animateToPage(page,
              duration: duration, curve: Curves.decelerate);
        },
      ),
      /* bottomNavigationBar: Card(
        shadowColor: Colors.black26,
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 8,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              NavigationModel.list.length,
              (index) => AnimatedContainer(
                duration: duration,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: page == index ? Colors.amber[300] : Colors.transparent,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: page == index ? 15 : 10,
                  vertical: 10,
                ),
                child: page == index
                    ? Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              NavigationModel.list[index].icon!,
                              height: 22,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              NavigationModel.list[index].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: page == index ? 15 : 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              page = index;
                            });
                            pageController.animateToPage(page,
                                duration: duration, curve: Curves.decelerate);
                          },
                          child: Image.asset(
                            NavigationModel.list[index].icon!,
                            height: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ), */
    );
  }
}
