import 'package:flutter/material.dart';
import 'package:pro_angler/Providers/ibge_provider.dart';
import 'package:provider/provider.dart';

class TournamentLocationFormField extends StatefulWidget {
  final ValueNotifier<String> stateController;
  final ValueNotifier<String> cityController;

  TournamentLocationFormField({
    Key? key,
    required this.stateController,
    required this.cityController,
  }) : super(key: key);

  @override
  _TournamentLocationFormFieldState createState() =>
      _TournamentLocationFormFieldState();
}

class _TournamentLocationFormFieldState
    extends State<TournamentLocationFormField> {
  String _selectedState = '';
  String _selectedCity = '';
  bool _citiesDropdownVisible = false;

  @override
  void initState() {
    super.initState();

    widget.stateController.value = _selectedState;
    widget.cityController.value = _selectedCity;

    Provider.of<IBGEProvider>(context, listen: false).fetchEstados();
  }

  String? _validateState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, selecione o estado.';
    }
    return null;
  }

  String? _validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, selecione a cidade.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<String>>>(
      builder: (BuildContext context,
          AsyncSnapshot<Map<String, List<String>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Erro ao buscar os dados.');
        } else {
          return Column(
            children: [
              Consumer<IBGEProvider>(
                builder: (context, ibgeProvider, child) {
                  return Column(
                    children: [
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Estado',
                          prefixIcon: Icon(Icons.place, color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        value: _selectedState.isNotEmpty ? _selectedState : null,
                        items: ibgeProvider.estados?.map((estado) {
                          return DropdownMenuItem<String>(
                            value: estado.sigla,
                            child: Text(estado.sigla),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null && newValue != _selectedState) {
                            setState(() {
                              _selectedState = newValue;
                              _selectedCity = '';
                              _citiesDropdownVisible = true;
                              widget.stateController.value = _selectedState;
                              widget.cityController.value = _selectedCity;
                              
                              ibgeProvider.fetchCidadesPorEstado(newValue);
                            });
                          }
                        },
                        validator: _validateState,
                      ),
                      const SizedBox(height: 16.0),
                      Visibility(
                        visible: _citiesDropdownVisible,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Cidade',
                            prefixIcon: Icon(Icons.location_city, color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          value: _selectedCity.isNotEmpty ? _selectedCity : null,
                          items: ibgeProvider.cidades?.map((cidade) {
                            return DropdownMenuItem<String>(
                              value: cidade.nome,
                              child: Text(cidade.nome),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedCity = newValue;
                                widget.cityController.value = _selectedCity;
                              });
                            }
                          },
                          validator: _validateCity,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}