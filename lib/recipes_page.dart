import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Recipes'),
        backgroundColor: Color(0xFFF35E64),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipes...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Featured Recipe of the Day
              Text(
                'Featured Recipe of the Day',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA),
                ),
              ),
              SizedBox(height: 16),
              FeaturedRecipeCard(),
              SizedBox(height: 32),
              // Suggested Recipes Section
              Text(
                'Recipes for You',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: suggestedRecipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: suggestedRecipes[index]);
                  },
                ),
              ),
              SizedBox(height: 32),
              // Trending Recipes Section
              Text(
                'Trending Recipes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingRecipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: trendingRecipes[index]);
                  },
                ),
              ),
              SizedBox(height: 32),
              // Categories Section
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories.map((category) {
                    return CategoryCard(category: category);
                  }).toList(),
                ),
              ),
              SizedBox(height: 32),
              // Explore More Section
              Text(
                'Explore More',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: moreRecipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(recipe: moreRecipes[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              recipe.image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  recipe.method,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedRecipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with actual featured recipe data
    final recipe = Recipe(
      name: 'Featured Recipe',
      method: 'Delicious and easy to make...',
      image: 'https://via.placeholder.com/150',
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              recipe.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  recipe.method,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Recipe {
  final String name;
  final String method;
  final String image;

  Recipe({required this.name, required this.method, required this.image});
}

// Sample data for recipes
final List<Recipe> suggestedRecipes = [
  Recipe(name: 'Recipe 1', method: 'Method 1', image: 'https://via.placeholder.com/150'),
  Recipe(name: 'Recipe 2', method: 'Method 2', image: 'https://via.placeholder.com/150'),
  // Add more recipes here
];

final List<Recipe> trendingRecipes = [
  Recipe(name: 'Recipe 3', method: 'Method 3', image: 'https://via.placeholder.com/150'),
  Recipe(name: 'Recipe 4', method: 'Method 4', image: 'https://via.placeholder.com/150'),
  // Add more recipes here
];

final List<Recipe> moreRecipes = [
  Recipe(name: 'Recipe 5', method: 'Method 5', image: 'https://via.placeholder.com/150'),
  Recipe(name: 'Recipe 6', method: 'Method 6', image: 'https://via.placeholder.com/150'),
  // Add more recipes here
];

final List<String> categories = [
  'Breakfast',
  'Lunch',
  'Dinner',
  'Desserts',
  // Add more categories here
];
