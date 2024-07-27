import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Color backGroundColor;
  final Function() onTap;
  final String text;

  const AddButton({
    super.key,
    required this.backGroundColor,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 350.0,
      child: ElevatedButton(
        onPressed: onTap,
        style: TextButton.styleFrom(backgroundColor: backGroundColor),
        child: Text(text),
      ),
    );
  }
}
