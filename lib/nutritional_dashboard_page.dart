import 'package:flutter/material.dart';

class NutritionalDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF35E64),
        title: Text('Nutritional Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nutritional Summary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF404040),
                ),
              ),
              SizedBox(height: 20),
              NutrientCard(
                nutrient: 'Calories',
                amount: '2,500 kcal',
                color: Color(0xFF82ACBA),
              ),
              NutrientCard(
                nutrient: 'Protein',
                amount: '150 g',
                color: Color(0xFFB3AC78),
              ),
              NutrientCard(
                nutrient: 'Carbohydrates',
                amount: '300 g',
                color: Color(0xFFB3AC78),
              ),
              NutrientCard(
                nutrient: 'Fats',
                amount: '70 g',
                color: Color(0xFF82ACBA),
              ),
              SizedBox(height: 20),
              Text(
                'Nutritional Breakdown',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF404040),
                ),
              ),
              SizedBox(height: 10),
              PieChartWidget(),
              SizedBox(height: 20),
              Text(
                'Recent Meals',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF404040),
                ),
              ),
              SizedBox(height: 10),
              MealCard(
                meal: 'Breakfast',
                description: 'Oatmeal, Banana, Coffee',
                calories: '350 kcal',
              ),
              MealCard(
                meal: 'Lunch',
                description: 'Grilled Chicken Salad, Orange Juice',
                calories: '450 kcal',
              ),
              MealCard(
                meal: 'Dinner',
                description: 'Spaghetti, Garlic Bread, Salad',
                calories: '600 kcal',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NutrientCard extends StatelessWidget {
  final String nutrient;
  final String amount;
  final Color color;

  const NutrientCard({
    Key? key,
    required this.nutrient,
    required this.amount,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nutrient,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for a pie chart
    return Container(
      height: 200,
      color: Color(0xFFF3F3F3),
      child: Center(
        child: Text(
          'Pie Chart Here',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF404040),
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String meal;
  final String description;
  final String calories;

  const MealCard({
    Key? key,
    required this.meal,
    required this.description,
    required this.calories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF404040),
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF404040),
              ),
            ),
            SizedBox(height: 5),
            Text(
              calories,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF404040),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
