import 'package:http/http.dart';

const String apiKey = '60ae7309346de8a6372afd401889e5bc';
const String apiId = 'b925f969';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }

  Future getData(String url) async {
    print('Calling uri: $url');
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
