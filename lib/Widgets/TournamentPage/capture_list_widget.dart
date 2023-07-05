import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import 'section_title_widget.dart';

class CaptureListWidget extends StatelessWidget {
  const CaptureListWidget({super.key});


  Widget _buildRow(IconData icon, String text, TextStyle textStyle, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, left: 4.0, right: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 14, color: iconColor,),
          const SizedBox(width: 8),
          SizedBox(
            child: Text(
              text,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(
          'Capturas Recentes',
          key: Key('sectionTitle'),
        ),
        const SizedBox.shrink(),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10, // Substitua pelo número correto de capturas
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: CoresPersonalizada.cardClear,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/teste.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRow(FontAwesomeIcons.users, '60UP', CustomTextStyles.cardsTexts, Colors.white),
                              const SizedBox(height: 4),
                              _buildRow(FontAwesomeIcons.fish, 'Tucunaré Azul', CustomTextStyles.cardsTexts, Colors.white),
                              const SizedBox(height: 4),
                              _buildRow(FontAwesomeIcons.ruler, '60,1 CM', CustomTextStyles.cardsTexts, Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
