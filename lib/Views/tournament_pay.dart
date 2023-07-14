import 'package:flutter/material.dart';

import '../Models/payment_model.dart';
import '../Util/cores.dart';
import '../Widgets/PaymentPage/payment_methods.dart';
import '../Widgets/TournamentUserRegister/tournment_info_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: CoresPersonalizada.corPrimaria,
        title: const Text('Inscrever-se'),
      ),
      body: Container(
        decoration: const BoxDecoration( 
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria,
            ],
            center: Alignment.center,
            radius: 0.9,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TournamentInfoCard(),
            SizedBox(height: 20),
            Text(
              'Opções de pagamento:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: PaymentOptions(),
            ),
          ],
        ),
      ),
    );
  }
}


