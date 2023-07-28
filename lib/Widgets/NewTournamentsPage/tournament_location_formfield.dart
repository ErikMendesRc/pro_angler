import 'package:flutter/material.dart';

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

  Future<Map<String, List<String>>> fetchLocations() async {
    return {
      'Estado 1': ['Cidade 1', 'Cidade 2', 'Cidade 3'],
      'Estado 2': ['Cidade 4', 'Cidade 5', 'Cidade 6'],
    };
  }

  @override
  void initState() {
    super.initState();

    widget.stateController.value = _selectedState;
    widget.cityController.value = _selectedCity;
  }

  @override
  void dispose() {
    super.dispose();
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
      future: fetchLocations(),
      builder: (BuildContext context,
          AsyncSnapshot<Map<String, List<String>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Erro ao buscar os dados.');
        } else {
          final locations = snapshot.data!;
          return Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  prefixIcon:
                      Icon(Icons.place, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                value: _selectedState.isNotEmpty ? _selectedState : null,
                items: locations.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null && newValue != _selectedState) {
                    setState(() {
                      _selectedState = newValue;
                      _selectedCity = '';
                      widget.stateController.value =
                          _selectedState;
                      widget.cityController.value =
                          _selectedCity;
                    });
                  }
                },
                validator: _validateState, // Add the validator function here.
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Cidade',
                  prefixIcon: Icon(Icons.location_city,
                      color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                value: _selectedCity.isNotEmpty ? _selectedCity : null,
                items: _selectedState.isNotEmpty
                    ? locations[_selectedState]
                        ?.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()
                    : [],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedCity = newValue;
                      widget.cityController.value =
                          _selectedCity; // Update the city ValueNotifier
                    });
                  }
                },
                validator: _validateCity, // Add the validator function here.
              ),
            ],
          );
        }
      },
    );
  }
}