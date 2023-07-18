import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_angler/Providers/catches_provider.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import 'package:provider/provider.dart';

class CatchDetails extends StatelessWidget {
  final String catchId;

  const CatchDetails({Key? key, required this.catchId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catchesProvider = Provider.of<CatchesProvider>(context);
    final catchId = ModalRoute.of(context)!.settings.arguments as String;
    final catchDetails = catchesProvider.getCatchById(catchId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoresPersonalizada.corPrimaria,
        title: const Text('Detalhes da Captura'),
        elevation: 0,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria,
            ],
            radius: 0.7,
          ),
        ),
        child: SafeArea(
          child: Consumer<CatchesProvider>(
            builder: (context, catchesProvider, _) {
              final catches = catchesProvider.catches;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://blog.pescagerais.com.br/wp-content/uploads/2020/08/tucunare-azul-cichla-piquiti-pescador-lester-scalon.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Peixe Validado',
                    style: CustomTextStyles.texto16Bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRowWithIconAndText(
                          FontAwesomeIcons.fish,
                          'Peixe: ${catchDetails.species}',
                        ),
                        const SizedBox(height: 12),
                        _buildRowWithIconAndText(
                          FontAwesomeIcons.ruler,
                          'Tamanho: ${catchDetails.size}',
                        ),
                        const SizedBox(height: 12),
                        _buildRowWithIconAndText(
                          FontAwesomeIcons.mapMarkerAlt,
                          'Local: ${catchDetails.captureLocal}',
                        ),
                        const SizedBox(height: 12),
                        _buildRowWithIconAndText(
                          FontAwesomeIcons.trophy,
                          'Torneio: ${catchDetails.tournament.name}',
                        ),
                        const SizedBox(height: 12),
                        _buildRowWithIconAndText(
                          FontAwesomeIcons.user,
                          'Juiz: ${catchDetails.validatingAdmin?.name}',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Detalhes do administrador',
                    style: CustomTextStyles.texto16Bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Observações',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLines: 5,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  Widget _buildRowWithIconAndText(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: CustomTextStyles.texto14Normal,
        ),
      ],
    );
  }
}
