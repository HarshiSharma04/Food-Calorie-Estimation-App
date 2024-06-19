import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrackProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Progress'),
        backgroundColor: Color(0xFFEDE7DB),
        iconTheme: IconThemeData(color: Color(0xFF755A5F)), // Ensuring the icons are visible
        titleTextStyle: TextStyle(color: Color(0xFF755A5F), fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Progress',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF404040),
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
                        'Calorie Intake Over Time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF755A5F),
                        ),
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
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 22,
                                    getTitlesWidget: bottomTitleWidgets,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 28,
                                    getTitlesWidget: leftTitleWidgets,
                                  ),
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
                                  color: Color(0xFF82ACBA),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    color: Color(0xFF82ACBA).withOpacity(0.3),
                                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Daily Intake Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF755A5F),
                        ),
                      ),
                      SizedBox(height: 10),
                      Table(
                        border: TableBorder.all(color: Colors.grey),
                        children: [
                          _buildTableRow('Nutrient', 'Amount', isHeader: true),
                          _buildTableRow('Calories', '2000 kcal'),
                          _buildTableRow('Protein', '75 g'),
                          _buildTableRow('Carbs', '250 g'),
                          _buildTableRow('Fats', '80 g'),
                        ],
                      ),
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

  TableRow _buildTableRow(String nutrient, String amount, {bool isHeader = false}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            nutrient,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Color(0xFF755A5F) : Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Color(0xFF755A5F) : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Color(0xFF755A5F),
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
      color: Color(0xFF755A5F),
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
