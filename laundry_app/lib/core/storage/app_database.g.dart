// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PendingChallansTable extends PendingChallans
    with TableInfo<$PendingChallansTable, PendingChallan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingChallansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _challanTypeMeta = const VerificationMeta(
    'challanType',
  );
  @override
  late final GeneratedColumn<String> challanType = GeneratedColumn<String>(
    'challan_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    challanType,
    payloadJson,
    createdAt,
    retryCount,
    status,
    errorMessage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_challans';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingChallan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('challan_type')) {
      context.handle(
        _challanTypeMeta,
        challanType.isAcceptableOrUnknown(
          data['challan_type']!,
          _challanTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_challanTypeMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingChallan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingChallan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      challanType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}challan_type'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
    );
  }

  @override
  $PendingChallansTable createAlias(String alias) {
    return $PendingChallansTable(attachedDatabase, alias);
  }
}

class PendingChallan extends DataClass implements Insertable<PendingChallan> {
  final int id;
  final String challanType;
  final String payloadJson;
  final DateTime createdAt;
  final int retryCount;
  final String status;
  final String? errorMessage;
  const PendingChallan({
    required this.id,
    required this.challanType,
    required this.payloadJson,
    required this.createdAt,
    required this.retryCount,
    required this.status,
    this.errorMessage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['challan_type'] = Variable<String>(challanType);
    map['payload_json'] = Variable<String>(payloadJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    return map;
  }

  PendingChallansCompanion toCompanion(bool nullToAbsent) {
    return PendingChallansCompanion(
      id: Value(id),
      challanType: Value(challanType),
      payloadJson: Value(payloadJson),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
      status: Value(status),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
    );
  }

  factory PendingChallan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingChallan(
      id: serializer.fromJson<int>(json['id']),
      challanType: serializer.fromJson<String>(json['challanType']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      status: serializer.fromJson<String>(json['status']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'challanType': serializer.toJson<String>(challanType),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'status': serializer.toJson<String>(status),
      'errorMessage': serializer.toJson<String?>(errorMessage),
    };
  }

  PendingChallan copyWith({
    int? id,
    String? challanType,
    String? payloadJson,
    DateTime? createdAt,
    int? retryCount,
    String? status,
    Value<String?> errorMessage = const Value.absent(),
  }) => PendingChallan(
    id: id ?? this.id,
    challanType: challanType ?? this.challanType,
    payloadJson: payloadJson ?? this.payloadJson,
    createdAt: createdAt ?? this.createdAt,
    retryCount: retryCount ?? this.retryCount,
    status: status ?? this.status,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
  );
  PendingChallan copyWithCompanion(PendingChallansCompanion data) {
    return PendingChallan(
      id: data.id.present ? data.id.value : this.id,
      challanType: data.challanType.present
          ? data.challanType.value
          : this.challanType,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      status: data.status.present ? data.status.value : this.status,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingChallan(')
          ..write('id: $id, ')
          ..write('challanType: $challanType, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    challanType,
    payloadJson,
    createdAt,
    retryCount,
    status,
    errorMessage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingChallan &&
          other.id == this.id &&
          other.challanType == this.challanType &&
          other.payloadJson == this.payloadJson &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount &&
          other.status == this.status &&
          other.errorMessage == this.errorMessage);
}

class PendingChallansCompanion extends UpdateCompanion<PendingChallan> {
  final Value<int> id;
  final Value<String> challanType;
  final Value<String> payloadJson;
  final Value<DateTime> createdAt;
  final Value<int> retryCount;
  final Value<String> status;
  final Value<String?> errorMessage;
  const PendingChallansCompanion({
    this.id = const Value.absent(),
    this.challanType = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
  });
  PendingChallansCompanion.insert({
    this.id = const Value.absent(),
    required String challanType,
    required String payloadJson,
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
  }) : challanType = Value(challanType),
       payloadJson = Value(payloadJson);
  static Insertable<PendingChallan> custom({
    Expression<int>? id,
    Expression<String>? challanType,
    Expression<String>? payloadJson,
    Expression<DateTime>? createdAt,
    Expression<int>? retryCount,
    Expression<String>? status,
    Expression<String>? errorMessage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (challanType != null) 'challan_type': challanType,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (status != null) 'status': status,
      if (errorMessage != null) 'error_message': errorMessage,
    });
  }

  PendingChallansCompanion copyWith({
    Value<int>? id,
    Value<String>? challanType,
    Value<String>? payloadJson,
    Value<DateTime>? createdAt,
    Value<int>? retryCount,
    Value<String>? status,
    Value<String?>? errorMessage,
  }) {
    return PendingChallansCompanion(
      id: id ?? this.id,
      challanType: challanType ?? this.challanType,
      payloadJson: payloadJson ?? this.payloadJson,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (challanType.present) {
      map['challan_type'] = Variable<String>(challanType.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingChallansCompanion(')
          ..write('id: $id, ')
          ..write('challanType: $challanType, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }
}

class $CachedFormSchemasTable extends CachedFormSchemas
    with TableInfo<$CachedFormSchemasTable, CachedFormSchema> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedFormSchemasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _hotelIdMeta = const VerificationMeta(
    'hotelId',
  );
  @override
  late final GeneratedColumn<String> hotelId = GeneratedColumn<String>(
    'hotel_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jsonBlobMeta = const VerificationMeta(
    'jsonBlob',
  );
  @override
  late final GeneratedColumn<String> jsonBlob = GeneratedColumn<String>(
    'json_blob',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [hotelId, jsonBlob, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_form_schemas';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedFormSchema> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hotel_id')) {
      context.handle(
        _hotelIdMeta,
        hotelId.isAcceptableOrUnknown(data['hotel_id']!, _hotelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_hotelIdMeta);
    }
    if (data.containsKey('json_blob')) {
      context.handle(
        _jsonBlobMeta,
        jsonBlob.isAcceptableOrUnknown(data['json_blob']!, _jsonBlobMeta),
      );
    } else if (isInserting) {
      context.missing(_jsonBlobMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hotelId};
  @override
  CachedFormSchema map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedFormSchema(
      hotelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hotel_id'],
      )!,
      jsonBlob: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json_blob'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedFormSchemasTable createAlias(String alias) {
    return $CachedFormSchemasTable(attachedDatabase, alias);
  }
}

class CachedFormSchema extends DataClass
    implements Insertable<CachedFormSchema> {
  final String hotelId;
  final String jsonBlob;
  final DateTime updatedAt;
  const CachedFormSchema({
    required this.hotelId,
    required this.jsonBlob,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hotel_id'] = Variable<String>(hotelId);
    map['json_blob'] = Variable<String>(jsonBlob);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedFormSchemasCompanion toCompanion(bool nullToAbsent) {
    return CachedFormSchemasCompanion(
      hotelId: Value(hotelId),
      jsonBlob: Value(jsonBlob),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedFormSchema.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedFormSchema(
      hotelId: serializer.fromJson<String>(json['hotelId']),
      jsonBlob: serializer.fromJson<String>(json['jsonBlob']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hotelId': serializer.toJson<String>(hotelId),
      'jsonBlob': serializer.toJson<String>(jsonBlob),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedFormSchema copyWith({
    String? hotelId,
    String? jsonBlob,
    DateTime? updatedAt,
  }) => CachedFormSchema(
    hotelId: hotelId ?? this.hotelId,
    jsonBlob: jsonBlob ?? this.jsonBlob,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedFormSchema copyWithCompanion(CachedFormSchemasCompanion data) {
    return CachedFormSchema(
      hotelId: data.hotelId.present ? data.hotelId.value : this.hotelId,
      jsonBlob: data.jsonBlob.present ? data.jsonBlob.value : this.jsonBlob,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedFormSchema(')
          ..write('hotelId: $hotelId, ')
          ..write('jsonBlob: $jsonBlob, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(hotelId, jsonBlob, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedFormSchema &&
          other.hotelId == this.hotelId &&
          other.jsonBlob == this.jsonBlob &&
          other.updatedAt == this.updatedAt);
}

class CachedFormSchemasCompanion extends UpdateCompanion<CachedFormSchema> {
  final Value<String> hotelId;
  final Value<String> jsonBlob;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedFormSchemasCompanion({
    this.hotelId = const Value.absent(),
    this.jsonBlob = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedFormSchemasCompanion.insert({
    required String hotelId,
    required String jsonBlob,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : hotelId = Value(hotelId),
       jsonBlob = Value(jsonBlob);
  static Insertable<CachedFormSchema> custom({
    Expression<String>? hotelId,
    Expression<String>? jsonBlob,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (hotelId != null) 'hotel_id': hotelId,
      if (jsonBlob != null) 'json_blob': jsonBlob,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedFormSchemasCompanion copyWith({
    Value<String>? hotelId,
    Value<String>? jsonBlob,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedFormSchemasCompanion(
      hotelId: hotelId ?? this.hotelId,
      jsonBlob: jsonBlob ?? this.jsonBlob,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (hotelId.present) {
      map['hotel_id'] = Variable<String>(hotelId.value);
    }
    if (jsonBlob.present) {
      map['json_blob'] = Variable<String>(jsonBlob.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedFormSchemasCompanion(')
          ..write('hotelId: $hotelId, ')
          ..write('jsonBlob: $jsonBlob, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PendingChallansTable pendingChallans = $PendingChallansTable(
    this,
  );
  late final $CachedFormSchemasTable cachedFormSchemas =
      $CachedFormSchemasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pendingChallans,
    cachedFormSchemas,
  ];
}

typedef $$PendingChallansTableCreateCompanionBuilder =
    PendingChallansCompanion Function({
      Value<int> id,
      required String challanType,
      required String payloadJson,
      Value<DateTime> createdAt,
      Value<int> retryCount,
      Value<String> status,
      Value<String?> errorMessage,
    });
typedef $$PendingChallansTableUpdateCompanionBuilder =
    PendingChallansCompanion Function({
      Value<int> id,
      Value<String> challanType,
      Value<String> payloadJson,
      Value<DateTime> createdAt,
      Value<int> retryCount,
      Value<String> status,
      Value<String?> errorMessage,
    });

class $$PendingChallansTableFilterComposer
    extends Composer<_$AppDatabase, $PendingChallansTable> {
  $$PendingChallansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get challanType => $composableBuilder(
    column: $table.challanType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingChallansTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingChallansTable> {
  $$PendingChallansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get challanType => $composableBuilder(
    column: $table.challanType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingChallansTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingChallansTable> {
  $$PendingChallansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get challanType => $composableBuilder(
    column: $table.challanType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );
}

class $$PendingChallansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingChallansTable,
          PendingChallan,
          $$PendingChallansTableFilterComposer,
          $$PendingChallansTableOrderingComposer,
          $$PendingChallansTableAnnotationComposer,
          $$PendingChallansTableCreateCompanionBuilder,
          $$PendingChallansTableUpdateCompanionBuilder,
          (
            PendingChallan,
            BaseReferences<
              _$AppDatabase,
              $PendingChallansTable,
              PendingChallan
            >,
          ),
          PendingChallan,
          PrefetchHooks Function()
        > {
  $$PendingChallansTableTableManager(
    _$AppDatabase db,
    $PendingChallansTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingChallansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingChallansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingChallansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> challanType = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
              }) => PendingChallansCompanion(
                id: id,
                challanType: challanType,
                payloadJson: payloadJson,
                createdAt: createdAt,
                retryCount: retryCount,
                status: status,
                errorMessage: errorMessage,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String challanType,
                required String payloadJson,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
              }) => PendingChallansCompanion.insert(
                id: id,
                challanType: challanType,
                payloadJson: payloadJson,
                createdAt: createdAt,
                retryCount: retryCount,
                status: status,
                errorMessage: errorMessage,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingChallansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingChallansTable,
      PendingChallan,
      $$PendingChallansTableFilterComposer,
      $$PendingChallansTableOrderingComposer,
      $$PendingChallansTableAnnotationComposer,
      $$PendingChallansTableCreateCompanionBuilder,
      $$PendingChallansTableUpdateCompanionBuilder,
      (
        PendingChallan,
        BaseReferences<_$AppDatabase, $PendingChallansTable, PendingChallan>,
      ),
      PendingChallan,
      PrefetchHooks Function()
    >;
typedef $$CachedFormSchemasTableCreateCompanionBuilder =
    CachedFormSchemasCompanion Function({
      required String hotelId,
      required String jsonBlob,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$CachedFormSchemasTableUpdateCompanionBuilder =
    CachedFormSchemasCompanion Function({
      Value<String> hotelId,
      Value<String> jsonBlob,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CachedFormSchemasTableFilterComposer
    extends Composer<_$AppDatabase, $CachedFormSchemasTable> {
  $$CachedFormSchemasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get hotelId => $composableBuilder(
    column: $table.hotelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsonBlob => $composableBuilder(
    column: $table.jsonBlob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedFormSchemasTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedFormSchemasTable> {
  $$CachedFormSchemasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get hotelId => $composableBuilder(
    column: $table.hotelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jsonBlob => $composableBuilder(
    column: $table.jsonBlob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedFormSchemasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedFormSchemasTable> {
  $$CachedFormSchemasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get hotelId =>
      $composableBuilder(column: $table.hotelId, builder: (column) => column);

  GeneratedColumn<String> get jsonBlob =>
      $composableBuilder(column: $table.jsonBlob, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedFormSchemasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedFormSchemasTable,
          CachedFormSchema,
          $$CachedFormSchemasTableFilterComposer,
          $$CachedFormSchemasTableOrderingComposer,
          $$CachedFormSchemasTableAnnotationComposer,
          $$CachedFormSchemasTableCreateCompanionBuilder,
          $$CachedFormSchemasTableUpdateCompanionBuilder,
          (
            CachedFormSchema,
            BaseReferences<
              _$AppDatabase,
              $CachedFormSchemasTable,
              CachedFormSchema
            >,
          ),
          CachedFormSchema,
          PrefetchHooks Function()
        > {
  $$CachedFormSchemasTableTableManager(
    _$AppDatabase db,
    $CachedFormSchemasTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedFormSchemasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedFormSchemasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedFormSchemasTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> hotelId = const Value.absent(),
                Value<String> jsonBlob = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedFormSchemasCompanion(
                hotelId: hotelId,
                jsonBlob: jsonBlob,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String hotelId,
                required String jsonBlob,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedFormSchemasCompanion.insert(
                hotelId: hotelId,
                jsonBlob: jsonBlob,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedFormSchemasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedFormSchemasTable,
      CachedFormSchema,
      $$CachedFormSchemasTableFilterComposer,
      $$CachedFormSchemasTableOrderingComposer,
      $$CachedFormSchemasTableAnnotationComposer,
      $$CachedFormSchemasTableCreateCompanionBuilder,
      $$CachedFormSchemasTableUpdateCompanionBuilder,
      (
        CachedFormSchema,
        BaseReferences<
          _$AppDatabase,
          $CachedFormSchemasTable,
          CachedFormSchema
        >,
      ),
      CachedFormSchema,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PendingChallansTableTableManager get pendingChallans =>
      $$PendingChallansTableTableManager(_db, _db.pendingChallans);
  $$CachedFormSchemasTableTableManager get cachedFormSchemas =>
      $$CachedFormSchemasTableTableManager(_db, _db.cachedFormSchemas);
}
