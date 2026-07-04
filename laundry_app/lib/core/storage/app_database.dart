import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class PendingChallans extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get challanType => text()();
  TextColumn get payloadJson => text()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get status =>
      text().withDefault(const Constant('pending'))();
  TextColumn get errorMessage => text().nullable()();
}

class CachedFormSchemas extends Table {
  TextColumn get hotelId => text()();
  TextColumn get jsonBlob => text()();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {hotelId};
}

@DriftDatabase(tables: [PendingChallans, CachedFormSchemas])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(
          executor ??
              driftDatabase(
                name: 'laundrotrack',
                web: DriftWebOptions(
                  sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                  driftWorker: Uri.parse('drift_worker.js'),
                ),
              ),
        );

  @override
  int get schemaVersion => 1;
}
