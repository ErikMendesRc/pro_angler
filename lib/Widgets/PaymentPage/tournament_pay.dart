import 'package:flutter/material.dart';

class TournamentPay extends StatefulWidget {
  const TournamentPay({super.key});

  @override
  _TournamentPayState createState() => _TournamentPayState();
}

class _TournamentPayState extends State<TournamentPay> {
  bool _isBottomSheetVisible = false;

  void _openPaymentModal() {
    setState(() {
      _isBottomSheetVisible = true;
    });
  }

  void _closePaymentModal() {
    setState(() {
      _isBottomSheetVisible = false;
    });
  }

  Widget _buildBottomSheetContent() {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Modal de Pagamento',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _closePaymentModal,
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TournamentPay'),
      ),
      body: Center(
        child: TextButton(
          onPressed: _openPaymentModal,
          child: Text('Pagar'),
        ),
      ),
      bottomSheet: _isBottomSheetVisible
          ? BottomSheet(
              onClosing: _closePaymentModal,
              builder: (BuildContext context) {
                return _buildBottomSheetContent();
              },
            )
          : null,
    );
  }
}