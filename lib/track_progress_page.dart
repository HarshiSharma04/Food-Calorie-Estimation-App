import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrackProgressPage extends StatefulWidget {
  @override
  _TrackProgressPageState createState() => _TrackProgressPageState();
}

class _TrackProgressPageState extends State<TrackProgressPage> {
  List<String> tasks = [];
  List<bool> taskStatus = [];
  double waterIntake = 1.5; // example data: 1.5 liters out of 2 liters goal

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
      taskStatus.add(false);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      taskStatus.removeAt(index);
    });
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      taskStatus[index] = !taskStatus[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Progress'),
        backgroundColor: Color(0xFFF35E64), // Use your app's primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calorie Intake Chart
              Text(
                'Calorie Intake Chart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA), // Your custom color
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(toY: 1800, color: Colors.green)
                        ],
                        showingTooltipIndicators: [0],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(toY: 200, color: Colors.red),
                        ],
                        showingTooltipIndicators: [0],
                      ),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            switch (value.toInt()) {
                              case 0:
                                return Text('Completed');
                              case 1:
                                return Text('Left');
                              default:
                                return Text('');
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Water Intake Section
              Text(
                'Water Intake',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA), // Your custom color
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      painter: WaterBottlePainter(waterIntake),
                      size: Size(100, 200),
                    ),
                    Positioned(
                      top: 16,
                      child: Text(
                        '${waterIntake.toStringAsFixed(1)}L / 2L',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Motivational Quotes Section
              Text(
                'Motivational Quotes',
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
                  color: Color(0xFFE8F1F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      '"Drink water, stay healthy!"',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF5A9EAD),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '"Hydration is key to a better day!"',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF5A9EAD),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Tasks Section
              Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF82ACBA), // Your custom color
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a task',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          _addTask(value);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Add task using the TextField value
                    },
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF35E64),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: taskStatus[index],
                      onChanged: (bool? value) {
                        _toggleTaskStatus(index);
                      },
                    ),
                    title: Text(
                      tasks[index],
                      style: TextStyle(
                        decoration: taskStatus[index]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteTask(index);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class WaterBottlePainter extends CustomPainter {
  final double waterIntake;

  WaterBottlePainter(this.waterIntake);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    Path bottlePath = Path();
    bottlePath.moveTo(size.width * 0.3, size.height * 0.05);
    bottlePath.lineTo(size.width * 0.7, size.height * 0.05);
    bottlePath.lineTo(size.width * 0.7, size.height * 0.2);
    bottlePath.lineTo(size.width * 0.8, size.height * 0.3);
    bottlePath.lineTo(size.width * 0.8, size.height * 0.8);
    bottlePath.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.9,
      size.width * 0.7,
      size.height * 0.9,
    );
    bottlePath.lineTo(size.width * 0.3, size.height * 0.9);
    bottlePath.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.9,
      size.width * 0.2,
      size.height * 0.8,
    );
    bottlePath.lineTo(size.width * 0.2, size.height * 0.3);
    bottlePath.lineTo(size.width * 0.3, size.height * 0.2);
    bottlePath.lineTo(size.width * 0.3, size.height * 0.05);
    bottlePath.close();

    canvas.drawPath(bottlePath, Paint()..color = Colors.grey.withOpacity(0.3));

    double filledHeight = size.height * 0.8 * (waterIntake / 2.0);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.2, size.height * 0.9 - filledHeight, size.width * 0.6, filledHeight),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
