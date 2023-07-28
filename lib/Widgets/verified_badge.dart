import 'package:flutter/material.dart';

class VerifiedBadge extends StatelessWidget {
  final bool enable;

  VerifiedBadge({Key? key, required this.enable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: enable,
      child: const Padding(
        padding: EdgeInsets.only(right: 4.0),
        child: IconTheme(
          data: IconThemeData(size: 8),
          child: Icon(
            Icons.verified,
            size: 16.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
