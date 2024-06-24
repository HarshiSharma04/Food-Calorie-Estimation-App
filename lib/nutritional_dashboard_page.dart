import 'package:flutter/material.dart';

class NutritionalDashboardPage extends StatefulWidget {
  @override
  _NutritionalDashboardPageState createState() => _NutritionalDashboardPageState();
}

class _NutritionalDashboardPageState extends State<NutritionalDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutritional Dashboard'),
        backgroundColor: Color(0xFFF35E64), // Use your app's primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nutrient Summary
              Text(
                'Nutrient Summary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA), // Your custom color
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNutrientItem(Icons.local_fire_department, 'Protein', '50g'),
                    _buildNutrientItem(Icons.grain, 'Carbs', '200g'),
                    _buildNutrientItem(Icons.local_pizza, 'Fats', '70g'),
                    _buildNutrientItem(Icons.food_bank_outlined, 'Vitamins', '50mg'),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Vitamin and Mineral Intake
              Text(
                'Vitamin and Mineral Intake',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA), // Your custom color
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildVitaminMineralItem(Icons.sunny, 'Vitamin D', '15mcg'),
                    _buildVitaminMineralItem(Icons.local_florist, 'Vitamin C', '90mg'),
                    _buildVitaminMineralItem(Icons.wb_twilight, 'Iron', '18mg'),
                    _buildVitaminMineralItem(Icons.album, 'Calcium', '1000mg'),
                    _buildVitaminMineralItem(Icons.bolt, 'Magnesium', '400mg'),
                    _buildVitaminMineralItem(Icons.local_cafe, 'Zinc', '11mg'),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Daily Meal Summary
              Text(
                'Daily Meal Summary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA), // Your custom color
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMealSummaryItem(Icons.breakfast_dining, 'Breakfast', 'Oatmeal with fruits'),
                    _buildMealSummaryItem(Icons.lunch_dining, 'Lunch', 'Grilled chicken salad'),
                    _buildMealSummaryItem(Icons.dinner_dining, 'Dinner', 'Salmon with vegetables'),
                    _buildMealSummaryItem(Icons.fastfood, 'Snacks', 'Nuts and yogurt'),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Recommended Nutrients
              Text(
                'Recommended Nutrients',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA), // Your custom color
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildRecommendationItem('Protein', '50-60g'),
                    _buildRecommendationItem('Carbs', '200-250g'),
                    _buildRecommendationItem('Fats', '70-80g'),
                    _buildRecommendationItem('Vitamins', 'Varies'),
                    _buildRecommendationItem('Minerals', 'Varies'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientItem(IconData icon, String nutrient, String value) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Color(0xFF755A5F)), // Custom icon color
        SizedBox(height: 8),
        Text(
          nutrient,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildVitaminMineralItem(IconData icon, String nutrient, String value) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Color(0xFF755A5F)), // Custom icon color
        SizedBox(height: 8),
        Text(
          nutrient,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildMealSummaryItem(IconData icon, String meal, String description) {
    return Row(
      children: [
        Icon(icon, size: 30, color: Color(0xFF755A5F)), // Custom icon color
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecommendationItem(String nutrient, String recommendation) {
    return Row(
      children: [
        Icon(Icons.check, size: 30, color: Color(0xFF755A5F)), // Custom icon color
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nutrient,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              recommendation,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
