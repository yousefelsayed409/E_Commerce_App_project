import 'dart:convert';
import 'package:ecommerceapp/featuears/categore/data/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/categories"),
        headers: {'lang': "en"},
      );
      final responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        return (responseBody['data']['data'] as List)
            .map((item) => CategoryModel.fromjson(data: item))
            .toList();
      } else {
        throw Exception("Failed to fetch categories");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
