import 'package:todolist/shared/database/app_database.dart';

class DatabaseProvider {
  static AppDatabase _appDatabase;

  AppDatabase get appDatabase => _appDatabase;

  bool get isInitialized => _appDatabase != null;

  Future<void> init() async {
    if (!isInitialized) {
      _appDatabase =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    }
  }
}
