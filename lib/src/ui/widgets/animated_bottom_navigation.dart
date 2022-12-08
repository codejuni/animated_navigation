import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:flutter/material.dart';

class AnimatedBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onChange;
  final List<NavigationModel> items;
  final Color backgroundColor;
  final Color colorItemSelected;
  final Color colorIndicator;
  final double height;
  const AnimatedBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onChange,
    required this.items,
    this.height = kBottomNavigationBarHeight,
    this.colorIndicator = Colors.amberAccent,
    this.colorItemSelected = Colors.black,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  State<AnimatedBottomNavigation> createState() =>
      _AnimatedBottomNavigationState();
}

class _AnimatedBottomNavigationState extends State<AnimatedBottomNavigation> {
  Duration duration = const Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black26,
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 8,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(NavigationModel.list.length, (index) {
            bool selectedPage = widget.currentIndex == index;
            NavigationModel model = widget.items[index];

            return AnimatedContainer(
              duration: duration,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    selectedPage ? widget.colorIndicator : Colors.transparent,
              ),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: selectedPage ? 15 : 10,
                vertical: 10,
              ),
              child: selectedPage
                  ? Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            model.icon!,
                            height: 22,
                            color: widget.colorItemSelected,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            model.title,
                            style: TextStyle(
                              color: widget.colorItemSelected,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget.onChange(index);
                        },
                        child: Image.asset(
                          model.icon!,
                          height: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            );
          }),
        ),
      ),
    );
  }
}
