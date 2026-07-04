// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillingPeriod _$BillingPeriodFromJson(Map<String, dynamic> json) =>
    _BillingPeriod(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$BillingPeriodToJson(_BillingPeriod instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

_PieceLineItem _$PieceLineItemFromJson(Map<String, dynamic> json) =>
    _PieceLineItem(
      itemName: json['item_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
    );

Map<String, dynamic> _$PieceLineItemToJson(_PieceLineItem instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'quantity': instance.quantity,
      'rate': instance.rate,
      'subtotal': instance.subtotal,
    };

_DepartmentBilling _$DepartmentBillingFromJson(Map<String, dynamic> json) =>
    _DepartmentBilling(
      deptName: json['dept_name'] as String,
      billingType: json['billing_type'] as String,
      totalWeightKg: (json['total_weight_kg'] as num?)?.toDouble(),
      ratePerKg: (json['rate_per_kg'] as num?)?.toDouble(),
      soiledWeightKg: (json['soiled_weight_kg'] as num?)?.toDouble(),
      soiledSubtotal: (json['soiled_subtotal'] as num?)?.toDouble(),
      calculatedWeightKg: (json['calculated_weight_kg'] as num?)?.toDouble(),
      calculatedSubtotal: (json['calculated_subtotal'] as num?)?.toDouble(),
      freshWeightKg: (json['fresh_weight_kg'] as num?)?.toDouble(),
      freshSubtotal: (json['fresh_subtotal'] as num?)?.toDouble(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PieceLineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
    );

Map<String, dynamic> _$DepartmentBillingToJson(_DepartmentBilling instance) =>
    <String, dynamic>{
      'dept_name': instance.deptName,
      'billing_type': instance.billingType,
      'total_weight_kg': instance.totalWeightKg,
      'rate_per_kg': instance.ratePerKg,
      'soiled_weight_kg': instance.soiledWeightKg,
      'soiled_subtotal': instance.soiledSubtotal,
      'calculated_weight_kg': instance.calculatedWeightKg,
      'calculated_subtotal': instance.calculatedSubtotal,
      'fresh_weight_kg': instance.freshWeightKg,
      'fresh_subtotal': instance.freshSubtotal,
      'items': instance.items,
      'subtotal': instance.subtotal,
    };

_HotelBilling _$HotelBillingFromJson(Map<String, dynamic> json) =>
    _HotelBilling(
      hotelName: json['hotel_name'] as String,
      departments: (json['departments'] as List<dynamic>)
          .map((e) => DepartmentBilling.fromJson(e as Map<String, dynamic>))
          .toList(),
      damageLiability: (json['damage_liability'] as num).toDouble(),
      grandTotal: (json['grand_total'] as num).toDouble(),
    );

Map<String, dynamic> _$HotelBillingToJson(_HotelBilling instance) =>
    <String, dynamic>{
      'hotel_name': instance.hotelName,
      'departments': instance.departments,
      'damage_liability': instance.damageLiability,
      'grand_total': instance.grandTotal,
    };

_BillingResponse _$BillingResponseFromJson(Map<String, dynamic> json) =>
    _BillingResponse(
      period: BillingPeriod.fromJson(json['period'] as Map<String, dynamic>),
      hotels: (json['hotels'] as List<dynamic>)
          .map((e) => HotelBilling.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillingResponseToJson(_BillingResponse instance) =>
    <String, dynamic>{'period': instance.period, 'hotels': instance.hotels};

_DetailedChallanItemBilling _$DetailedChallanItemBillingFromJson(
  Map<String, dynamic> json,
) => _DetailedChallanItemBilling(
  itemName: json['item_name'] as String,
  qty: (json['qty'] as num).toInt(),
  rate: (json['rate'] as num?)?.toDouble(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DetailedChallanItemBillingToJson(
  _DetailedChallanItemBilling instance,
) => <String, dynamic>{
  'item_name': instance.itemName,
  'qty': instance.qty,
  'rate': instance.rate,
  'subtotal': instance.subtotal,
};

_DetailedChallanDeptBilling _$DetailedChallanDeptBillingFromJson(
  Map<String, dynamic> json,
) => _DetailedChallanDeptBilling(
  deptName: json['dept_name'] as String,
  billingType: json['billing_type'] as String,
  soiledWeightKg: (json['soiled_weight_kg'] as num?)?.toDouble(),
  freshWeightKg: (json['fresh_weight_kg'] as num?)?.toDouble(),
  calculatedWeightKg: (json['calculated_weight_kg'] as num?)?.toDouble(),
  ratePerKg: (json['rate_per_kg'] as num?)?.toDouble(),
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) => DetailedChallanItemBilling.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  subtotal: (json['subtotal'] as num).toDouble(),
);

Map<String, dynamic> _$DetailedChallanDeptBillingToJson(
  _DetailedChallanDeptBilling instance,
) => <String, dynamic>{
  'dept_name': instance.deptName,
  'billing_type': instance.billingType,
  'soiled_weight_kg': instance.soiledWeightKg,
  'fresh_weight_kg': instance.freshWeightKg,
  'calculated_weight_kg': instance.calculatedWeightKg,
  'rate_per_kg': instance.ratePerKg,
  'items': instance.items,
  'subtotal': instance.subtotal,
};

_DetailedChallanBilling _$DetailedChallanBillingFromJson(
  Map<String, dynamic> json,
) => _DetailedChallanBilling(
  challanNumber: json['challan_number'] as String,
  challanType: json['challan_type'] as String,
  entryTimestamp: DateTime.parse(json['entry_timestamp'] as String),
  agentName: json['agent_name'] as String?,
  departments: (json['departments'] as List<dynamic>)
      .map(
        (e) => DetailedChallanDeptBilling.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  challanTotal: (json['challan_total'] as num).toDouble(),
);

Map<String, dynamic> _$DetailedChallanBillingToJson(
  _DetailedChallanBilling instance,
) => <String, dynamic>{
  'challan_number': instance.challanNumber,
  'challan_type': instance.challanType,
  'entry_timestamp': instance.entryTimestamp.toIso8601String(),
  'agent_name': instance.agentName,
  'departments': instance.departments,
  'challan_total': instance.challanTotal,
};

_DetailedHotelBilling _$DetailedHotelBillingFromJson(
  Map<String, dynamic> json,
) => _DetailedHotelBilling(
  hotelName: json['hotel_name'] as String,
  challans: (json['challans'] as List<dynamic>)
      .map((e) => DetailedChallanBilling.fromJson(e as Map<String, dynamic>))
      .toList(),
  damageLiability: (json['damage_liability'] as num).toDouble(),
  grandTotal: (json['grand_total'] as num).toDouble(),
);

Map<String, dynamic> _$DetailedHotelBillingToJson(
  _DetailedHotelBilling instance,
) => <String, dynamic>{
  'hotel_name': instance.hotelName,
  'challans': instance.challans,
  'damage_liability': instance.damageLiability,
  'grand_total': instance.grandTotal,
};

_DetailedBillingResponse _$DetailedBillingResponseFromJson(
  Map<String, dynamic> json,
) => _DetailedBillingResponse(
  period: BillingPeriod.fromJson(json['period'] as Map<String, dynamic>),
  hotels: (json['hotels'] as List<dynamic>)
      .map((e) => DetailedHotelBilling.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DetailedBillingResponseToJson(
  _DetailedBillingResponse instance,
) => <String, dynamic>{'period': instance.period, 'hotels': instance.hotels};
