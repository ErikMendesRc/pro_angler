import 'package:flutter/material.dart';
import 'package:pro_angler/Api/ibge_api.dart';
import 'package:pro_angler/Models/IBGE/cidade.dart';
import 'package:pro_angler/Models/IBGE/estado.dart';

class IBGEProvider extends ChangeNotifier {
  final IBGEApi _api = IBGEApi();

  List<Estado>? estados;
  List<Cidade>? cidades;

  Future<void> fetchEstados() async {
    try {
      estados = await _api.getEstados();
      notifyListeners();
    } catch (e) {
      print('Erro ao buscar estados: $e');
    }
  }

  Future<void> fetchCidadesPorEstado(String uf) async {
    try {
      cidades = await _api.getCidadesPorEstado(uf);
      notifyListeners();
    } catch (e) {
      print('Erro ao buscar cidades: $e');
    }
  }
}