import 'dart:convert';
import 'package:pro_angler/Models/IBGE/cidade.dart';
import 'package:pro_angler/Models/IBGE/estado.dart';
import 'package:http/http.dart' as http;

class IBGEApi {
  static const _baseUrl = 'https://servicodados.ibge.gov.br/api/v1/localidades';

  Future<List<Estado>> getEstados() async {
    final response = await http.get(Uri.parse('$_baseUrl/estados?orderBy=nome'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Estado.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar estados');
    }
  }

  Future<List<Cidade>> getCidadesPorEstado(String uf) async {
    final response = await http.get(Uri.parse('$_baseUrl/estados/$uf/municipios?orderBy=nome'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Cidade.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar cidades');
    }
  }
}