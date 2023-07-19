class Types {
  final String name;
  final String category;

  Types(this.name, this.category);

  static List<Types> get types => [
    Types('Online', 'online'),
    Types('Presencial', 'presencial'),
  ];
}