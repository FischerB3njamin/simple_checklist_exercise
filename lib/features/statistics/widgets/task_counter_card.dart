import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_beautiful_checklist_exercise/shared/todo_provider.dart';

class TaskCounterCard extends StatelessWidget {
  const TaskCounterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color.fromARGB(26, 222, 103, 255),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "${context.watch<TodoProvider>().items.length}",
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  "Anzahl der offenen Tasks",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
