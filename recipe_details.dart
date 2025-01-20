import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Recipe%20App/custom_recipe_widget.dart';
import 'package:flutter_ui_designs/Recipe%20App/recipe_colors.dart';
import 'package:flutter_ui_designs/Recipe%20App/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: recipe.image,
            child: Image.network(
              recipe.image,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Expanded(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cardColor,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    recipe.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: headingColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/recipe/difficult.png",
                                      height: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      recipe.difficulty.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: descriptionColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  CustomRecipeWidget(
                                    image: "assets/recipe/cookTime.png",
                                    value:
                                        "${recipe.cookTimeMinutes.toString()} mins",
                                    title: "Cooking Time",
                                  ),
                                  SizedBox(width: 10),
                                  CustomRecipeWidget(
                                    image: "assets/recipe/prepTime.png",
                                    value:
                                        "${recipe.prepTimeMinutes.toString()} mins",
                                    title: "Prepared Time",
                                  ),
                                  SizedBox(width: 10),
                                  CustomRecipeWidget(
                                    image: "assets/recipe/serving.png",
                                    value: "${recipe.servings} people",
                                    title: "Served People",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Ingredients:-",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                recipe.ingredients.length,
                                (index) {
                                  return Text(
                                    "- ${recipe.ingredients[index]}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: descriptionColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Instruction:-",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                recipe.instructions.length,
                                (index) {
                                  return Text(
                                    "- ${recipe.instructions[index]}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: descriptionColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Meal Type:-",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  recipe.mealType.length,
                                  (i) => Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          recipe.mealType[i],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: cardColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Rating and Reviews",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: headingColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        recipe.rating.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "(${recipe.reviewCount.toString()} reviews)",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: descriptionColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(55),
                                      color: buttonColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Buy Now",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
