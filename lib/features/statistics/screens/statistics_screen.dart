import 'package:flutter/material.dart';
import 'package:simple_beautiful_checklist_exercise/features/statistics/widgets/task_counter_card.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task-Statistik"),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            TaskCounterCard(),
          ],
        ),
      ),
    );
  }
}
