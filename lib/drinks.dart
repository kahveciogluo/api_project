class RandomDrink {
  final List<Drink> drinks;

  RandomDrink({
    required this.drinks,
  });

  factory RandomDrink.fromJson(Map<String, dynamic> json) => RandomDrink(
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );
}

class Drink {
  String idDrink;
  String strDrink;
  String strGlass;
  String strInstructions;
  String strDrinkThumb;

  Drink({
    required this.idDrink,
    required this.strDrink,
    required this.strGlass,
    required this.strInstructions,
    required this.strDrinkThumb,
  });

  factory Drink.fromJson(Map<String, dynamic> json) =>
      Drink(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strGlass: json["strGlass"],
        strInstructions: json["strInstructions"],
        strDrinkThumb: json["strDrinkThumb"],
      );
}

