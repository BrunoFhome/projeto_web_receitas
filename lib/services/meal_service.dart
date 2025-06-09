import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class MealService {
  static Future<List<Meal>> fetchMeals() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final meals = data['meals'] as List;
      return meals.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar receitas');
    }
  }

  static Future<List<Meal>> fetchMealsByCategory(String category) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final meals = data['meals'] as List;
      return meals.map((json) => Meal(
        id: json['idMeal'],
        name: json['strMeal'],
        thumbnail: json['strMealThumb'],
        instructions: '', // vamos buscar instruções ao clicar na receita
      )).toList();
    } else {
      throw Exception('Erro ao carregar receitas da categoria $category');
    }
  }

  static Future<Meal> fetchMealById(String id) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'),
    );
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Meal.fromJson(data['meals'][0]);
    } else {
      throw Exception('Erro ao buscar receita');
    }
  }
  static Future<List<Meal>> searchMeals(String query) async {
  final response = await http.get(
    Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query'),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final meals = data['meals'] as List?;
    
    if (meals == null) {
      return [];
    }
    
    return meals.map((json) => Meal.fromJson(json)).toList();
  } else {
    throw Exception('Erro ao buscar receitas');
  }
}

}