class Meal {
  final String id;
  final String name;
  final String thumbnail;
  final String instructions;

  Meal({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.instructions,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      instructions: json['strInstructions'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strMealThumb': thumbnail,
      'strInstructions': instructions,
    };
  }
}