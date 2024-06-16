import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF755A5F),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Handle menu button press
          },
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/04/25/65/97/360_F_425659755_5BaLdNbbCtQbbiz1JNFBikshfiCWI5NE.jpg'),
            radius: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            'https://media.istockphoto.com/id/1459322601/vector/mindful-eating-and-daily-diet-with-harmony-and-balance-complete-full-menu-with-healthy.jpg?s=612x612&w=0&k=20&c=fbK3xSHrXRmRwybXeRBapZH0CyT09443jdZ4hEJjOik=',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle estimate calorie button press
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Estimate Calorie', style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFFB3AC78),
              backgroundColor: Color(0xFF82ACBA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
              shadowColor: Color(0xFFB3AC78),
              elevation: 5,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              textStyle: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              shrinkWrap: true,
              children: [
                OptionTile(title: 'Track Progress', gradientColors: [Color(0xFFD9A58D), Colors.white], textSize: 20, aspectRatio: 2),
                OptionTile(title: 'Nutritional Dashboard', gradientColors: [Color(0xFFD9A58D), Colors.white], textSize: 20, aspectRatio: 2),
                OptionTile(title: 'Recipes', gradientColors: [Color(0xFFD9A58D), Colors.white], textSize: 20, aspectRatio: 2),
                OptionTile(title: 'Personalized Food Choices', gradientColors: [Color(0xFFD9A58D), Colors.white], textSize: 20, aspectRatio: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String title;
  final List<Color> gradientColors;
  final double textSize;
  final double aspectRatio;

  const OptionTile({Key? key, required this.title, required this.gradientColors, this.textSize = 18, this.aspectRatio = 3/1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold, color: Color(0xFF404040)),
            ),
          ),
        ),
      ),
    );
  }
}
