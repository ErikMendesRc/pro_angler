import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'capture_list_widget.dart';

class CaptureListCard extends StatelessWidget {
  const CaptureListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 8),
            CaptureListWidget(),
          ],
        ),
      ),
    );
  }
}