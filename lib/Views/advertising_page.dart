import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_angler/Models/advertising.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertisingPage extends StatelessWidget {
  final Advertising advertisement;

  const AdvertisingPage({required this.advertisement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresPersonalizada.corPrimaria,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: CoresPersonalizada.corPrimaria,
        title: Text(advertisement.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              advertisement.imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            _buildButton(context, 'Ligar', FontAwesomeIcons.phone, () {
              launchUrl(Uri(scheme: 'tel', path: advertisement.telefone),
                  mode: LaunchMode.externalApplication);
            }),
            const SizedBox(height: 10),
            _buildButton(
                context, 'Enviar WhatsApp', FontAwesomeIcons.whatsapp, () {
              launchUrl(
                  Uri.parse(
                      'https://wa.me/${advertisement.codigoPais}${advertisement.whatsapp}?text=Olá, te conheci no aplicativo Pro Angler'),
                  mode: LaunchMode.externalApplication);
            }),
            const SizedBox(height: 10),
            _buildButton(context, 'Enviar Email', FontAwesomeIcons.envelope,
                () {
              launchUrl(
                  Uri(scheme: 'mailto', path: advertisement.email),
                  mode: LaunchMode.externalApplication);
            }),
            const SizedBox(height: 10),
            _buildButton(context, 'Visitar Site', FontAwesomeIcons.globe,
                () {
              launchUrl(Uri.parse(advertisement.site),
                  mode: LaunchMode.externalApplication);
            }),
            const SizedBox(height: 10),
            _buildButton(
                context, 'Abrir Instagram', FontAwesomeIcons.instagram,
                () {
              launchUrl(Uri.parse(advertisement.instagram),
                  mode: LaunchMode.externalApplication);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CoresPersonalizada.corSecundaria,
        padding: EdgeInsets.symmetric(vertical: 16),
        minimumSize: Size(double.infinity, 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}