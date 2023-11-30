class Stat{
  String name;
  int baseValue;

  Stat({
    required String originalName,
    required this.baseValue
  }): name = changeStatName(originalName);

  static String changeStatName(String name){

    final Map<String, String> namesToBeChanged = {
      "special-attack": "special Attack",
      "special-defense": "special Defense"
    }; 

    return namesToBeChanged[name] ?? name;
  }
}