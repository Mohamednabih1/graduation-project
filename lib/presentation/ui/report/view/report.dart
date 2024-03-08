import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/report/view_model/report_model.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReportViewModel>(
      create: (context) => ReportViewModel(),
      builder: (context, child) {
        return const ReportContent();
      },
    );
  }
}

class ReportContent extends StatefulWidget {
  const ReportContent({super.key});

  @override
  State<ReportContent> createState() => _ReportContentState();
}

class _ReportContentState extends State<ReportContent> {
  late final ReportViewModel _ReportViewModel;

  void _bind(BuildContext context) {
    _ReportViewModel = Provider.of<ReportViewModel>(context, listen: false);
    _ReportViewModel.start();
  }

  // AppBar get appBar {
  //   return AppBar(title: const Text("Report"));
  // }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  Widget getBody(screenWidth, screenHeight) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Header(name: "Report"),
            const Text("report body"),
            const Text(
              'Statistics Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              width: double.infinity,
              child: SimpleBarChart.withSampleData(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      body: getBody(
        screenWidth,
        screenHeight,
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  const SimpleBarChart(this.seriesList, {super.key, required this.animate});

  factory SimpleBarChart.withSampleData() {
    return SimpleBarChart(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: charts.PieChart(
        seriesList,
        animate: animate,
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('Monday', 90),
      OrdinalSales('Tuesday', 25),
      OrdinalSales('Wednesday', 100),
      OrdinalSales('Thursday', 75),
      OrdinalSales('Friday', 50),
      OrdinalSales('Saturday', 33),
      OrdinalSales('Sunday', 80),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.day,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String day;
  final int sales;

  OrdinalSales(this.day, this.sales);
}
