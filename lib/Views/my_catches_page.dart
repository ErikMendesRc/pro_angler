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
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [CoresPersonalizada.corSecundaria, CoresPersonalizada.corPrimaria],
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
        body: Consumer<CatchesProvider>(
          builder: (context, catchesProvider, _) {
            final List<Catch> pendingCatches = catchesProvider.getCatchesByValidationStatus(FishEvaluationStatus.aguardandoAvaliacao);
            final List<Catch> validatedCatches = catchesProvider.getCatchesByValidationStatus(FishEvaluationStatus.peixeValidado);
            final List<Catch> invalidatedCatches = catchesProvider.getCatchesByValidationStatus(FishEvaluationStatus.peixeInvalidado);

            return ListView(
              children: [
                Section(
                  title: 'Aguardando Validação',
                  children: pendingCatches.map((catches) => CatchCard(
                    catchId: catches.id,
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
                    catchId: catches.id,
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
                  children: invalidatedCatches.map((catches) => CatchCard(
                    catchId: catches.id,
                    fishPhoto: catches.photo,
                    fishName: catches.species,
                    fishSize: catches.size.toStringAsFixed(1),
                    fishLocation: catches.captureLocal,
                    tournamentName: catches.tournament.name,
                    validatedBy: catches.validatingAdmin?.name ?? '',
                  )).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
