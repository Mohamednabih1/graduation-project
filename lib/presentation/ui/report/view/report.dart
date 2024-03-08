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
          children: const [
            Header(name: "Report"),
            Text("report body"),
            Text(
              'Statistics Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("sad"),
            // SizedBox(
            //   height: screenHeight * 0.2,
            //   width: double.infinity,
            //   child: SimpleBarChart.withSampleData(),
            // ),
            CatagoriesOld(),
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
    return const Scaffold(
      body: CatagoriesOld(),
      // getBody(
      //   screenWidth,
      //   screenHeight,
      // ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Catagories()],
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
      // OrdinalSales('Saturday', 33),
      // OrdinalSales('Sunday', 80),
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

class Catagories extends StatelessWidget {
  const Catagories({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.all(10),
        //     width: double.infinity,
        // color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.arrow_back, color: Colors.black),
            Icon(Icons.menu_sharp, color: Colors.black),
          ],
        ),
      ),
      Image.asset('assets/images/Picture3.jpg'),
      const Text('Yoga Body Stretching'),
      Container(
        margin: const EdgeInsets.only(left: 30, top: 20),
        width: 50,
        height: 50,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF93469F)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Beginner',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF93469F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '10 minutes',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF93469F)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '10 workout',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 3.01,
              height: 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    width: 0.5,
                  ),
                ),
              ),
            ),

            /* Frame 186 */
            SizedBox(
              width: 331,
              height: 17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Workout Activity',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Atkinson Hyperlegible',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.01,
                    ),
                  ),
                  const SizedBox(width: 20), // Adjust the spacing as needed
                  const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF93469F),
                      fontFamily: 'Atkinson Hyperlegible',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.01,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 200,
                      height: 130,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Picture1.png'),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 136,
                    top: 23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 80,
                          height: 25,
                          child: Text(
                            'Warrior 1',
                            style: TextStyle(
                              //      fontFamily: 'Atkinson Hyperlegible',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 74,
                          height: 17,
                          child: Text(
                            '30 seconds',
                            style: TextStyle(
                              fontFamily: 'Atkinson Hyperlegible',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ])));
  }
}

class CatagoriesOld extends StatelessWidget {
  const CatagoriesOld({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Text(
                    'Workout Levels',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.menu_open, color: Colors.black),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF93469F)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Beginner',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF93469F),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Intermediate',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF93469F)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Advanced',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: 270,
                height: 135,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset('assets/images/Picture1.jpg'),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Squat Movement Exercise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: 270,
                height: 135,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset('assets/images/Picture2.jpg'),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Full Body Stretching',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: 270,
                height: 135,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset('assets/images/Picture3.jpg'),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Yoga Movement Exercise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: 270,
                height: 135,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset('assets/images/Picture4.jpg'),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Abdominal Exercise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                        ],
                      ),
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
