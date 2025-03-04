import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  @override
  Future<void> addItem(String item) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(int index) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<void> editItem(int index, String newItem) {
    // TODO: implement editItem
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  // TODO: implement itemCount
  Future<int> get itemCount => throw UnimplementedError();
}
