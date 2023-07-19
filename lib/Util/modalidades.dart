class Modalities {
  final String name;
  final String category;

  Modalities(this.name, this.category);

  static List<Modalities> get modalities => [
    Modalities('Caiaque', 'caiaque'),
    Modalities('Barco', 'barco'),
    Modalities('Pesqueiro', 'pesqueiro'),
  ];
}