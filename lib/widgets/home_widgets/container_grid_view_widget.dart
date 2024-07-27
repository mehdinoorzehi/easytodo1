import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContainerGridViewWidget extends StatelessWidget {
  final Function() onTap;
  final String animationAddress;
  final String title;
  final String subtitle;

  const ContainerGridViewWidget({
    super.key,
    required this.onTap,
    required this.animationAddress,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45.0,
              width: 45.0,
              margin: const EdgeInsets.only(left: 8.0, top: 17.0),
              child: Lottie.asset(
                animationAddress,
                // repeat: false
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25.0, left: 15.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 23.0, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 15.0, top: 10.0),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
