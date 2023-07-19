class FishSpecies {
  final String name;
  final String category;

  FishSpecies(this.name, this.category);

  static List<FishSpecies> get speciesList => [
    FishSpecies('Tucunaré Azul', 'tucunareAzul'),
    FishSpecies('Tucunaré Amarelo', 'tucunareAmarelo'),
    FishSpecies('Traíra', 'traira'),
    FishSpecies('Robalo Peva', 'robaloPeva'),
    FishSpecies('Robalo Flecha', 'robaloFlecha'),
  ];
}
