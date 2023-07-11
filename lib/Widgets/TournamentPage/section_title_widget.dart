import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;

  const SectionTitleWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: CustomTextStyles.text20Bold,
    );
  }
}