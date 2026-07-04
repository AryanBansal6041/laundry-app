import 'secure_storage.dart';
import 'app_database.dart';

class StorageService {
  StorageService({
    required this.secureStorage,
    required this.database,
  });

  final SecureStorage secureStorage;
  final AppDatabase database;

  Future<void> clearAll() async {
    await secureStorage.clearAll();
    await database.delete(database.pendingChallans).go();
    await database.delete(database.cachedFormSchemas).go();
  }
}
