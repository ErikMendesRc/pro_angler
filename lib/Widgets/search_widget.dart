import 'package:flutter/material.dart';
import 'package:pro_angler/Widgets/tournament_search_card.dart';
import 'package:provider/provider.dart';

import '../Providers/tournament_provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentProvider = Provider.of<TournamentProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1),
            ),
          ],
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (query) {
                tournamentProvider.searchTournaments(query);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xff4338CA),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Pesquise por torneios',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (tournamentProvider.isLoading)
              const CircularProgressIndicator()
            else if (tournamentProvider.currentTournament != null)
              TournamentSearchCard(tournamentProvider.currentTournament!)
          ],
        ),
      ),
    );
  }
}