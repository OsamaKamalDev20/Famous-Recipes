import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Recipe%20App/recipe_onboarding_data.dart';
import 'package:flutter_ui_designs/Recipe%20App/recipe_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'recipe_colors.dart';

class OnBoardingRecipeScreen extends StatefulWidget {
  const OnBoardingRecipeScreen({super.key});

  @override
  State<OnBoardingRecipeScreen> createState() => _OnBoardingRecipeScreenState();
}

class _OnBoardingRecipeScreenState extends State<OnBoardingRecipeScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: recipes.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          recipes[i].image,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        recipes[i].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: headingColor,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        recipes[i].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: descriptionColor,
                          height: 1.5,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: recipes.length,
            onDotClicked: (currentIndex) {
              pageController.animateToPage(currentIndex,
                  duration: Duration(milliseconds: 800), curve: Curves.easeIn);
            },
            effect: ScrollingDotsEffect(
              spacing: 6.0,
              radius: 8.0,
              dotWidth: 12.0,
              dotHeight: 12.0,
              activeDotColor: buttonColor,
              dotColor: buttonColor.withOpacity(.2),
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              onPressed: () {
                if (currentIndex == recipes.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeScreen(),
                    ),
                  );
                }
                pageController.nextPage(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                );
              },
              child: Text(
                currentIndex == recipes.length - 1 ? "Let's Go" : "Next",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
