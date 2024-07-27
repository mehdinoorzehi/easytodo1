import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Color backGroundColor;
  final Function() onTap;
  const MyFloatingActionButton({
    super.key, required this.backGroundColor, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: 67.0,
        height: 67.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: backGroundColor,
            onPressed:onTap,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
