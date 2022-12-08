import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  const PageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child: const Text(
        'C',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
