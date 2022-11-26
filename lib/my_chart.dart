import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyChart extends StatelessWidget {
  // const MyChart({Key? key}) : super(key: key);
  var work, self, social, sleep, dev, spirit;
  MyChart(
    this.work,
    this.self,
    this.social,
    this.sleep,
    this.dev,
    this.spirit,
  );

  Map<String, double> dataMap = {
    "work": 31.7,
    "self development": 10,
    "social": 10,
    "sleeping": 31.3,
    "my self": 8,
    "spiritual": 10,
  };

  final colorList = [
    Colors.purple,
    Colors.amber,
    Colors.blue,
    Colors.lightGreen,
    Colors.red,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 2.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      // ringStrokeWidth: 50,
      centerText: "HYBRID",
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
