import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/dashboard_page/model/bar_graph_model.dart';
import 'package:gradproject/presentation/ui/dashboard_page/model/graph_model.dart';

class BarGraphData {
  final data = [
    const BarGraphModel(

        label: "Activity Level",
        color: Color(0xFFFEB95A),
        graph: [
          GraphModel(x: 0, y: 3),
          GraphModel(x: 1, y: 10),
          GraphModel(x: 2, y: 0),
          GraphModel(x: 3, y: 5),
          GraphModel(x: 4, y: 1),
          GraphModel(x: 5, y: 6),
        ]),
    const BarGraphModel(label: "WarmUp log", color: Color.fromARGB(255, 255, 157, 244), 
      graph: [
      GraphModel(x: 0, y: 0),
      GraphModel(x: 1, y: 4),
      GraphModel(x: 2, y: 1),
      GraphModel(x: 3, y: 2),
      GraphModel(x: 4, y: 0),
      GraphModel(x: 5, y: 3),
    ]),
    const BarGraphModel(
        label: " Injuries",
        color: Color(0xFF20AEF3),
        graph: [
          GraphModel(x: 0, y: 0),
          GraphModel(x: 1, y: 1),
          GraphModel(x: 2, y: 3),
          GraphModel(x: 3, y: 2),
          GraphModel(x: 4, y: 0),
          GraphModel(x: 5, y: 1),
        ]),
  ];

  final label = ['M', 'T', 'W', 'T', 'F', 'S'];
}