import 'package:flutter/material.dart';

class PageD extends StatelessWidget {
  const PageD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue[200],
      alignment: Alignment.center,
      child: const Text(
        'D',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}