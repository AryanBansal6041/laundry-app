// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challan_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallanItemPayload {

@JsonKey(name: 'item_id') String get itemId; int get qty;@JsonKey(name: 'damaged_qty') int get damagedQty;
/// Create a copy of ChallanItemPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallanItemPayloadCopyWith<ChallanItemPayload> get copyWith => _$ChallanItemPayloadCopyWithImpl<ChallanItemPayload>(this as ChallanItemPayload, _$identity);

  /// Serializes this ChallanItemPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallanItemPayload&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.damagedQty, damagedQty) || other.damagedQty == damagedQty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,qty,damagedQty);

@override
String toString() {
  return 'ChallanItemPayload(itemId: $itemId, qty: $qty, damagedQty: $damagedQty)';
}


}

/// @nodoc
abstract mixin class $ChallanItemPayloadCopyWith<$Res>  {
  factory $ChallanItemPayloadCopyWith(ChallanItemPayload value, $Res Function(ChallanItemPayload) _then) = _$ChallanItemPayloadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_id') String itemId, int qty,@JsonKey(name: 'damaged_qty') int damagedQty
});




}
/// @nodoc
class _$ChallanItemPayloadCopyWithImpl<$Res>
    implements $ChallanItemPayloadCopyWith<$Res> {
  _$ChallanItemPayloadCopyWithImpl(this._self, this._then);

  final ChallanItemPayload _self;
  final $Res Function(ChallanItemPayload) _then;

/// Create a copy of ChallanItemPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? qty = null,Object? damagedQty = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,damagedQty: null == damagedQty ? _self.damagedQty : damagedQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallanItemPayload].
extension ChallanItemPayloadPatterns on ChallanItemPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallanItemPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallanItemPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallanItemPayload value)  $default,){
final _that = this;
switch (_that) {
case _ChallanItemPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallanItemPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ChallanItemPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId,  int qty, @JsonKey(name: 'damaged_qty')  int damagedQty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallanItemPayload() when $default != null:
return $default(_that.itemId,_that.qty,_that.damagedQty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId,  int qty, @JsonKey(name: 'damaged_qty')  int damagedQty)  $default,) {final _that = this;
switch (_that) {
case _ChallanItemPayload():
return $default(_that.itemId,_that.qty,_that.damagedQty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_id')  String itemId,  int qty, @JsonKey(name: 'damaged_qty')  int damagedQty)?  $default,) {final _that = this;
switch (_that) {
case _ChallanItemPayload() when $default != null:
return $default(_that.itemId,_that.qty,_that.damagedQty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallanItemPayload implements ChallanItemPayload {
  const _ChallanItemPayload({@JsonKey(name: 'item_id') required this.itemId, required this.qty, @JsonKey(name: 'damaged_qty') this.damagedQty = 0});
  factory _ChallanItemPayload.fromJson(Map<String, dynamic> json) => _$ChallanItemPayloadFromJson(json);

@override@JsonKey(name: 'item_id') final  String itemId;
@override final  int qty;
@override@JsonKey(name: 'damaged_qty') final  int damagedQty;

/// Create a copy of ChallanItemPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallanItemPayloadCopyWith<_ChallanItemPayload> get copyWith => __$ChallanItemPayloadCopyWithImpl<_ChallanItemPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallanItemPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallanItemPayload&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.damagedQty, damagedQty) || other.damagedQty == damagedQty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,qty,damagedQty);

@override
String toString() {
  return 'ChallanItemPayload(itemId: $itemId, qty: $qty, damagedQty: $damagedQty)';
}


}

/// @nodoc
abstract mixin class _$ChallanItemPayloadCopyWith<$Res> implements $ChallanItemPayloadCopyWith<$Res> {
  factory _$ChallanItemPayloadCopyWith(_ChallanItemPayload value, $Res Function(_ChallanItemPayload) _then) = __$ChallanItemPayloadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_id') String itemId, int qty,@JsonKey(name: 'damaged_qty') int damagedQty
});




}
/// @nodoc
class __$ChallanItemPayloadCopyWithImpl<$Res>
    implements _$ChallanItemPayloadCopyWith<$Res> {
  __$ChallanItemPayloadCopyWithImpl(this._self, this._then);

  final _ChallanItemPayload _self;
  final $Res Function(_ChallanItemPayload) _then;

/// Create a copy of ChallanItemPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? qty = null,Object? damagedQty = null,}) {
  return _then(_ChallanItemPayload(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,damagedQty: null == damagedQty ? _self.damagedQty : damagedQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChallanDeptPayload {

@JsonKey(name: 'dept_id') String get deptId;@JsonKey(name: 'soiled_weight') double? get soiledWeight;@JsonKey(name: 'fresh_weight') double? get freshWeight; List<ChallanItemPayload> get items;
/// Create a copy of ChallanDeptPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallanDeptPayloadCopyWith<ChallanDeptPayload> get copyWith => _$ChallanDeptPayloadCopyWithImpl<ChallanDeptPayload>(this as ChallanDeptPayload, _$identity);

  /// Serializes this ChallanDeptPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallanDeptPayload&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.soiledWeight, soiledWeight) || other.soiledWeight == soiledWeight)&&(identical(other.freshWeight, freshWeight) || other.freshWeight == freshWeight)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptId,soiledWeight,freshWeight,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ChallanDeptPayload(deptId: $deptId, soiledWeight: $soiledWeight, freshWeight: $freshWeight, items: $items)';
}


}

/// @nodoc
abstract mixin class $ChallanDeptPayloadCopyWith<$Res>  {
  factory $ChallanDeptPayloadCopyWith(ChallanDeptPayload value, $Res Function(ChallanDeptPayload) _then) = _$ChallanDeptPayloadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dept_id') String deptId,@JsonKey(name: 'soiled_weight') double? soiledWeight,@JsonKey(name: 'fresh_weight') double? freshWeight, List<ChallanItemPayload> items
});




}
/// @nodoc
class _$ChallanDeptPayloadCopyWithImpl<$Res>
    implements $ChallanDeptPayloadCopyWith<$Res> {
  _$ChallanDeptPayloadCopyWithImpl(this._self, this._then);

  final ChallanDeptPayload _self;
  final $Res Function(ChallanDeptPayload) _then;

/// Create a copy of ChallanDeptPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deptId = null,Object? soiledWeight = freezed,Object? freshWeight = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,soiledWeight: freezed == soiledWeight ? _self.soiledWeight : soiledWeight // ignore: cast_nullable_to_non_nullable
as double?,freshWeight: freezed == freshWeight ? _self.freshWeight : freshWeight // ignore: cast_nullable_to_non_nullable
as double?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChallanItemPayload>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallanDeptPayload].
extension ChallanDeptPayloadPatterns on ChallanDeptPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallanDeptPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallanDeptPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallanDeptPayload value)  $default,){
final _that = this;
switch (_that) {
case _ChallanDeptPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallanDeptPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ChallanDeptPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'soiled_weight')  double? soiledWeight, @JsonKey(name: 'fresh_weight')  double? freshWeight,  List<ChallanItemPayload> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallanDeptPayload() when $default != null:
return $default(_that.deptId,_that.soiledWeight,_that.freshWeight,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'soiled_weight')  double? soiledWeight, @JsonKey(name: 'fresh_weight')  double? freshWeight,  List<ChallanItemPayload> items)  $default,) {final _that = this;
switch (_that) {
case _ChallanDeptPayload():
return $default(_that.deptId,_that.soiledWeight,_that.freshWeight,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'soiled_weight')  double? soiledWeight, @JsonKey(name: 'fresh_weight')  double? freshWeight,  List<ChallanItemPayload> items)?  $default,) {final _that = this;
switch (_that) {
case _ChallanDeptPayload() when $default != null:
return $default(_that.deptId,_that.soiledWeight,_that.freshWeight,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallanDeptPayload implements ChallanDeptPayload {
  const _ChallanDeptPayload({@JsonKey(name: 'dept_id') required this.deptId, @JsonKey(name: 'soiled_weight') this.soiledWeight, @JsonKey(name: 'fresh_weight') this.freshWeight, required final  List<ChallanItemPayload> items}): _items = items;
  factory _ChallanDeptPayload.fromJson(Map<String, dynamic> json) => _$ChallanDeptPayloadFromJson(json);

@override@JsonKey(name: 'dept_id') final  String deptId;
@override@JsonKey(name: 'soiled_weight') final  double? soiledWeight;
@override@JsonKey(name: 'fresh_weight') final  double? freshWeight;
 final  List<ChallanItemPayload> _items;
@override List<ChallanItemPayload> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ChallanDeptPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallanDeptPayloadCopyWith<_ChallanDeptPayload> get copyWith => __$ChallanDeptPayloadCopyWithImpl<_ChallanDeptPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallanDeptPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallanDeptPayload&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.soiledWeight, soiledWeight) || other.soiledWeight == soiledWeight)&&(identical(other.freshWeight, freshWeight) || other.freshWeight == freshWeight)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptId,soiledWeight,freshWeight,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ChallanDeptPayload(deptId: $deptId, soiledWeight: $soiledWeight, freshWeight: $freshWeight, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ChallanDeptPayloadCopyWith<$Res> implements $ChallanDeptPayloadCopyWith<$Res> {
  factory _$ChallanDeptPayloadCopyWith(_ChallanDeptPayload value, $Res Function(_ChallanDeptPayload) _then) = __$ChallanDeptPayloadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dept_id') String deptId,@JsonKey(name: 'soiled_weight') double? soiledWeight,@JsonKey(name: 'fresh_weight') double? freshWeight, List<ChallanItemPayload> items
});




}
/// @nodoc
class __$ChallanDeptPayloadCopyWithImpl<$Res>
    implements _$ChallanDeptPayloadCopyWith<$Res> {
  __$ChallanDeptPayloadCopyWithImpl(this._self, this._then);

  final _ChallanDeptPayload _self;
  final $Res Function(_ChallanDeptPayload) _then;

/// Create a copy of ChallanDeptPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deptId = null,Object? soiledWeight = freezed,Object? freshWeight = freezed,Object? items = null,}) {
  return _then(_ChallanDeptPayload(
deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,soiledWeight: freezed == soiledWeight ? _self.soiledWeight : soiledWeight // ignore: cast_nullable_to_non_nullable
as double?,freshWeight: freezed == freshWeight ? _self.freshWeight : freshWeight // ignore: cast_nullable_to_non_nullable
as double?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChallanItemPayload>,
  ));
}


}


/// @nodoc
mixin _$PickupSubmitRequest {

@JsonKey(name: 'challan_number') String get challanNumber;@JsonKey(name: 'hotel_id') String get hotelId; List<ChallanDeptPayload> get departments;
/// Create a copy of PickupSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupSubmitRequestCopyWith<PickupSubmitRequest> get copyWith => _$PickupSubmitRequestCopyWithImpl<PickupSubmitRequest>(this as PickupSubmitRequest, _$identity);

  /// Serializes this PickupSubmitRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupSubmitRequest&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanNumber,hotelId,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'PickupSubmitRequest(challanNumber: $challanNumber, hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class $PickupSubmitRequestCopyWith<$Res>  {
  factory $PickupSubmitRequestCopyWith(PickupSubmitRequest value, $Res Function(PickupSubmitRequest) _then) = _$PickupSubmitRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'hotel_id') String hotelId, List<ChallanDeptPayload> departments
});




}
/// @nodoc
class _$PickupSubmitRequestCopyWithImpl<$Res>
    implements $PickupSubmitRequestCopyWith<$Res> {
  _$PickupSubmitRequestCopyWithImpl(this._self, this._then);

  final PickupSubmitRequest _self;
  final $Res Function(PickupSubmitRequest) _then;

/// Create a copy of PickupSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challanNumber = null,Object? hotelId = null,Object? departments = null,}) {
  return _then(_self.copyWith(
challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptPayload>,
  ));
}

}


/// Adds pattern-matching-related methods to [PickupSubmitRequest].
extension PickupSubmitRequestPatterns on PickupSubmitRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupSubmitRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupSubmitRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupSubmitRequest value)  $default,){
final _that = this;
switch (_that) {
case _PickupSubmitRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupSubmitRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PickupSubmitRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId,  List<ChallanDeptPayload> departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupSubmitRequest() when $default != null:
return $default(_that.challanNumber,_that.hotelId,_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId,  List<ChallanDeptPayload> departments)  $default,) {final _that = this;
switch (_that) {
case _PickupSubmitRequest():
return $default(_that.challanNumber,_that.hotelId,_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId,  List<ChallanDeptPayload> departments)?  $default,) {final _that = this;
switch (_that) {
case _PickupSubmitRequest() when $default != null:
return $default(_that.challanNumber,_that.hotelId,_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickupSubmitRequest implements PickupSubmitRequest {
  const _PickupSubmitRequest({@JsonKey(name: 'challan_number') required this.challanNumber, @JsonKey(name: 'hotel_id') required this.hotelId, required final  List<ChallanDeptPayload> departments}): _departments = departments;
  factory _PickupSubmitRequest.fromJson(Map<String, dynamic> json) => _$PickupSubmitRequestFromJson(json);

@override@JsonKey(name: 'challan_number') final  String challanNumber;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
 final  List<ChallanDeptPayload> _departments;
@override List<ChallanDeptPayload> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}


/// Create a copy of PickupSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupSubmitRequestCopyWith<_PickupSubmitRequest> get copyWith => __$PickupSubmitRequestCopyWithImpl<_PickupSubmitRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickupSubmitRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupSubmitRequest&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanNumber,hotelId,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'PickupSubmitRequest(challanNumber: $challanNumber, hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$PickupSubmitRequestCopyWith<$Res> implements $PickupSubmitRequestCopyWith<$Res> {
  factory _$PickupSubmitRequestCopyWith(_PickupSubmitRequest value, $Res Function(_PickupSubmitRequest) _then) = __$PickupSubmitRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'hotel_id') String hotelId, List<ChallanDeptPayload> departments
});




}
/// @nodoc
class __$PickupSubmitRequestCopyWithImpl<$Res>
    implements _$PickupSubmitRequestCopyWith<$Res> {
  __$PickupSubmitRequestCopyWithImpl(this._self, this._then);

  final _PickupSubmitRequest _self;
  final $Res Function(_PickupSubmitRequest) _then;

/// Create a copy of PickupSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challanNumber = null,Object? hotelId = null,Object? departments = null,}) {
  return _then(_PickupSubmitRequest(
challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptPayload>,
  ));
}


}


/// @nodoc
mixin _$DeliverySubmitRequest {

@JsonKey(name: 'challan_number') String get challanNumber;@JsonKey(name: 'hotel_id') String get hotelId; List<ChallanDeptPayload> get departments;
/// Create a copy of DeliverySubmitRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliverySubmitRequestCopyWith<DeliverySubmitRequest> get copyWith => _$DeliverySubmitRequestCopyWithImpl<DeliverySubmitRequest>(this as DeliverySubmitRequest, _$identity);

  /// Serializes this DeliverySubmitRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliverySubmitRequest&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanNumber,hotelId,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'DeliverySubmitRequest(challanNumber: $challanNumber, hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class $DeliverySubmitRequestCopyWith<$Res>  {
  factory $DeliverySubmitRequestCopyWith(DeliverySubmitRequest value, $Res Function(DeliverySubmitRequest) _then) = _$DeliverySubmitRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'hotel_id') String hotelId, List<ChallanDeptPayload> departments
});




}
/// @nodoc
class _$DeliverySubmitRequestCopyWithImpl<$Res>
    implements $DeliverySubmitRequestCopyWith<$Res> {
  _$DeliverySubmitRequestCopyWithImpl(this._self, this._then);

  final DeliverySubmitRequest _self;
  final $Res Function(DeliverySubmitRequest) _then;

/// Create a copy of DeliverySubmitRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challanNumber = null,Object? hotelId = null,Object? departments = null,}) {
  return _then(_self.copyWith(
challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptPayload>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliverySubmitRequest].
extension DeliverySubmitRequestPatterns on DeliverySubmitRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliverySubmitRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliverySubmitRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliverySubmitRequest value)  $default,){
final _that = this;
switch (_that) {
case _DeliverySubmitRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliverySubmitRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DeliverySubmitRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId,  List<ChallanDeptPayload> departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliverySubmitRequest() when $default != null:
return $default(_that.challanNumber,_that.hotelId,_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId,  List<ChallanDeptPayload> departments)  $default,) {final _that = this;
switch (_that) {
case _DeliverySubmitRequest():
return $default(_that.challanNumber,_that.hotelId,_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId,  List<ChallanDeptPayload> departments)?  $default,) {final _that = this;
switch (_that) {
case _DeliverySubmitRequest() when $default != null:
return $default(_that.challanNumber,_that.hotelId,_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliverySubmitRequest implements DeliverySubmitRequest {
  const _DeliverySubmitRequest({@JsonKey(name: 'challan_number') required this.challanNumber, @JsonKey(name: 'hotel_id') required this.hotelId, required final  List<ChallanDeptPayload> departments}): _departments = departments;
  factory _DeliverySubmitRequest.fromJson(Map<String, dynamic> json) => _$DeliverySubmitRequestFromJson(json);

@override@JsonKey(name: 'challan_number') final  String challanNumber;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
 final  List<ChallanDeptPayload> _departments;
@override List<ChallanDeptPayload> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}


/// Create a copy of DeliverySubmitRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliverySubmitRequestCopyWith<_DeliverySubmitRequest> get copyWith => __$DeliverySubmitRequestCopyWithImpl<_DeliverySubmitRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliverySubmitRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliverySubmitRequest&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanNumber,hotelId,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'DeliverySubmitRequest(challanNumber: $challanNumber, hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$DeliverySubmitRequestCopyWith<$Res> implements $DeliverySubmitRequestCopyWith<$Res> {
  factory _$DeliverySubmitRequestCopyWith(_DeliverySubmitRequest value, $Res Function(_DeliverySubmitRequest) _then) = __$DeliverySubmitRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'hotel_id') String hotelId, List<ChallanDeptPayload> departments
});




}
/// @nodoc
class __$DeliverySubmitRequestCopyWithImpl<$Res>
    implements _$DeliverySubmitRequestCopyWith<$Res> {
  __$DeliverySubmitRequestCopyWithImpl(this._self, this._then);

  final _DeliverySubmitRequest _self;
  final $Res Function(_DeliverySubmitRequest) _then;

/// Create a copy of DeliverySubmitRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challanNumber = null,Object? hotelId = null,Object? departments = null,}) {
  return _then(_DeliverySubmitRequest(
challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptPayload>,
  ));
}


}


/// @nodoc
mixin _$ChallanEditRequest {

 List<ChallanDeptPayload>? get departments;
/// Create a copy of ChallanEditRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallanEditRequestCopyWith<ChallanEditRequest> get copyWith => _$ChallanEditRequestCopyWithImpl<ChallanEditRequest>(this as ChallanEditRequest, _$identity);

  /// Serializes this ChallanEditRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallanEditRequest&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'ChallanEditRequest(departments: $departments)';
}


}

/// @nodoc
abstract mixin class $ChallanEditRequestCopyWith<$Res>  {
  factory $ChallanEditRequestCopyWith(ChallanEditRequest value, $Res Function(ChallanEditRequest) _then) = _$ChallanEditRequestCopyWithImpl;
@useResult
$Res call({
 List<ChallanDeptPayload>? departments
});




}
/// @nodoc
class _$ChallanEditRequestCopyWithImpl<$Res>
    implements $ChallanEditRequestCopyWith<$Res> {
  _$ChallanEditRequestCopyWithImpl(this._self, this._then);

  final ChallanEditRequest _self;
  final $Res Function(ChallanEditRequest) _then;

/// Create a copy of ChallanEditRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departments = freezed,}) {
  return _then(_self.copyWith(
departments: freezed == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptPayload>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallanEditRequest].
extension ChallanEditRequestPatterns on ChallanEditRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallanEditRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallanEditRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallanEditRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChallanEditRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallanEditRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChallanEditRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChallanDeptPayload>? departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallanEditRequest() when $default != null:
return $default(_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChallanDeptPayload>? departments)  $default,) {final _that = this;
switch (_that) {
case _ChallanEditRequest():
return $default(_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChallanDeptPayload>? departments)?  $default,) {final _that = this;
switch (_that) {
case _ChallanEditRequest() when $default != null:
return $default(_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallanEditRequest implements ChallanEditRequest {
  const _ChallanEditRequest({final  List<ChallanDeptPayload>? departments}): _departments = departments;
  factory _ChallanEditRequest.fromJson(Map<String, dynamic> json) => _$ChallanEditRequestFromJson(json);

 final  List<ChallanDeptPayload>? _departments;
@override List<ChallanDeptPayload>? get departments {
  final value = _departments;
  if (value == null) return null;
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ChallanEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallanEditRequestCopyWith<_ChallanEditRequest> get copyWith => __$ChallanEditRequestCopyWithImpl<_ChallanEditRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallanEditRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallanEditRequest&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'ChallanEditRequest(departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$ChallanEditRequestCopyWith<$Res> implements $ChallanEditRequestCopyWith<$Res> {
  factory _$ChallanEditRequestCopyWith(_ChallanEditRequest value, $Res Function(_ChallanEditRequest) _then) = __$ChallanEditRequestCopyWithImpl;
@override @useResult
$Res call({
 List<ChallanDeptPayload>? departments
});




}
/// @nodoc
class __$ChallanEditRequestCopyWithImpl<$Res>
    implements _$ChallanEditRequestCopyWith<$Res> {
  __$ChallanEditRequestCopyWithImpl(this._self, this._then);

  final _ChallanEditRequest _self;
  final $Res Function(_ChallanEditRequest) _then;

/// Create a copy of ChallanEditRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departments = freezed,}) {
  return _then(_ChallanEditRequest(
departments: freezed == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptPayload>?,
  ));
}


}


/// @nodoc
mixin _$ChallanItemResponse {

 String get id;@JsonKey(name: 'item_id') String get itemId; int get qty;@JsonKey(name: 'damaged_qty') int get damagedQty;
/// Create a copy of ChallanItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallanItemResponseCopyWith<ChallanItemResponse> get copyWith => _$ChallanItemResponseCopyWithImpl<ChallanItemResponse>(this as ChallanItemResponse, _$identity);

  /// Serializes this ChallanItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallanItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.damagedQty, damagedQty) || other.damagedQty == damagedQty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,qty,damagedQty);

@override
String toString() {
  return 'ChallanItemResponse(id: $id, itemId: $itemId, qty: $qty, damagedQty: $damagedQty)';
}


}

/// @nodoc
abstract mixin class $ChallanItemResponseCopyWith<$Res>  {
  factory $ChallanItemResponseCopyWith(ChallanItemResponse value, $Res Function(ChallanItemResponse) _then) = _$ChallanItemResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'item_id') String itemId, int qty,@JsonKey(name: 'damaged_qty') int damagedQty
});




}
/// @nodoc
class _$ChallanItemResponseCopyWithImpl<$Res>
    implements $ChallanItemResponseCopyWith<$Res> {
  _$ChallanItemResponseCopyWithImpl(this._self, this._then);

  final ChallanItemResponse _self;
  final $Res Function(ChallanItemResponse) _then;

/// Create a copy of ChallanItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? qty = null,Object? damagedQty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,damagedQty: null == damagedQty ? _self.damagedQty : damagedQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallanItemResponse].
extension ChallanItemResponsePatterns on ChallanItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallanItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallanItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallanItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChallanItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallanItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChallanItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'item_id')  String itemId,  int qty, @JsonKey(name: 'damaged_qty')  int damagedQty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallanItemResponse() when $default != null:
return $default(_that.id,_that.itemId,_that.qty,_that.damagedQty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'item_id')  String itemId,  int qty, @JsonKey(name: 'damaged_qty')  int damagedQty)  $default,) {final _that = this;
switch (_that) {
case _ChallanItemResponse():
return $default(_that.id,_that.itemId,_that.qty,_that.damagedQty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'item_id')  String itemId,  int qty, @JsonKey(name: 'damaged_qty')  int damagedQty)?  $default,) {final _that = this;
switch (_that) {
case _ChallanItemResponse() when $default != null:
return $default(_that.id,_that.itemId,_that.qty,_that.damagedQty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallanItemResponse implements ChallanItemResponse {
  const _ChallanItemResponse({required this.id, @JsonKey(name: 'item_id') required this.itemId, required this.qty, @JsonKey(name: 'damaged_qty') required this.damagedQty});
  factory _ChallanItemResponse.fromJson(Map<String, dynamic> json) => _$ChallanItemResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'item_id') final  String itemId;
@override final  int qty;
@override@JsonKey(name: 'damaged_qty') final  int damagedQty;

/// Create a copy of ChallanItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallanItemResponseCopyWith<_ChallanItemResponse> get copyWith => __$ChallanItemResponseCopyWithImpl<_ChallanItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallanItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallanItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.damagedQty, damagedQty) || other.damagedQty == damagedQty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,qty,damagedQty);

@override
String toString() {
  return 'ChallanItemResponse(id: $id, itemId: $itemId, qty: $qty, damagedQty: $damagedQty)';
}


}

/// @nodoc
abstract mixin class _$ChallanItemResponseCopyWith<$Res> implements $ChallanItemResponseCopyWith<$Res> {
  factory _$ChallanItemResponseCopyWith(_ChallanItemResponse value, $Res Function(_ChallanItemResponse) _then) = __$ChallanItemResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'item_id') String itemId, int qty,@JsonKey(name: 'damaged_qty') int damagedQty
});




}
/// @nodoc
class __$ChallanItemResponseCopyWithImpl<$Res>
    implements _$ChallanItemResponseCopyWith<$Res> {
  __$ChallanItemResponseCopyWithImpl(this._self, this._then);

  final _ChallanItemResponse _self;
  final $Res Function(_ChallanItemResponse) _then;

/// Create a copy of ChallanItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? qty = null,Object? damagedQty = null,}) {
  return _then(_ChallanItemResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,damagedQty: null == damagedQty ? _self.damagedQty : damagedQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChallanDeptResponse {

 String get id;@JsonKey(name: 'dept_id') String get deptId;@JsonKey(name: 'soiled_weight') String? get soiledWeight;@JsonKey(name: 'fresh_weight') String? get freshWeight; List<ChallanItemResponse> get items;
/// Create a copy of ChallanDeptResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallanDeptResponseCopyWith<ChallanDeptResponse> get copyWith => _$ChallanDeptResponseCopyWithImpl<ChallanDeptResponse>(this as ChallanDeptResponse, _$identity);

  /// Serializes this ChallanDeptResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallanDeptResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.soiledWeight, soiledWeight) || other.soiledWeight == soiledWeight)&&(identical(other.freshWeight, freshWeight) || other.freshWeight == freshWeight)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deptId,soiledWeight,freshWeight,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ChallanDeptResponse(id: $id, deptId: $deptId, soiledWeight: $soiledWeight, freshWeight: $freshWeight, items: $items)';
}


}

/// @nodoc
abstract mixin class $ChallanDeptResponseCopyWith<$Res>  {
  factory $ChallanDeptResponseCopyWith(ChallanDeptResponse value, $Res Function(ChallanDeptResponse) _then) = _$ChallanDeptResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'dept_id') String deptId,@JsonKey(name: 'soiled_weight') String? soiledWeight,@JsonKey(name: 'fresh_weight') String? freshWeight, List<ChallanItemResponse> items
});




}
/// @nodoc
class _$ChallanDeptResponseCopyWithImpl<$Res>
    implements $ChallanDeptResponseCopyWith<$Res> {
  _$ChallanDeptResponseCopyWithImpl(this._self, this._then);

  final ChallanDeptResponse _self;
  final $Res Function(ChallanDeptResponse) _then;

/// Create a copy of ChallanDeptResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deptId = null,Object? soiledWeight = freezed,Object? freshWeight = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,soiledWeight: freezed == soiledWeight ? _self.soiledWeight : soiledWeight // ignore: cast_nullable_to_non_nullable
as String?,freshWeight: freezed == freshWeight ? _self.freshWeight : freshWeight // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChallanItemResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallanDeptResponse].
extension ChallanDeptResponsePatterns on ChallanDeptResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallanDeptResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallanDeptResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallanDeptResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChallanDeptResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallanDeptResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChallanDeptResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'soiled_weight')  String? soiledWeight, @JsonKey(name: 'fresh_weight')  String? freshWeight,  List<ChallanItemResponse> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallanDeptResponse() when $default != null:
return $default(_that.id,_that.deptId,_that.soiledWeight,_that.freshWeight,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'soiled_weight')  String? soiledWeight, @JsonKey(name: 'fresh_weight')  String? freshWeight,  List<ChallanItemResponse> items)  $default,) {final _that = this;
switch (_that) {
case _ChallanDeptResponse():
return $default(_that.id,_that.deptId,_that.soiledWeight,_that.freshWeight,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'soiled_weight')  String? soiledWeight, @JsonKey(name: 'fresh_weight')  String? freshWeight,  List<ChallanItemResponse> items)?  $default,) {final _that = this;
switch (_that) {
case _ChallanDeptResponse() when $default != null:
return $default(_that.id,_that.deptId,_that.soiledWeight,_that.freshWeight,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallanDeptResponse implements ChallanDeptResponse {
  const _ChallanDeptResponse({required this.id, @JsonKey(name: 'dept_id') required this.deptId, @JsonKey(name: 'soiled_weight') this.soiledWeight, @JsonKey(name: 'fresh_weight') this.freshWeight, required final  List<ChallanItemResponse> items}): _items = items;
  factory _ChallanDeptResponse.fromJson(Map<String, dynamic> json) => _$ChallanDeptResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'dept_id') final  String deptId;
@override@JsonKey(name: 'soiled_weight') final  String? soiledWeight;
@override@JsonKey(name: 'fresh_weight') final  String? freshWeight;
 final  List<ChallanItemResponse> _items;
@override List<ChallanItemResponse> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ChallanDeptResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallanDeptResponseCopyWith<_ChallanDeptResponse> get copyWith => __$ChallanDeptResponseCopyWithImpl<_ChallanDeptResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallanDeptResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallanDeptResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.soiledWeight, soiledWeight) || other.soiledWeight == soiledWeight)&&(identical(other.freshWeight, freshWeight) || other.freshWeight == freshWeight)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deptId,soiledWeight,freshWeight,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ChallanDeptResponse(id: $id, deptId: $deptId, soiledWeight: $soiledWeight, freshWeight: $freshWeight, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ChallanDeptResponseCopyWith<$Res> implements $ChallanDeptResponseCopyWith<$Res> {
  factory _$ChallanDeptResponseCopyWith(_ChallanDeptResponse value, $Res Function(_ChallanDeptResponse) _then) = __$ChallanDeptResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'dept_id') String deptId,@JsonKey(name: 'soiled_weight') String? soiledWeight,@JsonKey(name: 'fresh_weight') String? freshWeight, List<ChallanItemResponse> items
});




}
/// @nodoc
class __$ChallanDeptResponseCopyWithImpl<$Res>
    implements _$ChallanDeptResponseCopyWith<$Res> {
  __$ChallanDeptResponseCopyWithImpl(this._self, this._then);

  final _ChallanDeptResponse _self;
  final $Res Function(_ChallanDeptResponse) _then;

/// Create a copy of ChallanDeptResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deptId = null,Object? soiledWeight = freezed,Object? freshWeight = freezed,Object? items = null,}) {
  return _then(_ChallanDeptResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,soiledWeight: freezed == soiledWeight ? _self.soiledWeight : soiledWeight // ignore: cast_nullable_to_non_nullable
as String?,freshWeight: freezed == freshWeight ? _self.freshWeight : freshWeight // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChallanItemResponse>,
  ));
}


}


/// @nodoc
mixin _$ChallanResponse {

 String get id;@JsonKey(name: 'challan_type') String get challanType;@JsonKey(name: 'challan_number') String get challanNumber;@JsonKey(name: 'hotel_id') String get hotelId;@JsonKey(name: 'agent_id') String get agentId;@JsonKey(name: 'image_key') String? get imageKey;@JsonKey(name: 'entry_timestamp') DateTime get entryTimestamp;@JsonKey(name: 'last_edited_at') DateTime? get lastEditedAt;@JsonKey(name: 'edited_by') String? get editedBy; List<ChallanDeptResponse> get departments;
/// Create a copy of ChallanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallanResponseCopyWith<ChallanResponse> get copyWith => _$ChallanResponseCopyWithImpl<ChallanResponse>(this as ChallanResponse, _$identity);

  /// Serializes this ChallanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallanResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.imageKey, imageKey) || other.imageKey == imageKey)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp)&&(identical(other.lastEditedAt, lastEditedAt) || other.lastEditedAt == lastEditedAt)&&(identical(other.editedBy, editedBy) || other.editedBy == editedBy)&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,challanType,challanNumber,hotelId,agentId,imageKey,entryTimestamp,lastEditedAt,editedBy,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'ChallanResponse(id: $id, challanType: $challanType, challanNumber: $challanNumber, hotelId: $hotelId, agentId: $agentId, imageKey: $imageKey, entryTimestamp: $entryTimestamp, lastEditedAt: $lastEditedAt, editedBy: $editedBy, departments: $departments)';
}


}

/// @nodoc
abstract mixin class $ChallanResponseCopyWith<$Res>  {
  factory $ChallanResponseCopyWith(ChallanResponse value, $Res Function(ChallanResponse) _then) = _$ChallanResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'agent_id') String agentId,@JsonKey(name: 'image_key') String? imageKey,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp,@JsonKey(name: 'last_edited_at') DateTime? lastEditedAt,@JsonKey(name: 'edited_by') String? editedBy, List<ChallanDeptResponse> departments
});




}
/// @nodoc
class _$ChallanResponseCopyWithImpl<$Res>
    implements $ChallanResponseCopyWith<$Res> {
  _$ChallanResponseCopyWithImpl(this._self, this._then);

  final ChallanResponse _self;
  final $Res Function(ChallanResponse) _then;

/// Create a copy of ChallanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? challanType = null,Object? challanNumber = null,Object? hotelId = null,Object? agentId = null,Object? imageKey = freezed,Object? entryTimestamp = null,Object? lastEditedAt = freezed,Object? editedBy = freezed,Object? departments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,imageKey: freezed == imageKey ? _self.imageKey : imageKey // ignore: cast_nullable_to_non_nullable
as String?,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,lastEditedAt: freezed == lastEditedAt ? _self.lastEditedAt : lastEditedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,editedBy: freezed == editedBy ? _self.editedBy : editedBy // ignore: cast_nullable_to_non_nullable
as String?,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallanResponse].
extension ChallanResponsePatterns on ChallanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallanResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChallanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChallanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'image_key')  String? imageKey, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp, @JsonKey(name: 'last_edited_at')  DateTime? lastEditedAt, @JsonKey(name: 'edited_by')  String? editedBy,  List<ChallanDeptResponse> departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallanResponse() when $default != null:
return $default(_that.id,_that.challanType,_that.challanNumber,_that.hotelId,_that.agentId,_that.imageKey,_that.entryTimestamp,_that.lastEditedAt,_that.editedBy,_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'image_key')  String? imageKey, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp, @JsonKey(name: 'last_edited_at')  DateTime? lastEditedAt, @JsonKey(name: 'edited_by')  String? editedBy,  List<ChallanDeptResponse> departments)  $default,) {final _that = this;
switch (_that) {
case _ChallanResponse():
return $default(_that.id,_that.challanType,_that.challanNumber,_that.hotelId,_that.agentId,_that.imageKey,_that.entryTimestamp,_that.lastEditedAt,_that.editedBy,_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'image_key')  String? imageKey, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp, @JsonKey(name: 'last_edited_at')  DateTime? lastEditedAt, @JsonKey(name: 'edited_by')  String? editedBy,  List<ChallanDeptResponse> departments)?  $default,) {final _that = this;
switch (_that) {
case _ChallanResponse() when $default != null:
return $default(_that.id,_that.challanType,_that.challanNumber,_that.hotelId,_that.agentId,_that.imageKey,_that.entryTimestamp,_that.lastEditedAt,_that.editedBy,_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallanResponse implements ChallanResponse {
  const _ChallanResponse({required this.id, @JsonKey(name: 'challan_type') required this.challanType, @JsonKey(name: 'challan_number') required this.challanNumber, @JsonKey(name: 'hotel_id') required this.hotelId, @JsonKey(name: 'agent_id') required this.agentId, @JsonKey(name: 'image_key') this.imageKey, @JsonKey(name: 'entry_timestamp') required this.entryTimestamp, @JsonKey(name: 'last_edited_at') this.lastEditedAt, @JsonKey(name: 'edited_by') this.editedBy, required final  List<ChallanDeptResponse> departments}): _departments = departments;
  factory _ChallanResponse.fromJson(Map<String, dynamic> json) => _$ChallanResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'challan_type') final  String challanType;
@override@JsonKey(name: 'challan_number') final  String challanNumber;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override@JsonKey(name: 'agent_id') final  String agentId;
@override@JsonKey(name: 'image_key') final  String? imageKey;
@override@JsonKey(name: 'entry_timestamp') final  DateTime entryTimestamp;
@override@JsonKey(name: 'last_edited_at') final  DateTime? lastEditedAt;
@override@JsonKey(name: 'edited_by') final  String? editedBy;
 final  List<ChallanDeptResponse> _departments;
@override List<ChallanDeptResponse> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}


/// Create a copy of ChallanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallanResponseCopyWith<_ChallanResponse> get copyWith => __$ChallanResponseCopyWithImpl<_ChallanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallanResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.imageKey, imageKey) || other.imageKey == imageKey)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp)&&(identical(other.lastEditedAt, lastEditedAt) || other.lastEditedAt == lastEditedAt)&&(identical(other.editedBy, editedBy) || other.editedBy == editedBy)&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,challanType,challanNumber,hotelId,agentId,imageKey,entryTimestamp,lastEditedAt,editedBy,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'ChallanResponse(id: $id, challanType: $challanType, challanNumber: $challanNumber, hotelId: $hotelId, agentId: $agentId, imageKey: $imageKey, entryTimestamp: $entryTimestamp, lastEditedAt: $lastEditedAt, editedBy: $editedBy, departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$ChallanResponseCopyWith<$Res> implements $ChallanResponseCopyWith<$Res> {
  factory _$ChallanResponseCopyWith(_ChallanResponse value, $Res Function(_ChallanResponse) _then) = __$ChallanResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'agent_id') String agentId,@JsonKey(name: 'image_key') String? imageKey,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp,@JsonKey(name: 'last_edited_at') DateTime? lastEditedAt,@JsonKey(name: 'edited_by') String? editedBy, List<ChallanDeptResponse> departments
});




}
/// @nodoc
class __$ChallanResponseCopyWithImpl<$Res>
    implements _$ChallanResponseCopyWith<$Res> {
  __$ChallanResponseCopyWithImpl(this._self, this._then);

  final _ChallanResponse _self;
  final $Res Function(_ChallanResponse) _then;

/// Create a copy of ChallanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? challanType = null,Object? challanNumber = null,Object? hotelId = null,Object? agentId = null,Object? imageKey = freezed,Object? entryTimestamp = null,Object? lastEditedAt = freezed,Object? editedBy = freezed,Object? departments = null,}) {
  return _then(_ChallanResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,imageKey: freezed == imageKey ? _self.imageKey : imageKey // ignore: cast_nullable_to_non_nullable
as String?,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,lastEditedAt: freezed == lastEditedAt ? _self.lastEditedAt : lastEditedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,editedBy: freezed == editedBy ? _self.editedBy : editedBy // ignore: cast_nullable_to_non_nullable
as String?,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<ChallanDeptResponse>,
  ));
}


}


/// @nodoc
mixin _$PaginatedChallanResponse {

 int get total; int get page;@JsonKey(name: 'page_size') int get pageSize; List<ChallanResponse> get items;
/// Create a copy of PaginatedChallanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedChallanResponseCopyWith<PaginatedChallanResponse> get copyWith => _$PaginatedChallanResponseCopyWithImpl<PaginatedChallanResponse>(this as PaginatedChallanResponse, _$identity);

  /// Serializes this PaginatedChallanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedChallanResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'PaginatedChallanResponse(total: $total, page: $page, pageSize: $pageSize, items: $items)';
}


}

/// @nodoc
abstract mixin class $PaginatedChallanResponseCopyWith<$Res>  {
  factory $PaginatedChallanResponseCopyWith(PaginatedChallanResponse value, $Res Function(PaginatedChallanResponse) _then) = _$PaginatedChallanResponseCopyWithImpl;
@useResult
$Res call({
 int total, int page,@JsonKey(name: 'page_size') int pageSize, List<ChallanResponse> items
});




}
/// @nodoc
class _$PaginatedChallanResponseCopyWithImpl<$Res>
    implements $PaginatedChallanResponseCopyWith<$Res> {
  _$PaginatedChallanResponseCopyWithImpl(this._self, this._then);

  final PaginatedChallanResponse _self;
  final $Res Function(PaginatedChallanResponse) _then;

/// Create a copy of PaginatedChallanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? items = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChallanResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedChallanResponse].
extension PaginatedChallanResponsePatterns on PaginatedChallanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedChallanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedChallanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedChallanResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedChallanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedChallanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedChallanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<ChallanResponse> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedChallanResponse() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<ChallanResponse> items)  $default,) {final _that = this;
switch (_that) {
case _PaginatedChallanResponse():
return $default(_that.total,_that.page,_that.pageSize,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<ChallanResponse> items)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedChallanResponse() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedChallanResponse implements PaginatedChallanResponse {
  const _PaginatedChallanResponse({required this.total, required this.page, @JsonKey(name: 'page_size') required this.pageSize, required final  List<ChallanResponse> items}): _items = items;
  factory _PaginatedChallanResponse.fromJson(Map<String, dynamic> json) => _$PaginatedChallanResponseFromJson(json);

@override final  int total;
@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;
 final  List<ChallanResponse> _items;
@override List<ChallanResponse> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PaginatedChallanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedChallanResponseCopyWith<_PaginatedChallanResponse> get copyWith => __$PaginatedChallanResponseCopyWithImpl<_PaginatedChallanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedChallanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedChallanResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PaginatedChallanResponse(total: $total, page: $page, pageSize: $pageSize, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PaginatedChallanResponseCopyWith<$Res> implements $PaginatedChallanResponseCopyWith<$Res> {
  factory _$PaginatedChallanResponseCopyWith(_PaginatedChallanResponse value, $Res Function(_PaginatedChallanResponse) _then) = __$PaginatedChallanResponseCopyWithImpl;
@override @useResult
$Res call({
 int total, int page,@JsonKey(name: 'page_size') int pageSize, List<ChallanResponse> items
});




}
/// @nodoc
class __$PaginatedChallanResponseCopyWithImpl<$Res>
    implements _$PaginatedChallanResponseCopyWith<$Res> {
  __$PaginatedChallanResponseCopyWithImpl(this._self, this._then);

  final _PaginatedChallanResponse _self;
  final $Res Function(_PaginatedChallanResponse) _then;

/// Create a copy of PaginatedChallanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? items = null,}) {
  return _then(_PaginatedChallanResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChallanResponse>,
  ));
}


}


/// @nodoc
mixin _$PresignedUploadResponse {

@JsonKey(name: 'upload_url') String get uploadUrl;@JsonKey(name: 's3_key') String get s3Key;
/// Create a copy of PresignedUploadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresignedUploadResponseCopyWith<PresignedUploadResponse> get copyWith => _$PresignedUploadResponseCopyWithImpl<PresignedUploadResponse>(this as PresignedUploadResponse, _$identity);

  /// Serializes this PresignedUploadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresignedUploadResponse&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,s3Key);

@override
String toString() {
  return 'PresignedUploadResponse(uploadUrl: $uploadUrl, s3Key: $s3Key)';
}


}

/// @nodoc
abstract mixin class $PresignedUploadResponseCopyWith<$Res>  {
  factory $PresignedUploadResponseCopyWith(PresignedUploadResponse value, $Res Function(PresignedUploadResponse) _then) = _$PresignedUploadResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'upload_url') String uploadUrl,@JsonKey(name: 's3_key') String s3Key
});




}
/// @nodoc
class _$PresignedUploadResponseCopyWithImpl<$Res>
    implements $PresignedUploadResponseCopyWith<$Res> {
  _$PresignedUploadResponseCopyWithImpl(this._self, this._then);

  final PresignedUploadResponse _self;
  final $Res Function(PresignedUploadResponse) _then;

/// Create a copy of PresignedUploadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadUrl = null,Object? s3Key = null,}) {
  return _then(_self.copyWith(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PresignedUploadResponse].
extension PresignedUploadResponsePatterns on PresignedUploadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresignedUploadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresignedUploadResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresignedUploadResponse value)  $default,){
final _that = this;
switch (_that) {
case _PresignedUploadResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresignedUploadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PresignedUploadResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'upload_url')  String uploadUrl, @JsonKey(name: 's3_key')  String s3Key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresignedUploadResponse() when $default != null:
return $default(_that.uploadUrl,_that.s3Key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'upload_url')  String uploadUrl, @JsonKey(name: 's3_key')  String s3Key)  $default,) {final _that = this;
switch (_that) {
case _PresignedUploadResponse():
return $default(_that.uploadUrl,_that.s3Key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'upload_url')  String uploadUrl, @JsonKey(name: 's3_key')  String s3Key)?  $default,) {final _that = this;
switch (_that) {
case _PresignedUploadResponse() when $default != null:
return $default(_that.uploadUrl,_that.s3Key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresignedUploadResponse implements PresignedUploadResponse {
  const _PresignedUploadResponse({@JsonKey(name: 'upload_url') required this.uploadUrl, @JsonKey(name: 's3_key') required this.s3Key});
  factory _PresignedUploadResponse.fromJson(Map<String, dynamic> json) => _$PresignedUploadResponseFromJson(json);

@override@JsonKey(name: 'upload_url') final  String uploadUrl;
@override@JsonKey(name: 's3_key') final  String s3Key;

/// Create a copy of PresignedUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresignedUploadResponseCopyWith<_PresignedUploadResponse> get copyWith => __$PresignedUploadResponseCopyWithImpl<_PresignedUploadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresignedUploadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresignedUploadResponse&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,s3Key);

@override
String toString() {
  return 'PresignedUploadResponse(uploadUrl: $uploadUrl, s3Key: $s3Key)';
}


}

/// @nodoc
abstract mixin class _$PresignedUploadResponseCopyWith<$Res> implements $PresignedUploadResponseCopyWith<$Res> {
  factory _$PresignedUploadResponseCopyWith(_PresignedUploadResponse value, $Res Function(_PresignedUploadResponse) _then) = __$PresignedUploadResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'upload_url') String uploadUrl,@JsonKey(name: 's3_key') String s3Key
});




}
/// @nodoc
class __$PresignedUploadResponseCopyWithImpl<$Res>
    implements _$PresignedUploadResponseCopyWith<$Res> {
  __$PresignedUploadResponseCopyWithImpl(this._self, this._then);

  final _PresignedUploadResponse _self;
  final $Res Function(_PresignedUploadResponse) _then;

/// Create a copy of PresignedUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadUrl = null,Object? s3Key = null,}) {
  return _then(_PresignedUploadResponse(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ConfirmUploadRequest {

@JsonKey(name: 's3_key') String get s3Key;
/// Create a copy of ConfirmUploadRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmUploadRequestCopyWith<ConfirmUploadRequest> get copyWith => _$ConfirmUploadRequestCopyWithImpl<ConfirmUploadRequest>(this as ConfirmUploadRequest, _$identity);

  /// Serializes this ConfirmUploadRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmUploadRequest&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,s3Key);

@override
String toString() {
  return 'ConfirmUploadRequest(s3Key: $s3Key)';
}


}

/// @nodoc
abstract mixin class $ConfirmUploadRequestCopyWith<$Res>  {
  factory $ConfirmUploadRequestCopyWith(ConfirmUploadRequest value, $Res Function(ConfirmUploadRequest) _then) = _$ConfirmUploadRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 's3_key') String s3Key
});




}
/// @nodoc
class _$ConfirmUploadRequestCopyWithImpl<$Res>
    implements $ConfirmUploadRequestCopyWith<$Res> {
  _$ConfirmUploadRequestCopyWithImpl(this._self, this._then);

  final ConfirmUploadRequest _self;
  final $Res Function(ConfirmUploadRequest) _then;

/// Create a copy of ConfirmUploadRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? s3Key = null,}) {
  return _then(_self.copyWith(
s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmUploadRequest].
extension ConfirmUploadRequestPatterns on ConfirmUploadRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmUploadRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmUploadRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmUploadRequest value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmUploadRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmUploadRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmUploadRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 's3_key')  String s3Key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmUploadRequest() when $default != null:
return $default(_that.s3Key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 's3_key')  String s3Key)  $default,) {final _that = this;
switch (_that) {
case _ConfirmUploadRequest():
return $default(_that.s3Key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 's3_key')  String s3Key)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmUploadRequest() when $default != null:
return $default(_that.s3Key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfirmUploadRequest implements ConfirmUploadRequest {
  const _ConfirmUploadRequest({@JsonKey(name: 's3_key') required this.s3Key});
  factory _ConfirmUploadRequest.fromJson(Map<String, dynamic> json) => _$ConfirmUploadRequestFromJson(json);

@override@JsonKey(name: 's3_key') final  String s3Key;

/// Create a copy of ConfirmUploadRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmUploadRequestCopyWith<_ConfirmUploadRequest> get copyWith => __$ConfirmUploadRequestCopyWithImpl<_ConfirmUploadRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmUploadRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmUploadRequest&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,s3Key);

@override
String toString() {
  return 'ConfirmUploadRequest(s3Key: $s3Key)';
}


}

/// @nodoc
abstract mixin class _$ConfirmUploadRequestCopyWith<$Res> implements $ConfirmUploadRequestCopyWith<$Res> {
  factory _$ConfirmUploadRequestCopyWith(_ConfirmUploadRequest value, $Res Function(_ConfirmUploadRequest) _then) = __$ConfirmUploadRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 's3_key') String s3Key
});




}
/// @nodoc
class __$ConfirmUploadRequestCopyWithImpl<$Res>
    implements _$ConfirmUploadRequestCopyWith<$Res> {
  __$ConfirmUploadRequestCopyWithImpl(this._self, this._then);

  final _ConfirmUploadRequest _self;
  final $Res Function(_ConfirmUploadRequest) _then;

/// Create a copy of ConfirmUploadRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? s3Key = null,}) {
  return _then(_ConfirmUploadRequest(
s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
