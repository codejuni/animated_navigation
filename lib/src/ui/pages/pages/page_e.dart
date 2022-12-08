import 'package:flutter/material.dart';

class PageE extends StatelessWidget {
  const PageE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.yellow,
      alignment: Alignment.center,
      child: const Text(
        'E',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
