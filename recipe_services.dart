import 'package:flutter_ui_designs/Recipe%20App/recipe_model.dart';
import 'package:http/http.dart' as http;

recipeItems() async {
  Uri recipeUrl = Uri.parse("https://dummyjson.com/recipes");
  var response = await http.get(recipeUrl);

  try {
    if (response.statusCode == 200) {
      var data = recipeModelFromJson(response.body.toString());
      return data.recipes;
    } else {
      print("Error Occurred, enable to load recipes");
    }
  } catch (e) {
    print(e.toString());
  }
}
