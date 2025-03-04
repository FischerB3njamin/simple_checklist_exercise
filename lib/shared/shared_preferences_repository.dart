import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  SharedPreferencesAsync prefs = SharedPreferencesAsync();

  @override
  Future<void> addItem(String item) async {
    List<String> tasks = await prefs.getStringList("tasks") ?? [];
    tasks.add(item);
    prefs.setStringList("tasks", tasks);
  }

  @override
  Future<void> deleteItem(int index) async {
    List<String> tasks = await prefs.getStringList("tasks") ?? [];
    tasks.removeAt(index);
    prefs.setStringList('tasks', tasks);
  }

  @override
  Future<void> editItem(int index, String newItem) async {
    List<String> tasks = await prefs.getStringList('tasks') ?? [];
    tasks[index] = newItem;
    prefs.setStringList("tasks", tasks);
  }

  @override
  Future<List<String>> getItems() async {
    return await prefs.getStringList('tasks') ?? [];
  }

  @override
  Future<int> get itemCount async =>
      (await prefs.getStringList('tasks') ?? []).length;
}
