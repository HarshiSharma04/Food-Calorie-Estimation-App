import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrackProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Progress'),
        backgroundColor: Color(0xFF755A5F),
      ),
      body: Container(
        color: Color(0xFFEDE7DB),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF404040)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Calorie Intake Over Time',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true, reservedSize: 22, getTitlesWidget: bottomTitleWidgets),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true, reservedSize: 28, getTitlesWidget: leftTitleWidgets),
                                ),
                              ),
                              borderData: FlBorderData(show: true),
                              minX: 0,
                              maxX: 4,
                              minY: 0,
                              maxY: 2500,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(0, 1500),
                                    FlSpot(1, 1800),
                                    FlSpot(2, 2000),
                                    FlSpot(3, 2200),
                                    FlSpot(4, 1900),
                                  ],
                                  isCurved: true,
                                  barWidth: 5,
                                  color: Colors.blue,
                                  belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Daily Intake Summary',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _buildSummaryRow('Calories', '2000 kcal'),
                      _buildSummaryRow('Protein', '75 g'),
                      _buildSummaryRow('Carbs', '250 g'),
                      _buildSummaryRow('Fats', '80 g'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String nutrient, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nutrient,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('June 1', style: style);
        break;
      case 1:
        text = Text('June 2', style: style);
        break;
      case 2:
        text = Text('June 3', style: style);
        break;
      case 3:
        text = Text('June 4', style: style);
        break;
      case 4:
        text = Text('June 5', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('0', style: style);
        break;
      case 500:
        text = Text('500', style: style);
        break;
      case 1000:
        text = Text('1000', style: style);
        break;
      case 1500:
        text = Text('1500', style: style);
        break;
      case 2000:
        text = Text('2000', style: style);
        break;
      case 2500:
        text = Text('2500', style: style);
        break;
      default:
        return Container();
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }
}
