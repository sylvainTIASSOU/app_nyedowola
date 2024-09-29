import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ServicesChart extends StatelessWidget {
  final List<double> monthlyServices;

  ServicesChart({required this.monthlyServices});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 38,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('Jan');
                    case 1:
                      return const Text('Feb');
                    case 2:
                      return const Text('Mar');
                    case 3:
                      return const Text('Apr');
                    case 4:
                      return const Text('May');
                    case 5:
                      return const Text('Jun');
                    case 6:
                      return const Text('Jul');
                    case 7:
                      return const Text('Aug');
                    case 8:
                      return const Text('Sep');
                    case 9:
                      return const Text('Oct');
                    case 10:
                      return const Text('Nov');
                    case 11:
                      return const Text('Dec');
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: monthlyServices.reduce((a, b) => a > b ? a : b) + 5,
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(monthlyServices.length, (index) =>
                  FlSpot(index.toDouble(), monthlyServices[index])),
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
              aboveBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
