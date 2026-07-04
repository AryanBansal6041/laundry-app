// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'damage_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DamageSummaryItem {

@JsonKey(name: 'hotel_id') String get hotelId;@JsonKey(name: 'hotel_name') String get hotelName;@JsonKey(name: 'item_id') String get itemId;@JsonKey(name: 'item_name') String get itemName;@JsonKey(name: 'net_damage') int get netDamage;
/// Create a copy of DamageSummaryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DamageSummaryItemCopyWith<DamageSummaryItem> get copyWith => _$DamageSummaryItemCopyWithImpl<DamageSummaryItem>(this as DamageSummaryItem, _$identity);

  /// Serializes this DamageSummaryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DamageSummaryItem&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.netDamage, netDamage) || other.netDamage == netDamage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,hotelName,itemId,itemName,netDamage);

@override
String toString() {
  return 'DamageSummaryItem(hotelId: $hotelId, hotelName: $hotelName, itemId: $itemId, itemName: $itemName, netDamage: $netDamage)';
}


}

/// @nodoc
abstract mixin class $DamageSummaryItemCopyWith<$Res>  {
  factory $DamageSummaryItemCopyWith(DamageSummaryItem value, $Res Function(DamageSummaryItem) _then) = _$DamageSummaryItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'hotel_name') String hotelName,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'net_damage') int netDamage
});




}
/// @nodoc
class _$DamageSummaryItemCopyWithImpl<$Res>
    implements $DamageSummaryItemCopyWith<$Res> {
  _$DamageSummaryItemCopyWithImpl(this._self, this._then);

  final DamageSummaryItem _self;
  final $Res Function(DamageSummaryItem) _then;

/// Create a copy of DamageSummaryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelId = null,Object? hotelName = null,Object? itemId = null,Object? itemName = null,Object? netDamage = null,}) {
  return _then(_self.copyWith(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,netDamage: null == netDamage ? _self.netDamage : netDamage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DamageSummaryItem].
extension DamageSummaryItemPatterns on DamageSummaryItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DamageSummaryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DamageSummaryItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DamageSummaryItem value)  $default,){
final _that = this;
switch (_that) {
case _DamageSummaryItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DamageSummaryItem value)?  $default,){
final _that = this;
switch (_that) {
case _DamageSummaryItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'hotel_name')  String hotelName, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'net_damage')  int netDamage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DamageSummaryItem() when $default != null:
return $default(_that.hotelId,_that.hotelName,_that.itemId,_that.itemName,_that.netDamage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'hotel_name')  String hotelName, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'net_damage')  int netDamage)  $default,) {final _that = this;
switch (_that) {
case _DamageSummaryItem():
return $default(_that.hotelId,_that.hotelName,_that.itemId,_that.itemName,_that.netDamage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'hotel_name')  String hotelName, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'net_damage')  int netDamage)?  $default,) {final _that = this;
switch (_that) {
case _DamageSummaryItem() when $default != null:
return $default(_that.hotelId,_that.hotelName,_that.itemId,_that.itemName,_that.netDamage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DamageSummaryItem implements DamageSummaryItem {
  const _DamageSummaryItem({@JsonKey(name: 'hotel_id') required this.hotelId, @JsonKey(name: 'hotel_name') required this.hotelName, @JsonKey(name: 'item_id') required this.itemId, @JsonKey(name: 'item_name') required this.itemName, @JsonKey(name: 'net_damage') required this.netDamage});
  factory _DamageSummaryItem.fromJson(Map<String, dynamic> json) => _$DamageSummaryItemFromJson(json);

@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override@JsonKey(name: 'hotel_name') final  String hotelName;
@override@JsonKey(name: 'item_id') final  String itemId;
@override@JsonKey(name: 'item_name') final  String itemName;
@override@JsonKey(name: 'net_damage') final  int netDamage;

/// Create a copy of DamageSummaryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DamageSummaryItemCopyWith<_DamageSummaryItem> get copyWith => __$DamageSummaryItemCopyWithImpl<_DamageSummaryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DamageSummaryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DamageSummaryItem&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.netDamage, netDamage) || other.netDamage == netDamage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,hotelName,itemId,itemName,netDamage);

@override
String toString() {
  return 'DamageSummaryItem(hotelId: $hotelId, hotelName: $hotelName, itemId: $itemId, itemName: $itemName, netDamage: $netDamage)';
}


}

/// @nodoc
abstract mixin class _$DamageSummaryItemCopyWith<$Res> implements $DamageSummaryItemCopyWith<$Res> {
  factory _$DamageSummaryItemCopyWith(_DamageSummaryItem value, $Res Function(_DamageSummaryItem) _then) = __$DamageSummaryItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'hotel_name') String hotelName,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'net_damage') int netDamage
});




}
/// @nodoc
class __$DamageSummaryItemCopyWithImpl<$Res>
    implements _$DamageSummaryItemCopyWith<$Res> {
  __$DamageSummaryItemCopyWithImpl(this._self, this._then);

  final _DamageSummaryItem _self;
  final $Res Function(_DamageSummaryItem) _then;

/// Create a copy of DamageSummaryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelId = null,Object? hotelName = null,Object? itemId = null,Object? itemName = null,Object? netDamage = null,}) {
  return _then(_DamageSummaryItem(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,netDamage: null == netDamage ? _self.netDamage : netDamage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AllTimeDamageItem {

@JsonKey(name: 'hotel_id') String get hotelId;@JsonKey(name: 'hotel_name') String get hotelName;@JsonKey(name: 'item_id') String get itemId;@JsonKey(name: 'item_name') String get itemName;@JsonKey(name: 'total_damaged_by_laundry') int get totalDamagedByLaundry;
/// Create a copy of AllTimeDamageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllTimeDamageItemCopyWith<AllTimeDamageItem> get copyWith => _$AllTimeDamageItemCopyWithImpl<AllTimeDamageItem>(this as AllTimeDamageItem, _$identity);

  /// Serializes this AllTimeDamageItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllTimeDamageItem&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.totalDamagedByLaundry, totalDamagedByLaundry) || other.totalDamagedByLaundry == totalDamagedByLaundry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,hotelName,itemId,itemName,totalDamagedByLaundry);

@override
String toString() {
  return 'AllTimeDamageItem(hotelId: $hotelId, hotelName: $hotelName, itemId: $itemId, itemName: $itemName, totalDamagedByLaundry: $totalDamagedByLaundry)';
}


}

/// @nodoc
abstract mixin class $AllTimeDamageItemCopyWith<$Res>  {
  factory $AllTimeDamageItemCopyWith(AllTimeDamageItem value, $Res Function(AllTimeDamageItem) _then) = _$AllTimeDamageItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'hotel_name') String hotelName,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'total_damaged_by_laundry') int totalDamagedByLaundry
});




}
/// @nodoc
class _$AllTimeDamageItemCopyWithImpl<$Res>
    implements $AllTimeDamageItemCopyWith<$Res> {
  _$AllTimeDamageItemCopyWithImpl(this._self, this._then);

  final AllTimeDamageItem _self;
  final $Res Function(AllTimeDamageItem) _then;

/// Create a copy of AllTimeDamageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelId = null,Object? hotelName = null,Object? itemId = null,Object? itemName = null,Object? totalDamagedByLaundry = null,}) {
  return _then(_self.copyWith(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,totalDamagedByLaundry: null == totalDamagedByLaundry ? _self.totalDamagedByLaundry : totalDamagedByLaundry // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AllTimeDamageItem].
extension AllTimeDamageItemPatterns on AllTimeDamageItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllTimeDamageItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllTimeDamageItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllTimeDamageItem value)  $default,){
final _that = this;
switch (_that) {
case _AllTimeDamageItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllTimeDamageItem value)?  $default,){
final _that = this;
switch (_that) {
case _AllTimeDamageItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'hotel_name')  String hotelName, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'total_damaged_by_laundry')  int totalDamagedByLaundry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllTimeDamageItem() when $default != null:
return $default(_that.hotelId,_that.hotelName,_that.itemId,_that.itemName,_that.totalDamagedByLaundry);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'hotel_name')  String hotelName, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'total_damaged_by_laundry')  int totalDamagedByLaundry)  $default,) {final _that = this;
switch (_that) {
case _AllTimeDamageItem():
return $default(_that.hotelId,_that.hotelName,_that.itemId,_that.itemName,_that.totalDamagedByLaundry);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'hotel_name')  String hotelName, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'total_damaged_by_laundry')  int totalDamagedByLaundry)?  $default,) {final _that = this;
switch (_that) {
case _AllTimeDamageItem() when $default != null:
return $default(_that.hotelId,_that.hotelName,_that.itemId,_that.itemName,_that.totalDamagedByLaundry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllTimeDamageItem implements AllTimeDamageItem {
  const _AllTimeDamageItem({@JsonKey(name: 'hotel_id') required this.hotelId, @JsonKey(name: 'hotel_name') required this.hotelName, @JsonKey(name: 'item_id') required this.itemId, @JsonKey(name: 'item_name') required this.itemName, @JsonKey(name: 'total_damaged_by_laundry') required this.totalDamagedByLaundry});
  factory _AllTimeDamageItem.fromJson(Map<String, dynamic> json) => _$AllTimeDamageItemFromJson(json);

@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override@JsonKey(name: 'hotel_name') final  String hotelName;
@override@JsonKey(name: 'item_id') final  String itemId;
@override@JsonKey(name: 'item_name') final  String itemName;
@override@JsonKey(name: 'total_damaged_by_laundry') final  int totalDamagedByLaundry;

/// Create a copy of AllTimeDamageItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllTimeDamageItemCopyWith<_AllTimeDamageItem> get copyWith => __$AllTimeDamageItemCopyWithImpl<_AllTimeDamageItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllTimeDamageItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllTimeDamageItem&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.totalDamagedByLaundry, totalDamagedByLaundry) || other.totalDamagedByLaundry == totalDamagedByLaundry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,hotelName,itemId,itemName,totalDamagedByLaundry);

@override
String toString() {
  return 'AllTimeDamageItem(hotelId: $hotelId, hotelName: $hotelName, itemId: $itemId, itemName: $itemName, totalDamagedByLaundry: $totalDamagedByLaundry)';
}


}

/// @nodoc
abstract mixin class _$AllTimeDamageItemCopyWith<$Res> implements $AllTimeDamageItemCopyWith<$Res> {
  factory _$AllTimeDamageItemCopyWith(_AllTimeDamageItem value, $Res Function(_AllTimeDamageItem) _then) = __$AllTimeDamageItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'hotel_name') String hotelName,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'total_damaged_by_laundry') int totalDamagedByLaundry
});




}
/// @nodoc
class __$AllTimeDamageItemCopyWithImpl<$Res>
    implements _$AllTimeDamageItemCopyWith<$Res> {
  __$AllTimeDamageItemCopyWithImpl(this._self, this._then);

  final _AllTimeDamageItem _self;
  final $Res Function(_AllTimeDamageItem) _then;

/// Create a copy of AllTimeDamageItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelId = null,Object? hotelName = null,Object? itemId = null,Object? itemName = null,Object? totalDamagedByLaundry = null,}) {
  return _then(_AllTimeDamageItem(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,totalDamagedByLaundry: null == totalDamagedByLaundry ? _self.totalDamagedByLaundry : totalDamagedByLaundry // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DamageReportResponse {

@JsonKey(name: 'challan_damage_summary') List<DamageSummaryItem> get challanDamageSummary;@JsonKey(name: 'all_time_totals') List<AllTimeDamageItem> get allTimeTotals;
/// Create a copy of DamageReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DamageReportResponseCopyWith<DamageReportResponse> get copyWith => _$DamageReportResponseCopyWithImpl<DamageReportResponse>(this as DamageReportResponse, _$identity);

  /// Serializes this DamageReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DamageReportResponse&&const DeepCollectionEquality().equals(other.challanDamageSummary, challanDamageSummary)&&const DeepCollectionEquality().equals(other.allTimeTotals, allTimeTotals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(challanDamageSummary),const DeepCollectionEquality().hash(allTimeTotals));

@override
String toString() {
  return 'DamageReportResponse(challanDamageSummary: $challanDamageSummary, allTimeTotals: $allTimeTotals)';
}


}

/// @nodoc
abstract mixin class $DamageReportResponseCopyWith<$Res>  {
  factory $DamageReportResponseCopyWith(DamageReportResponse value, $Res Function(DamageReportResponse) _then) = _$DamageReportResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'challan_damage_summary') List<DamageSummaryItem> challanDamageSummary,@JsonKey(name: 'all_time_totals') List<AllTimeDamageItem> allTimeTotals
});




}
/// @nodoc
class _$DamageReportResponseCopyWithImpl<$Res>
    implements $DamageReportResponseCopyWith<$Res> {
  _$DamageReportResponseCopyWithImpl(this._self, this._then);

  final DamageReportResponse _self;
  final $Res Function(DamageReportResponse) _then;

/// Create a copy of DamageReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challanDamageSummary = null,Object? allTimeTotals = null,}) {
  return _then(_self.copyWith(
challanDamageSummary: null == challanDamageSummary ? _self.challanDamageSummary : challanDamageSummary // ignore: cast_nullable_to_non_nullable
as List<DamageSummaryItem>,allTimeTotals: null == allTimeTotals ? _self.allTimeTotals : allTimeTotals // ignore: cast_nullable_to_non_nullable
as List<AllTimeDamageItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [DamageReportResponse].
extension DamageReportResponsePatterns on DamageReportResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DamageReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DamageReportResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DamageReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _DamageReportResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DamageReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DamageReportResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_damage_summary')  List<DamageSummaryItem> challanDamageSummary, @JsonKey(name: 'all_time_totals')  List<AllTimeDamageItem> allTimeTotals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DamageReportResponse() when $default != null:
return $default(_that.challanDamageSummary,_that.allTimeTotals);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_damage_summary')  List<DamageSummaryItem> challanDamageSummary, @JsonKey(name: 'all_time_totals')  List<AllTimeDamageItem> allTimeTotals)  $default,) {final _that = this;
switch (_that) {
case _DamageReportResponse():
return $default(_that.challanDamageSummary,_that.allTimeTotals);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'challan_damage_summary')  List<DamageSummaryItem> challanDamageSummary, @JsonKey(name: 'all_time_totals')  List<AllTimeDamageItem> allTimeTotals)?  $default,) {final _that = this;
switch (_that) {
case _DamageReportResponse() when $default != null:
return $default(_that.challanDamageSummary,_that.allTimeTotals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DamageReportResponse implements DamageReportResponse {
  const _DamageReportResponse({@JsonKey(name: 'challan_damage_summary') required final  List<DamageSummaryItem> challanDamageSummary, @JsonKey(name: 'all_time_totals') required final  List<AllTimeDamageItem> allTimeTotals}): _challanDamageSummary = challanDamageSummary,_allTimeTotals = allTimeTotals;
  factory _DamageReportResponse.fromJson(Map<String, dynamic> json) => _$DamageReportResponseFromJson(json);

 final  List<DamageSummaryItem> _challanDamageSummary;
@override@JsonKey(name: 'challan_damage_summary') List<DamageSummaryItem> get challanDamageSummary {
  if (_challanDamageSummary is EqualUnmodifiableListView) return _challanDamageSummary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challanDamageSummary);
}

 final  List<AllTimeDamageItem> _allTimeTotals;
@override@JsonKey(name: 'all_time_totals') List<AllTimeDamageItem> get allTimeTotals {
  if (_allTimeTotals is EqualUnmodifiableListView) return _allTimeTotals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTimeTotals);
}


/// Create a copy of DamageReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DamageReportResponseCopyWith<_DamageReportResponse> get copyWith => __$DamageReportResponseCopyWithImpl<_DamageReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DamageReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DamageReportResponse&&const DeepCollectionEquality().equals(other._challanDamageSummary, _challanDamageSummary)&&const DeepCollectionEquality().equals(other._allTimeTotals, _allTimeTotals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_challanDamageSummary),const DeepCollectionEquality().hash(_allTimeTotals));

@override
String toString() {
  return 'DamageReportResponse(challanDamageSummary: $challanDamageSummary, allTimeTotals: $allTimeTotals)';
}


}

/// @nodoc
abstract mixin class _$DamageReportResponseCopyWith<$Res> implements $DamageReportResponseCopyWith<$Res> {
  factory _$DamageReportResponseCopyWith(_DamageReportResponse value, $Res Function(_DamageReportResponse) _then) = __$DamageReportResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'challan_damage_summary') List<DamageSummaryItem> challanDamageSummary,@JsonKey(name: 'all_time_totals') List<AllTimeDamageItem> allTimeTotals
});




}
/// @nodoc
class __$DamageReportResponseCopyWithImpl<$Res>
    implements _$DamageReportResponseCopyWith<$Res> {
  __$DamageReportResponseCopyWithImpl(this._self, this._then);

  final _DamageReportResponse _self;
  final $Res Function(_DamageReportResponse) _then;

/// Create a copy of DamageReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challanDamageSummary = null,Object? allTimeTotals = null,}) {
  return _then(_DamageReportResponse(
challanDamageSummary: null == challanDamageSummary ? _self._challanDamageSummary : challanDamageSummary // ignore: cast_nullable_to_non_nullable
as List<DamageSummaryItem>,allTimeTotals: null == allTimeTotals ? _self._allTimeTotals : allTimeTotals // ignore: cast_nullable_to_non_nullable
as List<AllTimeDamageItem>,
  ));
}


}

// dart format on
