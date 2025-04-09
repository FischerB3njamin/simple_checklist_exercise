import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_beautiful_checklist_exercise/features/task_list/widgets/empty_content.dart';
import 'package:simple_beautiful_checklist_exercise/features/task_list/widgets/item_list.dart';
import 'package:simple_beautiful_checklist_exercise/shared/todo_provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({
    super.key,
  });

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meine Checkliste'),
      ),
      body: todoProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: todoProvider.items.isEmpty
                      ? const EmptyContent()
                      : const ItemList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Task Hinzufügen',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () =>
                            todoProvider.addItem(controller.text, controller),
                      ),
                    ),
                    onSubmitted: (value) =>
                        todoProvider.addItem(value, controller),
                  ),
                ),
              ],
            ),
    );
  }
}
