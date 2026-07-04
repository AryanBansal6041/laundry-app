// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillingPeriod {

 DateTime get start; DateTime get end;
/// Create a copy of BillingPeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingPeriodCopyWith<BillingPeriod> get copyWith => _$BillingPeriodCopyWithImpl<BillingPeriod>(this as BillingPeriod, _$identity);

  /// Serializes this BillingPeriod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingPeriod&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'BillingPeriod(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $BillingPeriodCopyWith<$Res>  {
  factory $BillingPeriodCopyWith(BillingPeriod value, $Res Function(BillingPeriod) _then) = _$BillingPeriodCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$BillingPeriodCopyWithImpl<$Res>
    implements $BillingPeriodCopyWith<$Res> {
  _$BillingPeriodCopyWithImpl(this._self, this._then);

  final BillingPeriod _self;
  final $Res Function(BillingPeriod) _then;

/// Create a copy of BillingPeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BillingPeriod].
extension BillingPeriodPatterns on BillingPeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillingPeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillingPeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillingPeriod value)  $default,){
final _that = this;
switch (_that) {
case _BillingPeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillingPeriod value)?  $default,){
final _that = this;
switch (_that) {
case _BillingPeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillingPeriod() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _BillingPeriod():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime start,  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _BillingPeriod() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillingPeriod implements BillingPeriod {
  const _BillingPeriod({required this.start, required this.end});
  factory _BillingPeriod.fromJson(Map<String, dynamic> json) => _$BillingPeriodFromJson(json);

@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of BillingPeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillingPeriodCopyWith<_BillingPeriod> get copyWith => __$BillingPeriodCopyWithImpl<_BillingPeriod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillingPeriodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillingPeriod&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'BillingPeriod(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$BillingPeriodCopyWith<$Res> implements $BillingPeriodCopyWith<$Res> {
  factory _$BillingPeriodCopyWith(_BillingPeriod value, $Res Function(_BillingPeriod) _then) = __$BillingPeriodCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class __$BillingPeriodCopyWithImpl<$Res>
    implements _$BillingPeriodCopyWith<$Res> {
  __$BillingPeriodCopyWithImpl(this._self, this._then);

  final _BillingPeriod _self;
  final $Res Function(_BillingPeriod) _then;

/// Create a copy of BillingPeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_BillingPeriod(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$PieceLineItem {

@JsonKey(name: 'item_name') String get itemName; int get quantity; double get rate; double get subtotal;
/// Create a copy of PieceLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceLineItemCopyWith<PieceLineItem> get copyWith => _$PieceLineItemCopyWithImpl<PieceLineItem>(this as PieceLineItem, _$identity);

  /// Serializes this PieceLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieceLineItem&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,quantity,rate,subtotal);

@override
String toString() {
  return 'PieceLineItem(itemName: $itemName, quantity: $quantity, rate: $rate, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $PieceLineItemCopyWith<$Res>  {
  factory $PieceLineItemCopyWith(PieceLineItem value, $Res Function(PieceLineItem) _then) = _$PieceLineItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_name') String itemName, int quantity, double rate, double subtotal
});




}
/// @nodoc
class _$PieceLineItemCopyWithImpl<$Res>
    implements $PieceLineItemCopyWith<$Res> {
  _$PieceLineItemCopyWithImpl(this._self, this._then);

  final PieceLineItem _self;
  final $Res Function(PieceLineItem) _then;

/// Create a copy of PieceLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemName = null,Object? quantity = null,Object? rate = null,Object? subtotal = null,}) {
  return _then(_self.copyWith(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PieceLineItem].
extension PieceLineItemPatterns on PieceLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieceLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieceLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieceLineItem value)  $default,){
final _that = this;
switch (_that) {
case _PieceLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieceLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _PieceLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_name')  String itemName,  int quantity,  double rate,  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieceLineItem() when $default != null:
return $default(_that.itemName,_that.quantity,_that.rate,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_name')  String itemName,  int quantity,  double rate,  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _PieceLineItem():
return $default(_that.itemName,_that.quantity,_that.rate,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_name')  String itemName,  int quantity,  double rate,  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _PieceLineItem() when $default != null:
return $default(_that.itemName,_that.quantity,_that.rate,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PieceLineItem implements PieceLineItem {
  const _PieceLineItem({@JsonKey(name: 'item_name') required this.itemName, required this.quantity, required this.rate, required this.subtotal});
  factory _PieceLineItem.fromJson(Map<String, dynamic> json) => _$PieceLineItemFromJson(json);

@override@JsonKey(name: 'item_name') final  String itemName;
@override final  int quantity;
@override final  double rate;
@override final  double subtotal;

/// Create a copy of PieceLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceLineItemCopyWith<_PieceLineItem> get copyWith => __$PieceLineItemCopyWithImpl<_PieceLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PieceLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceLineItem&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,quantity,rate,subtotal);

@override
String toString() {
  return 'PieceLineItem(itemName: $itemName, quantity: $quantity, rate: $rate, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$PieceLineItemCopyWith<$Res> implements $PieceLineItemCopyWith<$Res> {
  factory _$PieceLineItemCopyWith(_PieceLineItem value, $Res Function(_PieceLineItem) _then) = __$PieceLineItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_name') String itemName, int quantity, double rate, double subtotal
});




}
/// @nodoc
class __$PieceLineItemCopyWithImpl<$Res>
    implements _$PieceLineItemCopyWith<$Res> {
  __$PieceLineItemCopyWithImpl(this._self, this._then);

  final _PieceLineItem _self;
  final $Res Function(_PieceLineItem) _then;

/// Create a copy of PieceLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemName = null,Object? quantity = null,Object? rate = null,Object? subtotal = null,}) {
  return _then(_PieceLineItem(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DepartmentBilling {

@JsonKey(name: 'dept_name') String get deptName;@JsonKey(name: 'billing_type') String get billingType;@JsonKey(name: 'total_weight_kg') double? get totalWeightKg;@JsonKey(name: 'rate_per_kg') double? get ratePerKg;@JsonKey(name: 'soiled_weight_kg') double? get soiledWeightKg;@JsonKey(name: 'soiled_subtotal') double? get soiledSubtotal;@JsonKey(name: 'calculated_weight_kg') double? get calculatedWeightKg;@JsonKey(name: 'calculated_subtotal') double? get calculatedSubtotal;@JsonKey(name: 'fresh_weight_kg') double? get freshWeightKg;@JsonKey(name: 'fresh_subtotal') double? get freshSubtotal; List<PieceLineItem>? get items; double get subtotal;
/// Create a copy of DepartmentBilling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentBillingCopyWith<DepartmentBilling> get copyWith => _$DepartmentBillingCopyWithImpl<DepartmentBilling>(this as DepartmentBilling, _$identity);

  /// Serializes this DepartmentBilling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentBilling&&(identical(other.deptName, deptName) || other.deptName == deptName)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.totalWeightKg, totalWeightKg) || other.totalWeightKg == totalWeightKg)&&(identical(other.ratePerKg, ratePerKg) || other.ratePerKg == ratePerKg)&&(identical(other.soiledWeightKg, soiledWeightKg) || other.soiledWeightKg == soiledWeightKg)&&(identical(other.soiledSubtotal, soiledSubtotal) || other.soiledSubtotal == soiledSubtotal)&&(identical(other.calculatedWeightKg, calculatedWeightKg) || other.calculatedWeightKg == calculatedWeightKg)&&(identical(other.calculatedSubtotal, calculatedSubtotal) || other.calculatedSubtotal == calculatedSubtotal)&&(identical(other.freshWeightKg, freshWeightKg) || other.freshWeightKg == freshWeightKg)&&(identical(other.freshSubtotal, freshSubtotal) || other.freshSubtotal == freshSubtotal)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptName,billingType,totalWeightKg,ratePerKg,soiledWeightKg,soiledSubtotal,calculatedWeightKg,calculatedSubtotal,freshWeightKg,freshSubtotal,const DeepCollectionEquality().hash(items),subtotal);

@override
String toString() {
  return 'DepartmentBilling(deptName: $deptName, billingType: $billingType, totalWeightKg: $totalWeightKg, ratePerKg: $ratePerKg, soiledWeightKg: $soiledWeightKg, soiledSubtotal: $soiledSubtotal, calculatedWeightKg: $calculatedWeightKg, calculatedSubtotal: $calculatedSubtotal, freshWeightKg: $freshWeightKg, freshSubtotal: $freshSubtotal, items: $items, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $DepartmentBillingCopyWith<$Res>  {
  factory $DepartmentBillingCopyWith(DepartmentBilling value, $Res Function(DepartmentBilling) _then) = _$DepartmentBillingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dept_name') String deptName,@JsonKey(name: 'billing_type') String billingType,@JsonKey(name: 'total_weight_kg') double? totalWeightKg,@JsonKey(name: 'rate_per_kg') double? ratePerKg,@JsonKey(name: 'soiled_weight_kg') double? soiledWeightKg,@JsonKey(name: 'soiled_subtotal') double? soiledSubtotal,@JsonKey(name: 'calculated_weight_kg') double? calculatedWeightKg,@JsonKey(name: 'calculated_subtotal') double? calculatedSubtotal,@JsonKey(name: 'fresh_weight_kg') double? freshWeightKg,@JsonKey(name: 'fresh_subtotal') double? freshSubtotal, List<PieceLineItem>? items, double subtotal
});




}
/// @nodoc
class _$DepartmentBillingCopyWithImpl<$Res>
    implements $DepartmentBillingCopyWith<$Res> {
  _$DepartmentBillingCopyWithImpl(this._self, this._then);

  final DepartmentBilling _self;
  final $Res Function(DepartmentBilling) _then;

/// Create a copy of DepartmentBilling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deptName = null,Object? billingType = null,Object? totalWeightKg = freezed,Object? ratePerKg = freezed,Object? soiledWeightKg = freezed,Object? soiledSubtotal = freezed,Object? calculatedWeightKg = freezed,Object? calculatedSubtotal = freezed,Object? freshWeightKg = freezed,Object? freshSubtotal = freezed,Object? items = freezed,Object? subtotal = null,}) {
  return _then(_self.copyWith(
deptName: null == deptName ? _self.deptName : deptName // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as String,totalWeightKg: freezed == totalWeightKg ? _self.totalWeightKg : totalWeightKg // ignore: cast_nullable_to_non_nullable
as double?,ratePerKg: freezed == ratePerKg ? _self.ratePerKg : ratePerKg // ignore: cast_nullable_to_non_nullable
as double?,soiledWeightKg: freezed == soiledWeightKg ? _self.soiledWeightKg : soiledWeightKg // ignore: cast_nullable_to_non_nullable
as double?,soiledSubtotal: freezed == soiledSubtotal ? _self.soiledSubtotal : soiledSubtotal // ignore: cast_nullable_to_non_nullable
as double?,calculatedWeightKg: freezed == calculatedWeightKg ? _self.calculatedWeightKg : calculatedWeightKg // ignore: cast_nullable_to_non_nullable
as double?,calculatedSubtotal: freezed == calculatedSubtotal ? _self.calculatedSubtotal : calculatedSubtotal // ignore: cast_nullable_to_non_nullable
as double?,freshWeightKg: freezed == freshWeightKg ? _self.freshWeightKg : freshWeightKg // ignore: cast_nullable_to_non_nullable
as double?,freshSubtotal: freezed == freshSubtotal ? _self.freshSubtotal : freshSubtotal // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PieceLineItem>?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentBilling].
extension DepartmentBillingPatterns on DepartmentBilling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentBilling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentBilling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentBilling value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentBilling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentBilling value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentBilling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'billing_type')  String billingType, @JsonKey(name: 'total_weight_kg')  double? totalWeightKg, @JsonKey(name: 'rate_per_kg')  double? ratePerKg, @JsonKey(name: 'soiled_weight_kg')  double? soiledWeightKg, @JsonKey(name: 'soiled_subtotal')  double? soiledSubtotal, @JsonKey(name: 'calculated_weight_kg')  double? calculatedWeightKg, @JsonKey(name: 'calculated_subtotal')  double? calculatedSubtotal, @JsonKey(name: 'fresh_weight_kg')  double? freshWeightKg, @JsonKey(name: 'fresh_subtotal')  double? freshSubtotal,  List<PieceLineItem>? items,  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentBilling() when $default != null:
return $default(_that.deptName,_that.billingType,_that.totalWeightKg,_that.ratePerKg,_that.soiledWeightKg,_that.soiledSubtotal,_that.calculatedWeightKg,_that.calculatedSubtotal,_that.freshWeightKg,_that.freshSubtotal,_that.items,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'billing_type')  String billingType, @JsonKey(name: 'total_weight_kg')  double? totalWeightKg, @JsonKey(name: 'rate_per_kg')  double? ratePerKg, @JsonKey(name: 'soiled_weight_kg')  double? soiledWeightKg, @JsonKey(name: 'soiled_subtotal')  double? soiledSubtotal, @JsonKey(name: 'calculated_weight_kg')  double? calculatedWeightKg, @JsonKey(name: 'calculated_subtotal')  double? calculatedSubtotal, @JsonKey(name: 'fresh_weight_kg')  double? freshWeightKg, @JsonKey(name: 'fresh_subtotal')  double? freshSubtotal,  List<PieceLineItem>? items,  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _DepartmentBilling():
return $default(_that.deptName,_that.billingType,_that.totalWeightKg,_that.ratePerKg,_that.soiledWeightKg,_that.soiledSubtotal,_that.calculatedWeightKg,_that.calculatedSubtotal,_that.freshWeightKg,_that.freshSubtotal,_that.items,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'billing_type')  String billingType, @JsonKey(name: 'total_weight_kg')  double? totalWeightKg, @JsonKey(name: 'rate_per_kg')  double? ratePerKg, @JsonKey(name: 'soiled_weight_kg')  double? soiledWeightKg, @JsonKey(name: 'soiled_subtotal')  double? soiledSubtotal, @JsonKey(name: 'calculated_weight_kg')  double? calculatedWeightKg, @JsonKey(name: 'calculated_subtotal')  double? calculatedSubtotal, @JsonKey(name: 'fresh_weight_kg')  double? freshWeightKg, @JsonKey(name: 'fresh_subtotal')  double? freshSubtotal,  List<PieceLineItem>? items,  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentBilling() when $default != null:
return $default(_that.deptName,_that.billingType,_that.totalWeightKg,_that.ratePerKg,_that.soiledWeightKg,_that.soiledSubtotal,_that.calculatedWeightKg,_that.calculatedSubtotal,_that.freshWeightKg,_that.freshSubtotal,_that.items,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentBilling implements DepartmentBilling {
  const _DepartmentBilling({@JsonKey(name: 'dept_name') required this.deptName, @JsonKey(name: 'billing_type') required this.billingType, @JsonKey(name: 'total_weight_kg') this.totalWeightKg, @JsonKey(name: 'rate_per_kg') this.ratePerKg, @JsonKey(name: 'soiled_weight_kg') this.soiledWeightKg, @JsonKey(name: 'soiled_subtotal') this.soiledSubtotal, @JsonKey(name: 'calculated_weight_kg') this.calculatedWeightKg, @JsonKey(name: 'calculated_subtotal') this.calculatedSubtotal, @JsonKey(name: 'fresh_weight_kg') this.freshWeightKg, @JsonKey(name: 'fresh_subtotal') this.freshSubtotal, final  List<PieceLineItem>? items, required this.subtotal}): _items = items;
  factory _DepartmentBilling.fromJson(Map<String, dynamic> json) => _$DepartmentBillingFromJson(json);

@override@JsonKey(name: 'dept_name') final  String deptName;
@override@JsonKey(name: 'billing_type') final  String billingType;
@override@JsonKey(name: 'total_weight_kg') final  double? totalWeightKg;
@override@JsonKey(name: 'rate_per_kg') final  double? ratePerKg;
@override@JsonKey(name: 'soiled_weight_kg') final  double? soiledWeightKg;
@override@JsonKey(name: 'soiled_subtotal') final  double? soiledSubtotal;
@override@JsonKey(name: 'calculated_weight_kg') final  double? calculatedWeightKg;
@override@JsonKey(name: 'calculated_subtotal') final  double? calculatedSubtotal;
@override@JsonKey(name: 'fresh_weight_kg') final  double? freshWeightKg;
@override@JsonKey(name: 'fresh_subtotal') final  double? freshSubtotal;
 final  List<PieceLineItem>? _items;
@override List<PieceLineItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double subtotal;

/// Create a copy of DepartmentBilling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentBillingCopyWith<_DepartmentBilling> get copyWith => __$DepartmentBillingCopyWithImpl<_DepartmentBilling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentBillingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentBilling&&(identical(other.deptName, deptName) || other.deptName == deptName)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.totalWeightKg, totalWeightKg) || other.totalWeightKg == totalWeightKg)&&(identical(other.ratePerKg, ratePerKg) || other.ratePerKg == ratePerKg)&&(identical(other.soiledWeightKg, soiledWeightKg) || other.soiledWeightKg == soiledWeightKg)&&(identical(other.soiledSubtotal, soiledSubtotal) || other.soiledSubtotal == soiledSubtotal)&&(identical(other.calculatedWeightKg, calculatedWeightKg) || other.calculatedWeightKg == calculatedWeightKg)&&(identical(other.calculatedSubtotal, calculatedSubtotal) || other.calculatedSubtotal == calculatedSubtotal)&&(identical(other.freshWeightKg, freshWeightKg) || other.freshWeightKg == freshWeightKg)&&(identical(other.freshSubtotal, freshSubtotal) || other.freshSubtotal == freshSubtotal)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptName,billingType,totalWeightKg,ratePerKg,soiledWeightKg,soiledSubtotal,calculatedWeightKg,calculatedSubtotal,freshWeightKg,freshSubtotal,const DeepCollectionEquality().hash(_items),subtotal);

@override
String toString() {
  return 'DepartmentBilling(deptName: $deptName, billingType: $billingType, totalWeightKg: $totalWeightKg, ratePerKg: $ratePerKg, soiledWeightKg: $soiledWeightKg, soiledSubtotal: $soiledSubtotal, calculatedWeightKg: $calculatedWeightKg, calculatedSubtotal: $calculatedSubtotal, freshWeightKg: $freshWeightKg, freshSubtotal: $freshSubtotal, items: $items, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$DepartmentBillingCopyWith<$Res> implements $DepartmentBillingCopyWith<$Res> {
  factory _$DepartmentBillingCopyWith(_DepartmentBilling value, $Res Function(_DepartmentBilling) _then) = __$DepartmentBillingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dept_name') String deptName,@JsonKey(name: 'billing_type') String billingType,@JsonKey(name: 'total_weight_kg') double? totalWeightKg,@JsonKey(name: 'rate_per_kg') double? ratePerKg,@JsonKey(name: 'soiled_weight_kg') double? soiledWeightKg,@JsonKey(name: 'soiled_subtotal') double? soiledSubtotal,@JsonKey(name: 'calculated_weight_kg') double? calculatedWeightKg,@JsonKey(name: 'calculated_subtotal') double? calculatedSubtotal,@JsonKey(name: 'fresh_weight_kg') double? freshWeightKg,@JsonKey(name: 'fresh_subtotal') double? freshSubtotal, List<PieceLineItem>? items, double subtotal
});




}
/// @nodoc
class __$DepartmentBillingCopyWithImpl<$Res>
    implements _$DepartmentBillingCopyWith<$Res> {
  __$DepartmentBillingCopyWithImpl(this._self, this._then);

  final _DepartmentBilling _self;
  final $Res Function(_DepartmentBilling) _then;

/// Create a copy of DepartmentBilling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deptName = null,Object? billingType = null,Object? totalWeightKg = freezed,Object? ratePerKg = freezed,Object? soiledWeightKg = freezed,Object? soiledSubtotal = freezed,Object? calculatedWeightKg = freezed,Object? calculatedSubtotal = freezed,Object? freshWeightKg = freezed,Object? freshSubtotal = freezed,Object? items = freezed,Object? subtotal = null,}) {
  return _then(_DepartmentBilling(
deptName: null == deptName ? _self.deptName : deptName // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as String,totalWeightKg: freezed == totalWeightKg ? _self.totalWeightKg : totalWeightKg // ignore: cast_nullable_to_non_nullable
as double?,ratePerKg: freezed == ratePerKg ? _self.ratePerKg : ratePerKg // ignore: cast_nullable_to_non_nullable
as double?,soiledWeightKg: freezed == soiledWeightKg ? _self.soiledWeightKg : soiledWeightKg // ignore: cast_nullable_to_non_nullable
as double?,soiledSubtotal: freezed == soiledSubtotal ? _self.soiledSubtotal : soiledSubtotal // ignore: cast_nullable_to_non_nullable
as double?,calculatedWeightKg: freezed == calculatedWeightKg ? _self.calculatedWeightKg : calculatedWeightKg // ignore: cast_nullable_to_non_nullable
as double?,calculatedSubtotal: freezed == calculatedSubtotal ? _self.calculatedSubtotal : calculatedSubtotal // ignore: cast_nullable_to_non_nullable
as double?,freshWeightKg: freezed == freshWeightKg ? _self.freshWeightKg : freshWeightKg // ignore: cast_nullable_to_non_nullable
as double?,freshSubtotal: freezed == freshSubtotal ? _self.freshSubtotal : freshSubtotal // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PieceLineItem>?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$HotelBilling {

@JsonKey(name: 'hotel_name') String get hotelName; List<DepartmentBilling> get departments;@JsonKey(name: 'damage_liability') double get damageLiability;@JsonKey(name: 'grand_total') double get grandTotal;
/// Create a copy of HotelBilling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelBillingCopyWith<HotelBilling> get copyWith => _$HotelBillingCopyWithImpl<HotelBilling>(this as HotelBilling, _$identity);

  /// Serializes this HotelBilling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelBilling&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&const DeepCollectionEquality().equals(other.departments, departments)&&(identical(other.damageLiability, damageLiability) || other.damageLiability == damageLiability)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelName,const DeepCollectionEquality().hash(departments),damageLiability,grandTotal);

@override
String toString() {
  return 'HotelBilling(hotelName: $hotelName, departments: $departments, damageLiability: $damageLiability, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class $HotelBillingCopyWith<$Res>  {
  factory $HotelBillingCopyWith(HotelBilling value, $Res Function(HotelBilling) _then) = _$HotelBillingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotel_name') String hotelName, List<DepartmentBilling> departments,@JsonKey(name: 'damage_liability') double damageLiability,@JsonKey(name: 'grand_total') double grandTotal
});




}
/// @nodoc
class _$HotelBillingCopyWithImpl<$Res>
    implements $HotelBillingCopyWith<$Res> {
  _$HotelBillingCopyWithImpl(this._self, this._then);

  final HotelBilling _self;
  final $Res Function(HotelBilling) _then;

/// Create a copy of HotelBilling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelName = null,Object? departments = null,Object? damageLiability = null,Object? grandTotal = null,}) {
  return _then(_self.copyWith(
hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<DepartmentBilling>,damageLiability: null == damageLiability ? _self.damageLiability : damageLiability // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelBilling].
extension HotelBillingPatterns on HotelBilling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelBilling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelBilling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelBilling value)  $default,){
final _that = this;
switch (_that) {
case _HotelBilling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelBilling value)?  $default,){
final _that = this;
switch (_that) {
case _HotelBilling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_name')  String hotelName,  List<DepartmentBilling> departments, @JsonKey(name: 'damage_liability')  double damageLiability, @JsonKey(name: 'grand_total')  double grandTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelBilling() when $default != null:
return $default(_that.hotelName,_that.departments,_that.damageLiability,_that.grandTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_name')  String hotelName,  List<DepartmentBilling> departments, @JsonKey(name: 'damage_liability')  double damageLiability, @JsonKey(name: 'grand_total')  double grandTotal)  $default,) {final _that = this;
switch (_that) {
case _HotelBilling():
return $default(_that.hotelName,_that.departments,_that.damageLiability,_that.grandTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotel_name')  String hotelName,  List<DepartmentBilling> departments, @JsonKey(name: 'damage_liability')  double damageLiability, @JsonKey(name: 'grand_total')  double grandTotal)?  $default,) {final _that = this;
switch (_that) {
case _HotelBilling() when $default != null:
return $default(_that.hotelName,_that.departments,_that.damageLiability,_that.grandTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelBilling implements HotelBilling {
  const _HotelBilling({@JsonKey(name: 'hotel_name') required this.hotelName, required final  List<DepartmentBilling> departments, @JsonKey(name: 'damage_liability') required this.damageLiability, @JsonKey(name: 'grand_total') required this.grandTotal}): _departments = departments;
  factory _HotelBilling.fromJson(Map<String, dynamic> json) => _$HotelBillingFromJson(json);

@override@JsonKey(name: 'hotel_name') final  String hotelName;
 final  List<DepartmentBilling> _departments;
@override List<DepartmentBilling> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}

@override@JsonKey(name: 'damage_liability') final  double damageLiability;
@override@JsonKey(name: 'grand_total') final  double grandTotal;

/// Create a copy of HotelBilling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelBillingCopyWith<_HotelBilling> get copyWith => __$HotelBillingCopyWithImpl<_HotelBilling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelBillingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelBilling&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&const DeepCollectionEquality().equals(other._departments, _departments)&&(identical(other.damageLiability, damageLiability) || other.damageLiability == damageLiability)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelName,const DeepCollectionEquality().hash(_departments),damageLiability,grandTotal);

@override
String toString() {
  return 'HotelBilling(hotelName: $hotelName, departments: $departments, damageLiability: $damageLiability, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class _$HotelBillingCopyWith<$Res> implements $HotelBillingCopyWith<$Res> {
  factory _$HotelBillingCopyWith(_HotelBilling value, $Res Function(_HotelBilling) _then) = __$HotelBillingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotel_name') String hotelName, List<DepartmentBilling> departments,@JsonKey(name: 'damage_liability') double damageLiability,@JsonKey(name: 'grand_total') double grandTotal
});




}
/// @nodoc
class __$HotelBillingCopyWithImpl<$Res>
    implements _$HotelBillingCopyWith<$Res> {
  __$HotelBillingCopyWithImpl(this._self, this._then);

  final _HotelBilling _self;
  final $Res Function(_HotelBilling) _then;

/// Create a copy of HotelBilling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelName = null,Object? departments = null,Object? damageLiability = null,Object? grandTotal = null,}) {
  return _then(_HotelBilling(
hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<DepartmentBilling>,damageLiability: null == damageLiability ? _self.damageLiability : damageLiability // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BillingResponse {

 BillingPeriod get period; List<HotelBilling> get hotels;
/// Create a copy of BillingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingResponseCopyWith<BillingResponse> get copyWith => _$BillingResponseCopyWithImpl<BillingResponse>(this as BillingResponse, _$identity);

  /// Serializes this BillingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingResponse&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other.hotels, hotels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,const DeepCollectionEquality().hash(hotels));

@override
String toString() {
  return 'BillingResponse(period: $period, hotels: $hotels)';
}


}

/// @nodoc
abstract mixin class $BillingResponseCopyWith<$Res>  {
  factory $BillingResponseCopyWith(BillingResponse value, $Res Function(BillingResponse) _then) = _$BillingResponseCopyWithImpl;
@useResult
$Res call({
 BillingPeriod period, List<HotelBilling> hotels
});


$BillingPeriodCopyWith<$Res> get period;

}
/// @nodoc
class _$BillingResponseCopyWithImpl<$Res>
    implements $BillingResponseCopyWith<$Res> {
  _$BillingResponseCopyWithImpl(this._self, this._then);

  final BillingResponse _self;
  final $Res Function(BillingResponse) _then;

/// Create a copy of BillingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? hotels = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BillingPeriod,hotels: null == hotels ? _self.hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<HotelBilling>,
  ));
}
/// Create a copy of BillingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillingPeriodCopyWith<$Res> get period {
  
  return $BillingPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}
}


/// Adds pattern-matching-related methods to [BillingResponse].
extension BillingResponsePatterns on BillingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillingResponse value)  $default,){
final _that = this;
switch (_that) {
case _BillingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BillingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BillingPeriod period,  List<HotelBilling> hotels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillingResponse() when $default != null:
return $default(_that.period,_that.hotels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BillingPeriod period,  List<HotelBilling> hotels)  $default,) {final _that = this;
switch (_that) {
case _BillingResponse():
return $default(_that.period,_that.hotels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BillingPeriod period,  List<HotelBilling> hotels)?  $default,) {final _that = this;
switch (_that) {
case _BillingResponse() when $default != null:
return $default(_that.period,_that.hotels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillingResponse implements BillingResponse {
  const _BillingResponse({required this.period, required final  List<HotelBilling> hotels}): _hotels = hotels;
  factory _BillingResponse.fromJson(Map<String, dynamic> json) => _$BillingResponseFromJson(json);

@override final  BillingPeriod period;
 final  List<HotelBilling> _hotels;
@override List<HotelBilling> get hotels {
  if (_hotels is EqualUnmodifiableListView) return _hotels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotels);
}


/// Create a copy of BillingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillingResponseCopyWith<_BillingResponse> get copyWith => __$BillingResponseCopyWithImpl<_BillingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillingResponse&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other._hotels, _hotels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,const DeepCollectionEquality().hash(_hotels));

@override
String toString() {
  return 'BillingResponse(period: $period, hotels: $hotels)';
}


}

/// @nodoc
abstract mixin class _$BillingResponseCopyWith<$Res> implements $BillingResponseCopyWith<$Res> {
  factory _$BillingResponseCopyWith(_BillingResponse value, $Res Function(_BillingResponse) _then) = __$BillingResponseCopyWithImpl;
@override @useResult
$Res call({
 BillingPeriod period, List<HotelBilling> hotels
});


@override $BillingPeriodCopyWith<$Res> get period;

}
/// @nodoc
class __$BillingResponseCopyWithImpl<$Res>
    implements _$BillingResponseCopyWith<$Res> {
  __$BillingResponseCopyWithImpl(this._self, this._then);

  final _BillingResponse _self;
  final $Res Function(_BillingResponse) _then;

/// Create a copy of BillingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? hotels = null,}) {
  return _then(_BillingResponse(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BillingPeriod,hotels: null == hotels ? _self._hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<HotelBilling>,
  ));
}

/// Create a copy of BillingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillingPeriodCopyWith<$Res> get period {
  
  return $BillingPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}
}


/// @nodoc
mixin _$DetailedChallanItemBilling {

@JsonKey(name: 'item_name') String get itemName; int get qty; double? get rate; double? get subtotal;
/// Create a copy of DetailedChallanItemBilling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedChallanItemBillingCopyWith<DetailedChallanItemBilling> get copyWith => _$DetailedChallanItemBillingCopyWithImpl<DetailedChallanItemBilling>(this as DetailedChallanItemBilling, _$identity);

  /// Serializes this DetailedChallanItemBilling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedChallanItemBilling&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,qty,rate,subtotal);

@override
String toString() {
  return 'DetailedChallanItemBilling(itemName: $itemName, qty: $qty, rate: $rate, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $DetailedChallanItemBillingCopyWith<$Res>  {
  factory $DetailedChallanItemBillingCopyWith(DetailedChallanItemBilling value, $Res Function(DetailedChallanItemBilling) _then) = _$DetailedChallanItemBillingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_name') String itemName, int qty, double? rate, double? subtotal
});




}
/// @nodoc
class _$DetailedChallanItemBillingCopyWithImpl<$Res>
    implements $DetailedChallanItemBillingCopyWith<$Res> {
  _$DetailedChallanItemBillingCopyWithImpl(this._self, this._then);

  final DetailedChallanItemBilling _self;
  final $Res Function(DetailedChallanItemBilling) _then;

/// Create a copy of DetailedChallanItemBilling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemName = null,Object? qty = null,Object? rate = freezed,Object? subtotal = freezed,}) {
  return _then(_self.copyWith(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailedChallanItemBilling].
extension DetailedChallanItemBillingPatterns on DetailedChallanItemBilling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedChallanItemBilling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedChallanItemBilling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedChallanItemBilling value)  $default,){
final _that = this;
switch (_that) {
case _DetailedChallanItemBilling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedChallanItemBilling value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedChallanItemBilling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_name')  String itemName,  int qty,  double? rate,  double? subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedChallanItemBilling() when $default != null:
return $default(_that.itemName,_that.qty,_that.rate,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_name')  String itemName,  int qty,  double? rate,  double? subtotal)  $default,) {final _that = this;
switch (_that) {
case _DetailedChallanItemBilling():
return $default(_that.itemName,_that.qty,_that.rate,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_name')  String itemName,  int qty,  double? rate,  double? subtotal)?  $default,) {final _that = this;
switch (_that) {
case _DetailedChallanItemBilling() when $default != null:
return $default(_that.itemName,_that.qty,_that.rate,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedChallanItemBilling implements DetailedChallanItemBilling {
  const _DetailedChallanItemBilling({@JsonKey(name: 'item_name') required this.itemName, required this.qty, this.rate, this.subtotal});
  factory _DetailedChallanItemBilling.fromJson(Map<String, dynamic> json) => _$DetailedChallanItemBillingFromJson(json);

@override@JsonKey(name: 'item_name') final  String itemName;
@override final  int qty;
@override final  double? rate;
@override final  double? subtotal;

/// Create a copy of DetailedChallanItemBilling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedChallanItemBillingCopyWith<_DetailedChallanItemBilling> get copyWith => __$DetailedChallanItemBillingCopyWithImpl<_DetailedChallanItemBilling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedChallanItemBillingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedChallanItemBilling&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,qty,rate,subtotal);

@override
String toString() {
  return 'DetailedChallanItemBilling(itemName: $itemName, qty: $qty, rate: $rate, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$DetailedChallanItemBillingCopyWith<$Res> implements $DetailedChallanItemBillingCopyWith<$Res> {
  factory _$DetailedChallanItemBillingCopyWith(_DetailedChallanItemBilling value, $Res Function(_DetailedChallanItemBilling) _then) = __$DetailedChallanItemBillingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_name') String itemName, int qty, double? rate, double? subtotal
});




}
/// @nodoc
class __$DetailedChallanItemBillingCopyWithImpl<$Res>
    implements _$DetailedChallanItemBillingCopyWith<$Res> {
  __$DetailedChallanItemBillingCopyWithImpl(this._self, this._then);

  final _DetailedChallanItemBilling _self;
  final $Res Function(_DetailedChallanItemBilling) _then;

/// Create a copy of DetailedChallanItemBilling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemName = null,Object? qty = null,Object? rate = freezed,Object? subtotal = freezed,}) {
  return _then(_DetailedChallanItemBilling(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$DetailedChallanDeptBilling {

@JsonKey(name: 'dept_name') String get deptName;@JsonKey(name: 'billing_type') String get billingType;@JsonKey(name: 'soiled_weight_kg') double? get soiledWeightKg;@JsonKey(name: 'fresh_weight_kg') double? get freshWeightKg;@JsonKey(name: 'calculated_weight_kg') double? get calculatedWeightKg;@JsonKey(name: 'rate_per_kg') double? get ratePerKg; List<DetailedChallanItemBilling>? get items; double get subtotal;
/// Create a copy of DetailedChallanDeptBilling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedChallanDeptBillingCopyWith<DetailedChallanDeptBilling> get copyWith => _$DetailedChallanDeptBillingCopyWithImpl<DetailedChallanDeptBilling>(this as DetailedChallanDeptBilling, _$identity);

  /// Serializes this DetailedChallanDeptBilling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedChallanDeptBilling&&(identical(other.deptName, deptName) || other.deptName == deptName)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.soiledWeightKg, soiledWeightKg) || other.soiledWeightKg == soiledWeightKg)&&(identical(other.freshWeightKg, freshWeightKg) || other.freshWeightKg == freshWeightKg)&&(identical(other.calculatedWeightKg, calculatedWeightKg) || other.calculatedWeightKg == calculatedWeightKg)&&(identical(other.ratePerKg, ratePerKg) || other.ratePerKg == ratePerKg)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptName,billingType,soiledWeightKg,freshWeightKg,calculatedWeightKg,ratePerKg,const DeepCollectionEquality().hash(items),subtotal);

@override
String toString() {
  return 'DetailedChallanDeptBilling(deptName: $deptName, billingType: $billingType, soiledWeightKg: $soiledWeightKg, freshWeightKg: $freshWeightKg, calculatedWeightKg: $calculatedWeightKg, ratePerKg: $ratePerKg, items: $items, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $DetailedChallanDeptBillingCopyWith<$Res>  {
  factory $DetailedChallanDeptBillingCopyWith(DetailedChallanDeptBilling value, $Res Function(DetailedChallanDeptBilling) _then) = _$DetailedChallanDeptBillingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dept_name') String deptName,@JsonKey(name: 'billing_type') String billingType,@JsonKey(name: 'soiled_weight_kg') double? soiledWeightKg,@JsonKey(name: 'fresh_weight_kg') double? freshWeightKg,@JsonKey(name: 'calculated_weight_kg') double? calculatedWeightKg,@JsonKey(name: 'rate_per_kg') double? ratePerKg, List<DetailedChallanItemBilling>? items, double subtotal
});




}
/// @nodoc
class _$DetailedChallanDeptBillingCopyWithImpl<$Res>
    implements $DetailedChallanDeptBillingCopyWith<$Res> {
  _$DetailedChallanDeptBillingCopyWithImpl(this._self, this._then);

  final DetailedChallanDeptBilling _self;
  final $Res Function(DetailedChallanDeptBilling) _then;

/// Create a copy of DetailedChallanDeptBilling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deptName = null,Object? billingType = null,Object? soiledWeightKg = freezed,Object? freshWeightKg = freezed,Object? calculatedWeightKg = freezed,Object? ratePerKg = freezed,Object? items = freezed,Object? subtotal = null,}) {
  return _then(_self.copyWith(
deptName: null == deptName ? _self.deptName : deptName // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as String,soiledWeightKg: freezed == soiledWeightKg ? _self.soiledWeightKg : soiledWeightKg // ignore: cast_nullable_to_non_nullable
as double?,freshWeightKg: freezed == freshWeightKg ? _self.freshWeightKg : freshWeightKg // ignore: cast_nullable_to_non_nullable
as double?,calculatedWeightKg: freezed == calculatedWeightKg ? _self.calculatedWeightKg : calculatedWeightKg // ignore: cast_nullable_to_non_nullable
as double?,ratePerKg: freezed == ratePerKg ? _self.ratePerKg : ratePerKg // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DetailedChallanItemBilling>?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailedChallanDeptBilling].
extension DetailedChallanDeptBillingPatterns on DetailedChallanDeptBilling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedChallanDeptBilling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedChallanDeptBilling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedChallanDeptBilling value)  $default,){
final _that = this;
switch (_that) {
case _DetailedChallanDeptBilling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedChallanDeptBilling value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedChallanDeptBilling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'billing_type')  String billingType, @JsonKey(name: 'soiled_weight_kg')  double? soiledWeightKg, @JsonKey(name: 'fresh_weight_kg')  double? freshWeightKg, @JsonKey(name: 'calculated_weight_kg')  double? calculatedWeightKg, @JsonKey(name: 'rate_per_kg')  double? ratePerKg,  List<DetailedChallanItemBilling>? items,  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedChallanDeptBilling() when $default != null:
return $default(_that.deptName,_that.billingType,_that.soiledWeightKg,_that.freshWeightKg,_that.calculatedWeightKg,_that.ratePerKg,_that.items,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'billing_type')  String billingType, @JsonKey(name: 'soiled_weight_kg')  double? soiledWeightKg, @JsonKey(name: 'fresh_weight_kg')  double? freshWeightKg, @JsonKey(name: 'calculated_weight_kg')  double? calculatedWeightKg, @JsonKey(name: 'rate_per_kg')  double? ratePerKg,  List<DetailedChallanItemBilling>? items,  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _DetailedChallanDeptBilling():
return $default(_that.deptName,_that.billingType,_that.soiledWeightKg,_that.freshWeightKg,_that.calculatedWeightKg,_that.ratePerKg,_that.items,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'billing_type')  String billingType, @JsonKey(name: 'soiled_weight_kg')  double? soiledWeightKg, @JsonKey(name: 'fresh_weight_kg')  double? freshWeightKg, @JsonKey(name: 'calculated_weight_kg')  double? calculatedWeightKg, @JsonKey(name: 'rate_per_kg')  double? ratePerKg,  List<DetailedChallanItemBilling>? items,  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _DetailedChallanDeptBilling() when $default != null:
return $default(_that.deptName,_that.billingType,_that.soiledWeightKg,_that.freshWeightKg,_that.calculatedWeightKg,_that.ratePerKg,_that.items,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedChallanDeptBilling implements DetailedChallanDeptBilling {
  const _DetailedChallanDeptBilling({@JsonKey(name: 'dept_name') required this.deptName, @JsonKey(name: 'billing_type') required this.billingType, @JsonKey(name: 'soiled_weight_kg') this.soiledWeightKg, @JsonKey(name: 'fresh_weight_kg') this.freshWeightKg, @JsonKey(name: 'calculated_weight_kg') this.calculatedWeightKg, @JsonKey(name: 'rate_per_kg') this.ratePerKg, final  List<DetailedChallanItemBilling>? items, required this.subtotal}): _items = items;
  factory _DetailedChallanDeptBilling.fromJson(Map<String, dynamic> json) => _$DetailedChallanDeptBillingFromJson(json);

@override@JsonKey(name: 'dept_name') final  String deptName;
@override@JsonKey(name: 'billing_type') final  String billingType;
@override@JsonKey(name: 'soiled_weight_kg') final  double? soiledWeightKg;
@override@JsonKey(name: 'fresh_weight_kg') final  double? freshWeightKg;
@override@JsonKey(name: 'calculated_weight_kg') final  double? calculatedWeightKg;
@override@JsonKey(name: 'rate_per_kg') final  double? ratePerKg;
 final  List<DetailedChallanItemBilling>? _items;
@override List<DetailedChallanItemBilling>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double subtotal;

/// Create a copy of DetailedChallanDeptBilling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedChallanDeptBillingCopyWith<_DetailedChallanDeptBilling> get copyWith => __$DetailedChallanDeptBillingCopyWithImpl<_DetailedChallanDeptBilling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedChallanDeptBillingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedChallanDeptBilling&&(identical(other.deptName, deptName) || other.deptName == deptName)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.soiledWeightKg, soiledWeightKg) || other.soiledWeightKg == soiledWeightKg)&&(identical(other.freshWeightKg, freshWeightKg) || other.freshWeightKg == freshWeightKg)&&(identical(other.calculatedWeightKg, calculatedWeightKg) || other.calculatedWeightKg == calculatedWeightKg)&&(identical(other.ratePerKg, ratePerKg) || other.ratePerKg == ratePerKg)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptName,billingType,soiledWeightKg,freshWeightKg,calculatedWeightKg,ratePerKg,const DeepCollectionEquality().hash(_items),subtotal);

@override
String toString() {
  return 'DetailedChallanDeptBilling(deptName: $deptName, billingType: $billingType, soiledWeightKg: $soiledWeightKg, freshWeightKg: $freshWeightKg, calculatedWeightKg: $calculatedWeightKg, ratePerKg: $ratePerKg, items: $items, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$DetailedChallanDeptBillingCopyWith<$Res> implements $DetailedChallanDeptBillingCopyWith<$Res> {
  factory _$DetailedChallanDeptBillingCopyWith(_DetailedChallanDeptBilling value, $Res Function(_DetailedChallanDeptBilling) _then) = __$DetailedChallanDeptBillingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dept_name') String deptName,@JsonKey(name: 'billing_type') String billingType,@JsonKey(name: 'soiled_weight_kg') double? soiledWeightKg,@JsonKey(name: 'fresh_weight_kg') double? freshWeightKg,@JsonKey(name: 'calculated_weight_kg') double? calculatedWeightKg,@JsonKey(name: 'rate_per_kg') double? ratePerKg, List<DetailedChallanItemBilling>? items, double subtotal
});




}
/// @nodoc
class __$DetailedChallanDeptBillingCopyWithImpl<$Res>
    implements _$DetailedChallanDeptBillingCopyWith<$Res> {
  __$DetailedChallanDeptBillingCopyWithImpl(this._self, this._then);

  final _DetailedChallanDeptBilling _self;
  final $Res Function(_DetailedChallanDeptBilling) _then;

/// Create a copy of DetailedChallanDeptBilling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deptName = null,Object? billingType = null,Object? soiledWeightKg = freezed,Object? freshWeightKg = freezed,Object? calculatedWeightKg = freezed,Object? ratePerKg = freezed,Object? items = freezed,Object? subtotal = null,}) {
  return _then(_DetailedChallanDeptBilling(
deptName: null == deptName ? _self.deptName : deptName // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as String,soiledWeightKg: freezed == soiledWeightKg ? _self.soiledWeightKg : soiledWeightKg // ignore: cast_nullable_to_non_nullable
as double?,freshWeightKg: freezed == freshWeightKg ? _self.freshWeightKg : freshWeightKg // ignore: cast_nullable_to_non_nullable
as double?,calculatedWeightKg: freezed == calculatedWeightKg ? _self.calculatedWeightKg : calculatedWeightKg // ignore: cast_nullable_to_non_nullable
as double?,ratePerKg: freezed == ratePerKg ? _self.ratePerKg : ratePerKg // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DetailedChallanItemBilling>?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DetailedChallanBilling {

@JsonKey(name: 'challan_number') String get challanNumber;@JsonKey(name: 'challan_type') String get challanType;@JsonKey(name: 'entry_timestamp') DateTime get entryTimestamp;@JsonKey(name: 'agent_name') String? get agentName; List<DetailedChallanDeptBilling> get departments;@JsonKey(name: 'challan_total') double get challanTotal;
/// Create a copy of DetailedChallanBilling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedChallanBillingCopyWith<DetailedChallanBilling> get copyWith => _$DetailedChallanBillingCopyWithImpl<DetailedChallanBilling>(this as DetailedChallanBilling, _$identity);

  /// Serializes this DetailedChallanBilling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedChallanBilling&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&const DeepCollectionEquality().equals(other.departments, departments)&&(identical(other.challanTotal, challanTotal) || other.challanTotal == challanTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanNumber,challanType,entryTimestamp,agentName,const DeepCollectionEquality().hash(departments),challanTotal);

@override
String toString() {
  return 'DetailedChallanBilling(challanNumber: $challanNumber, challanType: $challanType, entryTimestamp: $entryTimestamp, agentName: $agentName, departments: $departments, challanTotal: $challanTotal)';
}


}

/// @nodoc
abstract mixin class $DetailedChallanBillingCopyWith<$Res>  {
  factory $DetailedChallanBillingCopyWith(DetailedChallanBilling value, $Res Function(DetailedChallanBilling) _then) = _$DetailedChallanBillingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp,@JsonKey(name: 'agent_name') String? agentName, List<DetailedChallanDeptBilling> departments,@JsonKey(name: 'challan_total') double challanTotal
});




}
/// @nodoc
class _$DetailedChallanBillingCopyWithImpl<$Res>
    implements $DetailedChallanBillingCopyWith<$Res> {
  _$DetailedChallanBillingCopyWithImpl(this._self, this._then);

  final DetailedChallanBilling _self;
  final $Res Function(DetailedChallanBilling) _then;

/// Create a copy of DetailedChallanBilling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challanNumber = null,Object? challanType = null,Object? entryTimestamp = null,Object? agentName = freezed,Object? departments = null,Object? challanTotal = null,}) {
  return _then(_self.copyWith(
challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<DetailedChallanDeptBilling>,challanTotal: null == challanTotal ? _self.challanTotal : challanTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailedChallanBilling].
extension DetailedChallanBillingPatterns on DetailedChallanBilling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedChallanBilling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedChallanBilling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedChallanBilling value)  $default,){
final _that = this;
switch (_that) {
case _DetailedChallanBilling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedChallanBilling value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedChallanBilling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp, @JsonKey(name: 'agent_name')  String? agentName,  List<DetailedChallanDeptBilling> departments, @JsonKey(name: 'challan_total')  double challanTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedChallanBilling() when $default != null:
return $default(_that.challanNumber,_that.challanType,_that.entryTimestamp,_that.agentName,_that.departments,_that.challanTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp, @JsonKey(name: 'agent_name')  String? agentName,  List<DetailedChallanDeptBilling> departments, @JsonKey(name: 'challan_total')  double challanTotal)  $default,) {final _that = this;
switch (_that) {
case _DetailedChallanBilling():
return $default(_that.challanNumber,_that.challanType,_that.entryTimestamp,_that.agentName,_that.departments,_that.challanTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp, @JsonKey(name: 'agent_name')  String? agentName,  List<DetailedChallanDeptBilling> departments, @JsonKey(name: 'challan_total')  double challanTotal)?  $default,) {final _that = this;
switch (_that) {
case _DetailedChallanBilling() when $default != null:
return $default(_that.challanNumber,_that.challanType,_that.entryTimestamp,_that.agentName,_that.departments,_that.challanTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedChallanBilling implements DetailedChallanBilling {
  const _DetailedChallanBilling({@JsonKey(name: 'challan_number') required this.challanNumber, @JsonKey(name: 'challan_type') required this.challanType, @JsonKey(name: 'entry_timestamp') required this.entryTimestamp, @JsonKey(name: 'agent_name') this.agentName, required final  List<DetailedChallanDeptBilling> departments, @JsonKey(name: 'challan_total') required this.challanTotal}): _departments = departments;
  factory _DetailedChallanBilling.fromJson(Map<String, dynamic> json) => _$DetailedChallanBillingFromJson(json);

@override@JsonKey(name: 'challan_number') final  String challanNumber;
@override@JsonKey(name: 'challan_type') final  String challanType;
@override@JsonKey(name: 'entry_timestamp') final  DateTime entryTimestamp;
@override@JsonKey(name: 'agent_name') final  String? agentName;
 final  List<DetailedChallanDeptBilling> _departments;
@override List<DetailedChallanDeptBilling> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}

@override@JsonKey(name: 'challan_total') final  double challanTotal;

/// Create a copy of DetailedChallanBilling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedChallanBillingCopyWith<_DetailedChallanBilling> get copyWith => __$DetailedChallanBillingCopyWithImpl<_DetailedChallanBilling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedChallanBillingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedChallanBilling&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&const DeepCollectionEquality().equals(other._departments, _departments)&&(identical(other.challanTotal, challanTotal) || other.challanTotal == challanTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanNumber,challanType,entryTimestamp,agentName,const DeepCollectionEquality().hash(_departments),challanTotal);

@override
String toString() {
  return 'DetailedChallanBilling(challanNumber: $challanNumber, challanType: $challanType, entryTimestamp: $entryTimestamp, agentName: $agentName, departments: $departments, challanTotal: $challanTotal)';
}


}

/// @nodoc
abstract mixin class _$DetailedChallanBillingCopyWith<$Res> implements $DetailedChallanBillingCopyWith<$Res> {
  factory _$DetailedChallanBillingCopyWith(_DetailedChallanBilling value, $Res Function(_DetailedChallanBilling) _then) = __$DetailedChallanBillingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp,@JsonKey(name: 'agent_name') String? agentName, List<DetailedChallanDeptBilling> departments,@JsonKey(name: 'challan_total') double challanTotal
});




}
/// @nodoc
class __$DetailedChallanBillingCopyWithImpl<$Res>
    implements _$DetailedChallanBillingCopyWith<$Res> {
  __$DetailedChallanBillingCopyWithImpl(this._self, this._then);

  final _DetailedChallanBilling _self;
  final $Res Function(_DetailedChallanBilling) _then;

/// Create a copy of DetailedChallanBilling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challanNumber = null,Object? challanType = null,Object? entryTimestamp = null,Object? agentName = freezed,Object? departments = null,Object? challanTotal = null,}) {
  return _then(_DetailedChallanBilling(
challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<DetailedChallanDeptBilling>,challanTotal: null == challanTotal ? _self.challanTotal : challanTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DetailedHotelBilling {

@JsonKey(name: 'hotel_name') String get hotelName; List<DetailedChallanBilling> get challans;@JsonKey(name: 'damage_liability') double get damageLiability;@JsonKey(name: 'grand_total') double get grandTotal;
/// Create a copy of DetailedHotelBilling
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedHotelBillingCopyWith<DetailedHotelBilling> get copyWith => _$DetailedHotelBillingCopyWithImpl<DetailedHotelBilling>(this as DetailedHotelBilling, _$identity);

  /// Serializes this DetailedHotelBilling to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedHotelBilling&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&const DeepCollectionEquality().equals(other.challans, challans)&&(identical(other.damageLiability, damageLiability) || other.damageLiability == damageLiability)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelName,const DeepCollectionEquality().hash(challans),damageLiability,grandTotal);

@override
String toString() {
  return 'DetailedHotelBilling(hotelName: $hotelName, challans: $challans, damageLiability: $damageLiability, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class $DetailedHotelBillingCopyWith<$Res>  {
  factory $DetailedHotelBillingCopyWith(DetailedHotelBilling value, $Res Function(DetailedHotelBilling) _then) = _$DetailedHotelBillingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotel_name') String hotelName, List<DetailedChallanBilling> challans,@JsonKey(name: 'damage_liability') double damageLiability,@JsonKey(name: 'grand_total') double grandTotal
});




}
/// @nodoc
class _$DetailedHotelBillingCopyWithImpl<$Res>
    implements $DetailedHotelBillingCopyWith<$Res> {
  _$DetailedHotelBillingCopyWithImpl(this._self, this._then);

  final DetailedHotelBilling _self;
  final $Res Function(DetailedHotelBilling) _then;

/// Create a copy of DetailedHotelBilling
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelName = null,Object? challans = null,Object? damageLiability = null,Object? grandTotal = null,}) {
  return _then(_self.copyWith(
hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,challans: null == challans ? _self.challans : challans // ignore: cast_nullable_to_non_nullable
as List<DetailedChallanBilling>,damageLiability: null == damageLiability ? _self.damageLiability : damageLiability // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailedHotelBilling].
extension DetailedHotelBillingPatterns on DetailedHotelBilling {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedHotelBilling value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedHotelBilling() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedHotelBilling value)  $default,){
final _that = this;
switch (_that) {
case _DetailedHotelBilling():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedHotelBilling value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedHotelBilling() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_name')  String hotelName,  List<DetailedChallanBilling> challans, @JsonKey(name: 'damage_liability')  double damageLiability, @JsonKey(name: 'grand_total')  double grandTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedHotelBilling() when $default != null:
return $default(_that.hotelName,_that.challans,_that.damageLiability,_that.grandTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_name')  String hotelName,  List<DetailedChallanBilling> challans, @JsonKey(name: 'damage_liability')  double damageLiability, @JsonKey(name: 'grand_total')  double grandTotal)  $default,) {final _that = this;
switch (_that) {
case _DetailedHotelBilling():
return $default(_that.hotelName,_that.challans,_that.damageLiability,_that.grandTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotel_name')  String hotelName,  List<DetailedChallanBilling> challans, @JsonKey(name: 'damage_liability')  double damageLiability, @JsonKey(name: 'grand_total')  double grandTotal)?  $default,) {final _that = this;
switch (_that) {
case _DetailedHotelBilling() when $default != null:
return $default(_that.hotelName,_that.challans,_that.damageLiability,_that.grandTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedHotelBilling implements DetailedHotelBilling {
  const _DetailedHotelBilling({@JsonKey(name: 'hotel_name') required this.hotelName, required final  List<DetailedChallanBilling> challans, @JsonKey(name: 'damage_liability') required this.damageLiability, @JsonKey(name: 'grand_total') required this.grandTotal}): _challans = challans;
  factory _DetailedHotelBilling.fromJson(Map<String, dynamic> json) => _$DetailedHotelBillingFromJson(json);

@override@JsonKey(name: 'hotel_name') final  String hotelName;
 final  List<DetailedChallanBilling> _challans;
@override List<DetailedChallanBilling> get challans {
  if (_challans is EqualUnmodifiableListView) return _challans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challans);
}

@override@JsonKey(name: 'damage_liability') final  double damageLiability;
@override@JsonKey(name: 'grand_total') final  double grandTotal;

/// Create a copy of DetailedHotelBilling
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedHotelBillingCopyWith<_DetailedHotelBilling> get copyWith => __$DetailedHotelBillingCopyWithImpl<_DetailedHotelBilling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedHotelBillingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedHotelBilling&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&const DeepCollectionEquality().equals(other._challans, _challans)&&(identical(other.damageLiability, damageLiability) || other.damageLiability == damageLiability)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelName,const DeepCollectionEquality().hash(_challans),damageLiability,grandTotal);

@override
String toString() {
  return 'DetailedHotelBilling(hotelName: $hotelName, challans: $challans, damageLiability: $damageLiability, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class _$DetailedHotelBillingCopyWith<$Res> implements $DetailedHotelBillingCopyWith<$Res> {
  factory _$DetailedHotelBillingCopyWith(_DetailedHotelBilling value, $Res Function(_DetailedHotelBilling) _then) = __$DetailedHotelBillingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotel_name') String hotelName, List<DetailedChallanBilling> challans,@JsonKey(name: 'damage_liability') double damageLiability,@JsonKey(name: 'grand_total') double grandTotal
});




}
/// @nodoc
class __$DetailedHotelBillingCopyWithImpl<$Res>
    implements _$DetailedHotelBillingCopyWith<$Res> {
  __$DetailedHotelBillingCopyWithImpl(this._self, this._then);

  final _DetailedHotelBilling _self;
  final $Res Function(_DetailedHotelBilling) _then;

/// Create a copy of DetailedHotelBilling
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelName = null,Object? challans = null,Object? damageLiability = null,Object? grandTotal = null,}) {
  return _then(_DetailedHotelBilling(
hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,challans: null == challans ? _self._challans : challans // ignore: cast_nullable_to_non_nullable
as List<DetailedChallanBilling>,damageLiability: null == damageLiability ? _self.damageLiability : damageLiability // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DetailedBillingResponse {

 BillingPeriod get period; List<DetailedHotelBilling> get hotels;
/// Create a copy of DetailedBillingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedBillingResponseCopyWith<DetailedBillingResponse> get copyWith => _$DetailedBillingResponseCopyWithImpl<DetailedBillingResponse>(this as DetailedBillingResponse, _$identity);

  /// Serializes this DetailedBillingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedBillingResponse&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other.hotels, hotels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,const DeepCollectionEquality().hash(hotels));

@override
String toString() {
  return 'DetailedBillingResponse(period: $period, hotels: $hotels)';
}


}

/// @nodoc
abstract mixin class $DetailedBillingResponseCopyWith<$Res>  {
  factory $DetailedBillingResponseCopyWith(DetailedBillingResponse value, $Res Function(DetailedBillingResponse) _then) = _$DetailedBillingResponseCopyWithImpl;
@useResult
$Res call({
 BillingPeriod period, List<DetailedHotelBilling> hotels
});


$BillingPeriodCopyWith<$Res> get period;

}
/// @nodoc
class _$DetailedBillingResponseCopyWithImpl<$Res>
    implements $DetailedBillingResponseCopyWith<$Res> {
  _$DetailedBillingResponseCopyWithImpl(this._self, this._then);

  final DetailedBillingResponse _self;
  final $Res Function(DetailedBillingResponse) _then;

/// Create a copy of DetailedBillingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? hotels = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BillingPeriod,hotels: null == hotels ? _self.hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<DetailedHotelBilling>,
  ));
}
/// Create a copy of DetailedBillingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillingPeriodCopyWith<$Res> get period {
  
  return $BillingPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailedBillingResponse].
extension DetailedBillingResponsePatterns on DetailedBillingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedBillingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedBillingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedBillingResponse value)  $default,){
final _that = this;
switch (_that) {
case _DetailedBillingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedBillingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedBillingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BillingPeriod period,  List<DetailedHotelBilling> hotels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedBillingResponse() when $default != null:
return $default(_that.period,_that.hotels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BillingPeriod period,  List<DetailedHotelBilling> hotels)  $default,) {final _that = this;
switch (_that) {
case _DetailedBillingResponse():
return $default(_that.period,_that.hotels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BillingPeriod period,  List<DetailedHotelBilling> hotels)?  $default,) {final _that = this;
switch (_that) {
case _DetailedBillingResponse() when $default != null:
return $default(_that.period,_that.hotels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedBillingResponse implements DetailedBillingResponse {
  const _DetailedBillingResponse({required this.period, required final  List<DetailedHotelBilling> hotels}): _hotels = hotels;
  factory _DetailedBillingResponse.fromJson(Map<String, dynamic> json) => _$DetailedBillingResponseFromJson(json);

@override final  BillingPeriod period;
 final  List<DetailedHotelBilling> _hotels;
@override List<DetailedHotelBilling> get hotels {
  if (_hotels is EqualUnmodifiableListView) return _hotels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotels);
}


/// Create a copy of DetailedBillingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedBillingResponseCopyWith<_DetailedBillingResponse> get copyWith => __$DetailedBillingResponseCopyWithImpl<_DetailedBillingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedBillingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedBillingResponse&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other._hotels, _hotels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,const DeepCollectionEquality().hash(_hotels));

@override
String toString() {
  return 'DetailedBillingResponse(period: $period, hotels: $hotels)';
}


}

/// @nodoc
abstract mixin class _$DetailedBillingResponseCopyWith<$Res> implements $DetailedBillingResponseCopyWith<$Res> {
  factory _$DetailedBillingResponseCopyWith(_DetailedBillingResponse value, $Res Function(_DetailedBillingResponse) _then) = __$DetailedBillingResponseCopyWithImpl;
@override @useResult
$Res call({
 BillingPeriod period, List<DetailedHotelBilling> hotels
});


@override $BillingPeriodCopyWith<$Res> get period;

}
/// @nodoc
class __$DetailedBillingResponseCopyWithImpl<$Res>
    implements _$DetailedBillingResponseCopyWith<$Res> {
  __$DetailedBillingResponseCopyWithImpl(this._self, this._then);

  final _DetailedBillingResponse _self;
  final $Res Function(_DetailedBillingResponse) _then;

/// Create a copy of DetailedBillingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? hotels = null,}) {
  return _then(_DetailedBillingResponse(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BillingPeriod,hotels: null == hotels ? _self._hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<DetailedHotelBilling>,
  ));
}

/// Create a copy of DetailedBillingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillingPeriodCopyWith<$Res> get period {
  
  return $BillingPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}
}

// dart format on
