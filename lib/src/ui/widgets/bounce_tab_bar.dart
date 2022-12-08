import 'package:animated_navigations/src/domain/models/navigation_model.dart';
import 'package:flutter/material.dart';

class BounceTabBar extends StatefulWidget {
  final List<NavigationModel> items;
  late int currentIndex;
  late ValueChanged<int> onChange;
  late Color backgroundColor;
  final double movement;
  final double height;

  BounceTabBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onChange,
    this.backgroundColor = Colors.amber,
    this.movement = 100,
    this.height = kBottomNavigationBarHeight,
  });

  @override
  State<BounceTabBar> createState() => _BounceTabBarState();
}

class _BounceTabBarState extends State<BounceTabBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animationTabBarIn;
  late Animation _animationTabBarOut;
  late Animation _animationCircleItem;
  late Animation _animationElevationIn;
  late Animation _animationElevationOut;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    _animationTabBarIn =
        CurveTween(curve: const Interval(0.1, 0.6, curve: Curves.decelerate))
            .animate(_controller);

    _animationTabBarOut =
        CurveTween(curve: const Interval(0.6, 1.0, curve: Curves.bounceOut))
            .animate(_controller);

    _animationCircleItem =
        CurveTween(curve: const Interval(0.0, 0.5)).animate(_controller);

    _animationElevationIn =
        CurveTween(curve: const Interval(0.3, 0.5, curve: Curves.decelerate))
            .animate(_controller);

    _animationElevationOut =
        CurveTween(curve: const Interval(0.55, 1.0, curve: Curves.bounceOut))
            .animate(_controller);

    _controller.forward(from: 1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double currentWidth = width;
    double currentElevation = 0;
    return SizedBox(
      height: widget.height,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            currentWidth = width -
                (widget.movement * _animationTabBarIn.value) +
                (widget.movement * _animationTabBarOut.value);

            currentElevation = -widget.movement * _animationElevationIn.value +
                (widget.movement - widget.height / 4) *
                    _animationElevationOut.value;
            return Center(
                child: Container(
              width: currentWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                color: Colors.amber[300],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(widget.items.length, (index) {
                    NavigationModel model = widget.items[index];
                    return widget.currentIndex == index
                        ? Expanded(
                            child: CustomPaint(
                              foregroundPainter: _circleItemPainter(
                                  progress: _animationCircleItem.value),
                              child: Transform.translate(
                                offset: Offset(0.0, currentElevation),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.amber[300],
                                  child: Image.asset(
                                    model.icon!,
                                    color: Colors.black,
                                    height: 25,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: IconButton(
                              onPressed: () {
                                widget.onChange(index);
                                _controller.forward(from: 0.0);
                              },
                              icon: Image.asset(
                                model.icon!,
                                color: Colors.black,
                                height: 22,
                              ),
                            ),
                          );
                  }),
                ),
              ),
            ));
          }),
    );
  }
}

class _circleItemPainter extends CustomPainter {
  final double progress;
  _circleItemPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    double radius = 20 * progress;
    double strokeWidth = 10;
    double currentStrokeWidth = strokeWidth * (1 - progress);
    if (progress < 1) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = currentStrokeWidth,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
