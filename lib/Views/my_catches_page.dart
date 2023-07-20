import 'package:flutter/material.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Providers/catches_provider.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/MyCatchesPage/catch_card.dart';
import 'package:pro_angler/Widgets/MyCatchesPage/sections.dart';
import 'package:provider/provider.dart';

class MyCatchesPage extends StatelessWidget {
  const MyCatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catchesProvider = Provider.of<CatchesProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            CoresPersonalizada.corSecundaria,
            CoresPersonalizada.corPrimaria
          ],
          radius: 1.5,
          center: Alignment.center,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: CoresPersonalizada.corPrimaria,
          centerTitle: true,
          elevation: 0,
          title: const Text('Minhas Capturas'),
        ),
        body: FutureBuilder(
          future: Future.wait([
            catchesProvider.getPendingCatches(),
            catchesProvider.getValidatedCatches(),
            catchesProvider.getInvalidatedCatches(),
          ]),
          builder: (context, AsyncSnapshot<List<List<Catch>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar os dados.'),
              );
            } else {
              final pendingCatches = snapshot.data![0];
              final validatedCatches = snapshot.data![1];
              final invalidatedCatches = snapshot.data![2];

              return ListView(
                children: [
                  Section(
                    title: 'Aguardando Validação',
                    children: pendingCatches
                        .map((catches) => CatchCard(
                              catchId: catches.id,
                              fishPhoto: catches.photo,
                              fishName: catches.species,
                              fishSize: catches.size.toStringAsFixed(1),
                              fishLocation: catches.captureLocal,
                              tournamentName: catches.tournament.name,
                              validatedBy: 'Aguardando...',
                            ))
                        .toList(),
                  ),
                  Section(
                    title: 'Peixes Validados',
                    children: validatedCatches
                        .map((catches) => CatchCard(
                              catchId: catches.id,
                              fishPhoto: catches.photo,
                              fishName: catches.species,
                              fishSize: catches.size.toStringAsFixed(1),
                              fishLocation: catches.captureLocal,
                              tournamentName: catches.tournament.name,
                              validatedBy: catches.validatingAdmin?.name ?? '',
                            ))
                        .toList(),
                  ),
                  Section(
                    title: 'Peixes Invalidados',
                    children: invalidatedCatches
                        .map((catches) => CatchCard(
                              catchId: catches.id,
                              fishPhoto: catches.photo,
                              fishName: catches.species,
                              fishSize: catches.size.toStringAsFixed(1),
                              fishLocation: catches.captureLocal,
                              tournamentName: catches.tournament.name,
                              validatedBy: catches.validatingAdmin?.name ?? '',
                            ))
                        .toList(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
