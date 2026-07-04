import 'dart:convert';

import '../../../core/storage/app_database.dart';
import '../../setup/data/models/setup_models.dart';

class FormSchemaCache {
  const FormSchemaCache({required AppDatabase database}) : _db = database;
  final AppDatabase _db;

  Future<FormSchemaResponse?> get(String hotelId) async {
    final row = await (_db.select(_db.cachedFormSchemas)
          ..where((t) => t.hotelId.equals(hotelId)))
        .getSingleOrNull();

    if (row == null) return null;
    final json = jsonDecode(row.jsonBlob) as Map<String, dynamic>;
    return FormSchemaResponse.fromJson(json);
  }

  Future<void> put(String hotelId, FormSchemaResponse schema) async {
    final blob = jsonEncode(schema.toJson());
    await _db.into(_db.cachedFormSchemas).insertOnConflictUpdate(
          CachedFormSchemasCompanion.insert(
            hotelId: hotelId,
            jsonBlob: blob,
          ),
        );
  }

  Future<List<String>> getAllHotelIds() async {
    final rows = await _db.select(_db.cachedFormSchemas).get();
    return rows.map((r) => r.hotelId).toList();
  }

  Future<void> delete(String hotelId) async {
    await (_db.delete(_db.cachedFormSchemas)
          ..where((t) => t.hotelId.equals(hotelId)))
        .go();
  }

  Future<void> clearAll() async {
    await _db.delete(_db.cachedFormSchemas).go();
  }
}
