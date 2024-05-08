import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/dashboard_page/util/responsive.dart';
import 'package:gradproject/presentation/ui/dashboard_page/widgets/activity_details_card.dart';
import 'package:gradproject/presentation/ui/dashboard_page/widgets/bar_graph_widget.dart';
import 'package:gradproject/presentation/ui/dashboard_page/widgets/line_chart_card.dart';
import 'package:gradproject/presentation/ui/dashboard_page/widgets/summary_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const ActivityDetailsCard(),
            const SizedBox(height: 18),
            const LineChartCard(),
            const SizedBox(height: 18),
            const BarGraphCard(),
            const SizedBox(height: 18),
            if (Responsive.isTablet(context)) const SummaryWidget(),
          ],
        ),
      ),
    );
  }
}