import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum UserRole {
  @JsonValue('SUPER_ADMIN')
  superAdmin,
  @JsonValue('HOTEL_ADMIN')
  hotelAdmin,
  @JsonValue('SERVICE_AGENT')
  serviceAgent;

  String toJson() => _$UserRoleEnumMap[this]!;

  static UserRole fromJson(String json) =>
      _$UserRoleEnumMap.entries
          .firstWhere((e) => e.value == json,
              orElse: () => throw ArgumentError('Unknown UserRole: $json'))
          .key;
}

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'SUPER_ADMIN',
  UserRole.hotelAdmin: 'HOTEL_ADMIN',
  UserRole.serviceAgent: 'SERVICE_AGENT',
};

@JsonEnum(alwaysCreate: true)
enum BillingType {
  @JsonValue('WEIGHT')
  weight,
  @JsonValue('PIECE')
  piece;

  String toJson() => _$BillingTypeEnumMap[this]!;

  static BillingType fromJson(String json) =>
      _$BillingTypeEnumMap.entries
          .firstWhere((e) => e.value == json,
              orElse: () => throw ArgumentError('Unknown BillingType: $json'))
          .key;
}

const _$BillingTypeEnumMap = {
  BillingType.weight: 'WEIGHT',
  BillingType.piece: 'PIECE',
};

@JsonEnum(alwaysCreate: true)
enum WeightSource {
  @JsonValue('SOILED')
  soiled,
  @JsonValue('CALCULATED')
  calculated,
  @JsonValue('FRESH')
  fresh;

  String toJson() => _$WeightSourceEnumMap[this]!;

  static WeightSource fromJson(String json) =>
      _$WeightSourceEnumMap.entries
          .firstWhere((e) => e.value == json,
              orElse: () => throw ArgumentError('Unknown WeightSource: $json'))
          .key;
}

const _$WeightSourceEnumMap = {
  WeightSource.soiled: 'SOILED',
  WeightSource.calculated: 'CALCULATED',
  WeightSource.fresh: 'FRESH',
};

@JsonEnum(alwaysCreate: true)
enum ChallanType {
  @JsonValue('PICKUP')
  pickup,
  @JsonValue('DELIVERY')
  delivery;

  String toJson() => _$ChallanTypeEnumMap[this]!;

  static ChallanType fromJson(String json) =>
      _$ChallanTypeEnumMap.entries
          .firstWhere((e) => e.value == json,
              orElse: () => throw ArgumentError('Unknown ChallanType: $json'))
          .key;
}

const _$ChallanTypeEnumMap = {
  ChallanType.pickup: 'PICKUP',
  ChallanType.delivery: 'DELIVERY',
};
