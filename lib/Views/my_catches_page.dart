import 'package:flutter/material.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Providers/catches_provider.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/MyCatchesPage/catch_card.dart';
import 'package:pro_angler/Widgets/MyCatchesPage/sections.dart';
import 'package:pro_angler/enum/fish_evaluation_status.dart';
import 'package:provider/provider.dart';

class MyCatchesPage extends StatelessWidget {
  const MyCatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catchesProvider = Provider.of<CatchesProvider>(context);
    final List<Catch> pendingCatches = catchesProvider.getCatchesByValidationStatus(FishEvaluationStatus.aguardandoAvaliacao);
    final List<Catch> validatedCatches = catchesProvider.getCatchesByValidationStatus(FishEvaluationStatus.peixeValidado);
    final List<Catch> invalidatedCatches = catchesProvider.getCatchesByValidationStatus(FishEvaluationStatus.peixeInvalidado);

    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [CoresPersonalizada.corSecundaria, CoresPersonalizada.corPrimaria], // Defina as cores do gradiente aqui
          radius: 1.5, // Defina o raio do gradiente
          center: Alignment.center, // Defina o centro do gradiente
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
        body: ListView(
          children: [
            Section(
              title: 'Aguardando Validação',
              children: pendingCatches.map((catches) => CatchCard(
                fishPhoto: catches.photo,
                fishName: catches.species,
                fishSize: catches.size.toStringAsFixed(1),
                fishLocation: catches.captureLocal,
                tournamentName: catches.tournament.name,
                validatedBy: 'Aguardando...',
              )).toList(),
            ),
            Section(
              title: 'Peixes Validados',
              children: validatedCatches.map((catches) => CatchCard(
                fishPhoto: catches.photo,
                fishName: catches.species,
                fishSize: catches.size.toStringAsFixed(1),
                fishLocation: catches.captureLocal,
                tournamentName: catches.tournament.name,
                validatedBy: catches.validatingAdmin?.name ?? '',
              )).toList(),
            ),
            Section(
              title: 'Peixes Invalidados',
              children: invalidatedCatches.map((catchs) => CatchCard(
                fishPhoto: catchs.photo,
                fishName: catchs.species,
                fishSize: catchs.size.toStringAsFixed(1),
                fishLocation: catchs.captureLocal,
                tournamentName: catchs.tournament.name,
                validatedBy: catchs.validatingAdmin?.name ?? '',
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
