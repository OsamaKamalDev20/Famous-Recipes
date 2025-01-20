class RecipeOnBoardingScreen {
  String image;
  String title;
  String description;

  RecipeOnBoardingScreen({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<RecipeOnBoardingScreen> recipes = [
  RecipeOnBoardingScreen(
    image: "assets/recipe/onBoardingImage_1.jpg",
    title: "Discover Recipes",
    description:
        "Explore thousands of recipes from all over the world, curated just for you. From appetizers to desserts, find dishes that suit your taste and dietary preferences.",
  ),
  RecipeOnBoardingScreen(
    image: "assets/recipe/onBoardingImage_2.jpg",
    title: "Save Your Favorites",
    description:
        "Save your favorite recipes to access them anytime. Organize your saved recipes in personalized collections for easy reference.",
  ),
  RecipeOnBoardingScreen(
    image: "assets/recipe/onBoardingImage_3.jpg",
    title: "Step-by-Step Instructions",
    description:
        "Follow easy step-by-step instructions with photos and videos. Cook confidently with detailed guidance for every recipe you choose.",
  ),
  RecipeOnBoardingScreen(
    image: "assets/recipe/onBoardingImage_4.jpg",
    title: "Share with Friends",
    description:
        "Create memories by sharing your favorite recipes with friends and family. Enjoy cooking together and exchanging culinary tips!",
  ),
];
