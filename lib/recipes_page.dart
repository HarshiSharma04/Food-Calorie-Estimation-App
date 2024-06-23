import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final List<String> categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Desserts',
    'Snacks',
    'Drinks',
    'Appetizers',
    'Salads'
  ];

  final List<Color> categoryColors = [
    Color(0xFFEDE7DB),
    Color(0xFFF9A581),
    Color(0xFFEDE7DB),
    Color(0xFFF9A581),
    Color(0xFFEDE7DB),
    Color(0xFFF9A581),
    Color(0xFFEDE7DB),
    Color(0xFFF9A581)
  ];

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
                  color: Color(0xFF82ACBA),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: categories[index],
                      color: categoryColors[index % categoryColors.length],
                    );
                  },
                ),
              ),
              SizedBox(height: 32),
              // Explore More Section
              Text(
                'Explore More',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA),
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
      name: 'Avocado Toast',
      method: 'A modern classic featuring creamy avocado spread on toasted bread, topped with a variety of delicious add-ons.',
      image: 'https://images.pexels.com/photos/7937471/pexels-photo-7937471.jpeg?auto=compress&cs=tinysrgb&w=600',
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
  final Color color;

  CategoryCard({required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
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
            color: Colors.white,
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
  Recipe(name: 'Chicken Alfredo Pasta', method: 'Creamy, cheesy, and utterly delicious. A family favorite.', image: 'https://cdn.apartmenttherapy.info/image/fetch/f_auto,q_auto:eco/https://storage.googleapis.com/gen-atmedia/3/2017/10/c54907276a7cb6e0545ae2128bdc984e86b6cb9d.jpeg'),
  Recipe(name: 'Masala Dosa', method: 'Crispy fermented crepes filled with spicy potato filling.', image: 'https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Recipe(name: 'Street-Style Tacos', method: 'Authentic Mexican tacos with a variety of fillings like carnitas, barbacoa, and grilled vegetables, topped with fresh cilantro and onions.', image: 'https://images.pexels.com/photos/4958641/pexels-photo-4958641.jpeg?auto=compress&cs=tinysrgb&w=600'),
  // Add more recipes here
];

final List<Recipe> trendingRecipes = [
  Recipe(name: 'Chocolate Lava Cake', method: 'A warm, gooey, chocolate delight.', image: 'https://www.yourhomebasedmom.com/wp-content/uploads/2020/02/chocoalte-lava-cake-for-two-1023x1536.jpg'),
  Recipe(name: 'Caesar Salad', method: 'Crisp romaine lettuce with a tangy Caesar dressing.', image: 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Recipe(name: 'Ramen Bowls', method: 'A comforting Japanese noodle soup with rich broth, tender noodles, and a variety of toppings like soft-boiled eggs and sliced pork.', image: 'https://images.pexels.com/photos/2664216/pexels-photo-2664216.jpeg?auto=compress&cs=tinysrgb&w=600'),
  // Add more recipes here
];

final List<Recipe> moreRecipes = [
  Recipe(name: 'Paneer Butter Masala', method: 'A rich and creamy Indian curry made with paneer.', image: 'https://images.pexels.com/photos/9609838/pexels-photo-9609838.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Recipe(name: 'Blueberry Muffins', method: 'Moist, fluffy, and packed with fresh blueberries.', image: 'https://images.pexels.com/photos/18955551/pexels-photo-18955551/free-photo-of-a-cupcake-with-blueberry-frosting.jpeg?auto=compress&cs=tinysrgb&w=600'),
  // Add more recipes here
];
