import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_beautiful_checklist_exercise/features/task_list/widgets/edit_todo_dialog.dart';
import 'package:simple_beautiful_checklist_exercise/shared/todo_provider.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    return ListView.separated(
      itemCount: todoProvider.items.length,
      itemBuilder: (context, index) {
        final item = todoProvider.items[index];
        return ListTile(
          title: Text(item),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return EditTodoDialog(item: item);
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => todoProvider.deleteItem(index),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
        color: Colors.white10,
      ),
    );
  }
}
