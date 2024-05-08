import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/dashboard_page/data/summary_details.dart';
import 'package:gradproject/presentation/ui/dashboard_page/widgets/pie_chart_widget.dart';
import 'package:gradproject/presentation/ui/dashboard_page/widgets/scheduled_widget.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF21222D),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             SizedBox(height: 20),
             Chart(),
             Text(
              'Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
             SizedBox(height: 16),
             SummaryDetails(),
             SizedBox(height: 40),
            Scheduled(),
          ],
        ),
      ),
    );
  }
}