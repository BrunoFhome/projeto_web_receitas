import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorite_meals';

  // Get all favorite meals
  static Future<List<Meal>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];
    
    return favoritesJson.map((json) {
      final Map<String, dynamic> data = jsonDecode(json);
      return Meal.fromJson(data);
    }).toList();
  }

  // Add meal to favorites
  static Future<void> addToFavorites(Meal meal) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    // Check if already exists
    if (!favorites.any((m) => m.id == meal.id)) {
      favorites.add(meal);
      final favoritesJson = favorites.map((m) => jsonEncode(m.toJson())).toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);
    }
  }

  // Remove meal from favorites
  static Future<void> removeFromFavorites(String mealId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    favorites.removeWhere((meal) => meal.id == mealId);
    final favoritesJson = favorites.map((m) => jsonEncode(m.toJson())).toList();
    await prefs.setStringList(_favoritesKey, favoritesJson);
  }

  // Check if meal is favorite
  static Future<bool> isFavorite(String mealId) async {
    final favorites = await getFavorites();
    return favorites.any((meal) => meal.id == mealId);
  }
}