import 'package:flutter/material.dart';

class ListSectionWidget extends StatelessWidget {
  final String title;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  ListSectionWidget({
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Column(
          children: List.generate(itemCount, (index) => itemBuilder(context, index)),
        ),
      ],
    );
  }
}
