import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';

class GraphTile extends StatelessWidget {
  const GraphTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'SAR ',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15),
                      ),
                      Text(
                        ' 2,78,000.00',
                        style:
                            TextStyle(color: Colors.grey.shade50, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Revenue',
                        style:
                            TextStyle(color: Colors.grey.shade50, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    const Text(
                      '+21% ',
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    Text(
                      'than last month',
                      style:
                          TextStyle(color: Colors.grey.shade50, fontSize: 15),
                    ),
                  ],
                ),
              ]),
              Expanded(
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 1),
                          const FlSpot(1, 3),
                          const FlSpot(2, 1.5),
                          const FlSpot(3, 4),
                          const FlSpot(4, 2),
                          const FlSpot(5, 3.5),
                          const FlSpot(6, 2.5),
                          const FlSpot(7, 4.5),
                          const FlSpot(8, 3.5),
                          const FlSpot(9, 5),
                        ],
                        isCurved: true,
                        curveSmoothness: 0.4,
                        color: Colors.blue,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    lineTouchData: const LineTouchData(enabled: true),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'September 2023',
                    style: TextStyle(color: white, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
