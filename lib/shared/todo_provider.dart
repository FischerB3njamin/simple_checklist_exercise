import 'package:flutter/material.dart';
import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';
import 'package:simple_beautiful_checklist_exercise/shared/shared_preferences_repository.dart';

class TodoProvider extends ChangeNotifier {
  bool isLoading = true;
  late List<String> _items;
  final DatabaseRepository _repo = SharedPreferencesRepository();

  TodoProvider() {
    _loadData();
  }

  List<String> get items => _items;

  _loadData() async {
    _items = await _repo.getItems();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addItem(String item, TextEditingController controller) async {
    if (item.isNotEmpty) {
      await _repo.addItem(item);
      controller.clear();
      _loadData();
    }
  }

  Future<void> deleteItem(int index) async {
    await _repo.deleteItem(index);
    _loadData();
  }

  Future<void> editItem(String item, String newItem) async {
    await _repo.editItem(_items.indexOf(item), newItem);
    _loadData();
  }
}
