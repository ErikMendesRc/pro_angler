import 'package:flutter/material.dart';

import '../../Models/payment_model.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  late PaymentModel _paymentModel;
  bool _isCardSelected = false;
  bool _isPixSelected = false;
  int _installments = 1;

  @override
  void initState() {
    super.initState();
    _paymentModel = PaymentModel();
  }

  bool isCardFormValid() {
    return _isCardSelected &&
        _paymentModel.cardName.isNotEmpty &&
        _paymentModel.cardNumber.isNotEmpty &&
        _paymentModel.cvv.isNotEmpty &&
        _paymentModel.expiryDate.isNotEmpty &&
        _paymentModel.email.isNotEmpty &&
        _paymentModel.address.isNotEmpty &&
        _paymentModel.cpf.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ExpansionTile(
              title: const Text(
                'Cartão de Crédito',
                style: TextStyle(color: Colors.black),
              ),
              leading: const Icon(Icons.credit_card, color: Colors.black),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isCardSelected = expanded;
                  _isPixSelected = false;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dados para pagamento:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: 'Nome do cartão',
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                        ),
                        onChanged: (value) {
                          _paymentModel.cardName = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: 'Número do cartão',
                          prefixIcon:
                              Icon(Icons.credit_card, color: Colors.black),
                        ),
                        onChanged: (value) {
                          _paymentModel.cardNumber = value;
                          setState(() {});
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                labelText: 'Validade',
                                prefixIcon: Icon(Icons.calendar_today,
                                    color: Colors.black),
                              ),
                              onChanged: (value) {
                                _paymentModel.expiryDate = value;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                labelText: 'CVV',
                                prefixIcon:
                                    Icon(Icons.security, color: Colors.black),
                              ),
                              onChanged: (value) {
                                _paymentModel.cvv = value;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'Escolha a quantidade de parcelas:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      DropdownButton<int>(
                        value: _installments,
                        onChanged: (value) {
                          setState(() {
                            _installments = value!;
                          });
                        },
                        hint: Text('Selecione o número de parcelas'),
                        items: List.generate(6, (index) {
                          int option = index + 1;
                          return DropdownMenuItem<int>(
                            value: option,
                            child: Text('${option.toString().trim()}x Parcelas'),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Dados do Titular:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                        ),
                        onChanged: (value) {
                          _paymentModel.email = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: 'Endereço',
                          prefixIcon: Icon(Icons.home, color: Colors.black),
                        ),
                        onChanged: (value) {
                          _paymentModel.address = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: 'CPF',
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                        ),
                        onChanged: (value) {
                          _paymentModel.cpf = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ExpansionTile(
              title: const Text(
                'PIX',
                style: TextStyle(color: Colors.black),
              ),
              leading: const Icon(Icons.qr_code, color: Colors.black),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isPixSelected = expanded;
                  _isCardSelected = false;
                });
              },
              children: [],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (_isCardSelected && isCardFormValid()) || _isPixSelected
                ? () => _submitForm()
                : null,
            child: Text(
              _isPixSelected ? 'Gerar PIX' : 'Fazer Inscrição',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    // Lógica para processar o formulário de inscrição aqui
  }
}
