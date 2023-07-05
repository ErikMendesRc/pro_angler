import 'package:flutter/material.dart';
import 'package:pro_angler/Widgets/HomePage/tournament_card.dart';

class TournamentSection extends StatelessWidget {
  final String title;
  final int itemCount;
  final TextStyle textStyle;

  const TournamentSection({
    Key? key,
    required this.title,
    required this.itemCount,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  title,
                  style: textStyle, // Aplicando o estilo fornecido ao título
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Ver todos',
                    style: TextStyle(
                      color: Color(0xFF268CB7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemBuilder: (context, index) {
              return const TournamentCard();
            },
          ),
        ),
      ],
    );
  }
}
