import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class ListSectionWidget extends StatelessWidget {
  final String title;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const ListSectionWidget({
    Key? key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyles.texto16Bold,
            ),
            const Spacer(),
            if (title == 'Moderadores')
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Adicionar ou Remover',
                  style: CustomTextStyles.texto12BrancoBold,
                ),
              )
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: itemCount * 100.0,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}


