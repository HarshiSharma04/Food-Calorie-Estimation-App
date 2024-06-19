import 'package:flutter/material.dart';
import 'track_progress_page.dart';
import 'food_scan_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF35E64),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/04/25/65/97/360_F_425659755_5BaLdNbbCtQbbiz1JNFBikshfiCWI5NE.jpg'),
              radius: 15,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Color(0xFFF35E64), // Background color for the header
              child: DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white, // Text color for the header
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Color(0xFF755A5F), // Text color for the items
                ),
              ),
              leading: Icon(Icons.person, color: Color(0xFF755A5F)), // Icon color for the items
              onTap: () {
                // Navigate to profile page
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xFF755A5F),
                ),
              ),
              leading: Icon(Icons.settings, color: Color(0xFF755A5F)),
              onTap: () {
                // Navigate to settings page
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  color: Color(0xFF755A5F),
                ),
              ),
              leading: Icon(Icons.info, color: Color(0xFF755A5F)),
              onTap: () {
                // Navigate to about page
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200, // Adjusted height for the image
                child: Image.network(
                  'https://media.istockphoto.com/id/1459322601/vector/mindful-eating-and-daily-diet-with-harmony-and-balance-complete-full-menu-with-healthy.jpg?s=612x612&w=0&k=20&c=fbK3xSHrXRmRwybXeRBapZH0CyT09443jdZ4hEJjOik=',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to Calorie Estimator!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF404040)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Your personalized tool for tracking calorie intake and making informed food choices.',
                  style: TextStyle(fontSize: 16, color: Color(0xFF404040)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  label: Text('Estimate Calorie', style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF82ACBA),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
                    shadowColor: Color(0xFFB3AC78),
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    OptionTile(
                      title: 'Track Progress',
                      icon: Icons.track_changes,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TrackProgressPage()),
                        );
                      },
                    ),
                    Divider(),
                    OptionTile(title: 'Nutritional Dashboard', icon: Icons.dashboard, onTap: () {}),
                    Divider(),
                    OptionTile(title: 'Recipes', icon: Icons.restaurant_menu, onTap: () {}),
                    Divider(),
                    OptionTile(title: 'Personalized Food Choices', icon: Icons.food_bank, onTap: () {}),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Statistics',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF404040)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StatCard(
                          icon: Icons.fastfood,
                          label: 'Calories Tracked',
                          value: '2,500',
                          color: Color(0xFF82ACBA),
                        ),
                        StatCard(
                          icon: Icons.check_circle,
                          label: 'Goals Achieved',
                          value: '5',
                          color: Color(0xFF82ACBA),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Feedback',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF404040)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '"This app has really helped me keep track of my diet and stay healthy!" - User A',
                      style: TextStyle(fontSize: 16, color: Color(0xFF404040)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '"I love the personalized food choices feature!" - User B',
                      style: TextStyle(fontSize: 16, color: Color(0xFF404040)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Color(0xFFF3F3F3),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Footer',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF404040)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Privacy Policy | Terms of Service',
                      style: TextStyle(fontSize: 14, color: Color(0xFF404040)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const OptionTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF755A5F)),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF404040)), // Semi-bold (w600)
      ),
      onTap: () => onTap(),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const StatCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 50, color: color),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Color(0xFF404040)),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF404040)),
        ),
      ],
    );
  }
}
