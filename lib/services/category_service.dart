import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryService {
  static Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final categories = data['categories'] as List;
      return categories.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar categorias');
    }
  }
}
