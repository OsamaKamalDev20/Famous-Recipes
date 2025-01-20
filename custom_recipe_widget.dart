import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Recipe%20App/recipe_colors.dart';

class CustomRecipeWidget extends StatelessWidget {
  final image;
  final title;
  final value;
  CustomRecipeWidget({
    super.key,
    required this.image,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          elevation: 5,
          child: Container(
            height: 125,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 55,
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: headingColor,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: descriptionColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
