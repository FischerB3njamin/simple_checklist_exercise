import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_beautiful_checklist_exercise/shared/todo_provider.dart';

class EditTodoDialog extends StatelessWidget {
  const EditTodoDialog({
    super.key,
    required this.item,
  });

  final String item;

  @override
  Widget build(BuildContext context) {
    TextEditingController editController = TextEditingController(text: item);

    return AlertDialog(
      title: const Text('Task bearbeiten'),
      content: TextField(
        autofocus: true,
        controller: editController,
        decoration: const InputDecoration(hintText: "Task bearbeiten"),
      ),
      actions: [
        TextButton(
          child: const Text('Abbrechen'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Consumer<TodoProvider>(
          builder: (context, todoProvider, _) => TextButton(
            child: const Text('Speichern'),
            onPressed: () async {
              await todoProvider.editItem(item, editController.text);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        )
      ],
    );
  }
}
