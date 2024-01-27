import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime startDate;
  final Map<DateTime, int> datasets;
  const MyHeatMap({super.key, required this.startDate, required this.datasets});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: datasets,
      colorMode: ColorMode.color,
      showColorTip: false,
      size: 18,
      defaultColor: Theme.of(context).colorScheme.primary,
      colorsets: {
        0: Theme.of(context).colorScheme.primary,
        1: Colors.green.shade100,
        2: Colors.green.shade300,
        3: Colors.green.shade400,
        4: Colors.green.shade500,
        5: Colors.green.shade700,
      },
      startDate: startDate,
      endDate: DateTime.now(),
      scrollable: true,
    );
  }
}
