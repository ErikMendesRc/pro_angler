import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class InfoItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoItemWidget(this.icon, this.label, {super.key});

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: CoresPersonalizada.corPrimariaIcones,
          ),
          const SizedBox(width: 12), // Espaçamento horizontal entre o ícone e o texto
          Text(
            label,
            style: CustomTextStyles.cardsTitles,
          ),
        ],
      ),
    );
  }
}