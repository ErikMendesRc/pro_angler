import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/SendCatchesPage/form_wiget.dart';
import 'package:pro_angler/Widgets/SendCatchesPage/upload_catches_widget.dart';

class SendCatchesPage extends StatelessWidget {
  const SendCatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoresPersonalizada.corPrimaria,
        elevation: 0,
        centerTitle: true,
        title: const Text('Enviar Capturas'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1,
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    'Informações da Captura',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                   const SizedBox(height: 16),
                  FormWidget(checkFieldsFilled: () {  },),
                   const SizedBox(height: 16),
                  const UploadWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

