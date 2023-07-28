import 'package:flutter/material.dart';
import 'package:pro_angler/Models/Onboarding%20Pages/onboarding_model.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  OnboardingPageWidget({required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(page.imageUrl, height: 200),
          const SizedBox(height: 40),
          Text(
            page.title,
            style: CustomTextStyles.text20Bold,
          ),
          const SizedBox(height: 20),
          Text(
            page.description,
            style: CustomTextStyles.texto14Normal,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
