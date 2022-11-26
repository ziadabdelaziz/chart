import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final parts = [
    {"title": "work", "cont": TextEditingController()},
    {"title": "my self", "cont": TextEditingController()},
    {"title": "social", "cont": TextEditingController()},
    {"title": "sleeping", "cont": TextEditingController()},
    {"title": "self development", "cont": TextEditingController()},
    {"title": "spiritual", "cont": TextEditingController()},
  ];

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

  edit(controller, text) {
    setState(() {
      controller = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chart"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                padding: EdgeInsets.all(15),
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 3 / 1.5,
                children: parts.map((e) {
                  return TextField(
                    controller: e["cont"] as TextEditingController,
                    onSubmitted: (text) {
                      setState(() {
                        dataMap[e["title"] as String] = text as double;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: e["title"] as String,
                    ),
                  );
                }).toList(),
              ),
            ),
            PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 2.3,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              // ringStrokeWidth: 32,
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
                  chartValueStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              // gradientList: ---To add gradient colors---
              // emptyColorGradient: ---Empty Color gradient---
            ),
          ],
        ),
      ),
    );
  }
}
