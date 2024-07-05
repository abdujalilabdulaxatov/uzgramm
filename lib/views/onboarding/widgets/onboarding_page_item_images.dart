import 'package:flutter/material.dart';

class OnboardingPageItemImages extends ChangeNotifier {
  List<SizedBox> lst = [
    const SizedBox(
      width: 180,
      height: 200,
      child: Image(image: AssetImage("assets/images/telegram_logo.svg.png")),
    ),
    const SizedBox(
      width: 180,
      height: 200,
      child: Image(
        image: AssetImage("assets/images/fast.png"),
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(
      width: 180,
      height: 200,
      child: Image(
        image: AssetImage("assets/images/free.png"),
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(
      width: 180,
      height: 200,
      child: Image(
        image: AssetImage("assets/images/powerfull.png"),
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(
      width: 180,
      height: 200,
      child: Image(
        image: AssetImage("assets/images/security.png"),
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(
      width: 200,
      height: 200,
      child: Image(
        image: AssetImage("assets/images/cloud.png"),
      ),
    ),
  ];
}
