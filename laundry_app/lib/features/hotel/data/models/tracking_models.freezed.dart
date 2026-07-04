// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackingItem {

@JsonKey(name: 'item_name') String get itemName;@JsonKey(name: 'qty_in_laundry') int get qtyInLaundry;@JsonKey(name: 'total_damaged_by_laundry') int get totalDamagedByLaundry;@JsonKey(name: 'weight_kg') double get weightKg;
/// Create a copy of TrackingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingItemCopyWith<TrackingItem> get copyWith => _$TrackingItemCopyWithImpl<TrackingItem>(this as TrackingItem, _$identity);

  /// Serializes this TrackingItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingItem&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.qtyInLaundry, qtyInLaundry) || other.qtyInLaundry == qtyInLaundry)&&(identical(other.totalDamagedByLaundry, totalDamagedByLaundry) || other.totalDamagedByLaundry == totalDamagedByLaundry)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,qtyInLaundry,totalDamagedByLaundry,weightKg);

@override
String toString() {
  return 'TrackingItem(itemName: $itemName, qtyInLaundry: $qtyInLaundry, totalDamagedByLaundry: $totalDamagedByLaundry, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class $TrackingItemCopyWith<$Res>  {
  factory $TrackingItemCopyWith(TrackingItem value, $Res Function(TrackingItem) _then) = _$TrackingItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'qty_in_laundry') int qtyInLaundry,@JsonKey(name: 'total_damaged_by_laundry') int totalDamagedByLaundry,@JsonKey(name: 'weight_kg') double weightKg
});




}
/// @nodoc
class _$TrackingItemCopyWithImpl<$Res>
    implements $TrackingItemCopyWith<$Res> {
  _$TrackingItemCopyWithImpl(this._self, this._then);

  final TrackingItem _self;
  final $Res Function(TrackingItem) _then;

/// Create a copy of TrackingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemName = null,Object? qtyInLaundry = null,Object? totalDamagedByLaundry = null,Object? weightKg = null,}) {
  return _then(_self.copyWith(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,qtyInLaundry: null == qtyInLaundry ? _self.qtyInLaundry : qtyInLaundry // ignore: cast_nullable_to_non_nullable
as int,totalDamagedByLaundry: null == totalDamagedByLaundry ? _self.totalDamagedByLaundry : totalDamagedByLaundry // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingItem].
extension TrackingItemPatterns on TrackingItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingItem value)  $default,){
final _that = this;
switch (_that) {
case _TrackingItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingItem value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'qty_in_laundry')  int qtyInLaundry, @JsonKey(name: 'total_damaged_by_laundry')  int totalDamagedByLaundry, @JsonKey(name: 'weight_kg')  double weightKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingItem() when $default != null:
return $default(_that.itemName,_that.qtyInLaundry,_that.totalDamagedByLaundry,_that.weightKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'qty_in_laundry')  int qtyInLaundry, @JsonKey(name: 'total_damaged_by_laundry')  int totalDamagedByLaundry, @JsonKey(name: 'weight_kg')  double weightKg)  $default,) {final _that = this;
switch (_that) {
case _TrackingItem():
return $default(_that.itemName,_that.qtyInLaundry,_that.totalDamagedByLaundry,_that.weightKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'qty_in_laundry')  int qtyInLaundry, @JsonKey(name: 'total_damaged_by_laundry')  int totalDamagedByLaundry, @JsonKey(name: 'weight_kg')  double weightKg)?  $default,) {final _that = this;
switch (_that) {
case _TrackingItem() when $default != null:
return $default(_that.itemName,_that.qtyInLaundry,_that.totalDamagedByLaundry,_that.weightKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingItem implements TrackingItem {
  const _TrackingItem({@JsonKey(name: 'item_name') required this.itemName, @JsonKey(name: 'qty_in_laundry') required this.qtyInLaundry, @JsonKey(name: 'total_damaged_by_laundry') required this.totalDamagedByLaundry, @JsonKey(name: 'weight_kg') required this.weightKg});
  factory _TrackingItem.fromJson(Map<String, dynamic> json) => _$TrackingItemFromJson(json);

@override@JsonKey(name: 'item_name') final  String itemName;
@override@JsonKey(name: 'qty_in_laundry') final  int qtyInLaundry;
@override@JsonKey(name: 'total_damaged_by_laundry') final  int totalDamagedByLaundry;
@override@JsonKey(name: 'weight_kg') final  double weightKg;

/// Create a copy of TrackingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingItemCopyWith<_TrackingItem> get copyWith => __$TrackingItemCopyWithImpl<_TrackingItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingItem&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.qtyInLaundry, qtyInLaundry) || other.qtyInLaundry == qtyInLaundry)&&(identical(other.totalDamagedByLaundry, totalDamagedByLaundry) || other.totalDamagedByLaundry == totalDamagedByLaundry)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,qtyInLaundry,totalDamagedByLaundry,weightKg);

@override
String toString() {
  return 'TrackingItem(itemName: $itemName, qtyInLaundry: $qtyInLaundry, totalDamagedByLaundry: $totalDamagedByLaundry, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class _$TrackingItemCopyWith<$Res> implements $TrackingItemCopyWith<$Res> {
  factory _$TrackingItemCopyWith(_TrackingItem value, $Res Function(_TrackingItem) _then) = __$TrackingItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'qty_in_laundry') int qtyInLaundry,@JsonKey(name: 'total_damaged_by_laundry') int totalDamagedByLaundry,@JsonKey(name: 'weight_kg') double weightKg
});




}
/// @nodoc
class __$TrackingItemCopyWithImpl<$Res>
    implements _$TrackingItemCopyWith<$Res> {
  __$TrackingItemCopyWithImpl(this._self, this._then);

  final _TrackingItem _self;
  final $Res Function(_TrackingItem) _then;

/// Create a copy of TrackingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemName = null,Object? qtyInLaundry = null,Object? totalDamagedByLaundry = null,Object? weightKg = null,}) {
  return _then(_TrackingItem(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,qtyInLaundry: null == qtyInLaundry ? _self.qtyInLaundry : qtyInLaundry // ignore: cast_nullable_to_non_nullable
as int,totalDamagedByLaundry: null == totalDamagedByLaundry ? _self.totalDamagedByLaundry : totalDamagedByLaundry // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$TrackingDepartment {

@JsonKey(name: 'dept_name') String get deptName;@JsonKey(name: 'total_weight_kg') double get totalWeightKg; List<TrackingItem> get items;
/// Create a copy of TrackingDepartment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingDepartmentCopyWith<TrackingDepartment> get copyWith => _$TrackingDepartmentCopyWithImpl<TrackingDepartment>(this as TrackingDepartment, _$identity);

  /// Serializes this TrackingDepartment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingDepartment&&(identical(other.deptName, deptName) || other.deptName == deptName)&&(identical(other.totalWeightKg, totalWeightKg) || other.totalWeightKg == totalWeightKg)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptName,totalWeightKg,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'TrackingDepartment(deptName: $deptName, totalWeightKg: $totalWeightKg, items: $items)';
}


}

/// @nodoc
abstract mixin class $TrackingDepartmentCopyWith<$Res>  {
  factory $TrackingDepartmentCopyWith(TrackingDepartment value, $Res Function(TrackingDepartment) _then) = _$TrackingDepartmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dept_name') String deptName,@JsonKey(name: 'total_weight_kg') double totalWeightKg, List<TrackingItem> items
});




}
/// @nodoc
class _$TrackingDepartmentCopyWithImpl<$Res>
    implements $TrackingDepartmentCopyWith<$Res> {
  _$TrackingDepartmentCopyWithImpl(this._self, this._then);

  final TrackingDepartment _self;
  final $Res Function(TrackingDepartment) _then;

/// Create a copy of TrackingDepartment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deptName = null,Object? totalWeightKg = null,Object? items = null,}) {
  return _then(_self.copyWith(
deptName: null == deptName ? _self.deptName : deptName // ignore: cast_nullable_to_non_nullable
as String,totalWeightKg: null == totalWeightKg ? _self.totalWeightKg : totalWeightKg // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TrackingItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingDepartment].
extension TrackingDepartmentPatterns on TrackingDepartment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingDepartment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingDepartment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingDepartment value)  $default,){
final _that = this;
switch (_that) {
case _TrackingDepartment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingDepartment value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingDepartment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'total_weight_kg')  double totalWeightKg,  List<TrackingItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingDepartment() when $default != null:
return $default(_that.deptName,_that.totalWeightKg,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'total_weight_kg')  double totalWeightKg,  List<TrackingItem> items)  $default,) {final _that = this;
switch (_that) {
case _TrackingDepartment():
return $default(_that.deptName,_that.totalWeightKg,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dept_name')  String deptName, @JsonKey(name: 'total_weight_kg')  double totalWeightKg,  List<TrackingItem> items)?  $default,) {final _that = this;
switch (_that) {
case _TrackingDepartment() when $default != null:
return $default(_that.deptName,_that.totalWeightKg,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingDepartment implements TrackingDepartment {
  const _TrackingDepartment({@JsonKey(name: 'dept_name') required this.deptName, @JsonKey(name: 'total_weight_kg') required this.totalWeightKg, required final  List<TrackingItem> items}): _items = items;
  factory _TrackingDepartment.fromJson(Map<String, dynamic> json) => _$TrackingDepartmentFromJson(json);

@override@JsonKey(name: 'dept_name') final  String deptName;
@override@JsonKey(name: 'total_weight_kg') final  double totalWeightKg;
 final  List<TrackingItem> _items;
@override List<TrackingItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of TrackingDepartment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingDepartmentCopyWith<_TrackingDepartment> get copyWith => __$TrackingDepartmentCopyWithImpl<_TrackingDepartment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingDepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingDepartment&&(identical(other.deptName, deptName) || other.deptName == deptName)&&(identical(other.totalWeightKg, totalWeightKg) || other.totalWeightKg == totalWeightKg)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptName,totalWeightKg,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'TrackingDepartment(deptName: $deptName, totalWeightKg: $totalWeightKg, items: $items)';
}


}

/// @nodoc
abstract mixin class _$TrackingDepartmentCopyWith<$Res> implements $TrackingDepartmentCopyWith<$Res> {
  factory _$TrackingDepartmentCopyWith(_TrackingDepartment value, $Res Function(_TrackingDepartment) _then) = __$TrackingDepartmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dept_name') String deptName,@JsonKey(name: 'total_weight_kg') double totalWeightKg, List<TrackingItem> items
});




}
/// @nodoc
class __$TrackingDepartmentCopyWithImpl<$Res>
    implements _$TrackingDepartmentCopyWith<$Res> {
  __$TrackingDepartmentCopyWithImpl(this._self, this._then);

  final _TrackingDepartment _self;
  final $Res Function(_TrackingDepartment) _then;

/// Create a copy of TrackingDepartment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deptName = null,Object? totalWeightKg = null,Object? items = null,}) {
  return _then(_TrackingDepartment(
deptName: null == deptName ? _self.deptName : deptName // ignore: cast_nullable_to_non_nullable
as String,totalWeightKg: null == totalWeightKg ? _self.totalWeightKg : totalWeightKg // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TrackingItem>,
  ));
}


}


/// @nodoc
mixin _$LiveTrackingResponse {

@JsonKey(name: 'hotel_id') String get hotelId; List<TrackingDepartment> get departments;
/// Create a copy of LiveTrackingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveTrackingResponseCopyWith<LiveTrackingResponse> get copyWith => _$LiveTrackingResponseCopyWithImpl<LiveTrackingResponse>(this as LiveTrackingResponse, _$identity);

  /// Serializes this LiveTrackingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveTrackingResponse&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'LiveTrackingResponse(hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class $LiveTrackingResponseCopyWith<$Res>  {
  factory $LiveTrackingResponseCopyWith(LiveTrackingResponse value, $Res Function(LiveTrackingResponse) _then) = _$LiveTrackingResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId, List<TrackingDepartment> departments
});




}
/// @nodoc
class _$LiveTrackingResponseCopyWithImpl<$Res>
    implements $LiveTrackingResponseCopyWith<$Res> {
  _$LiveTrackingResponseCopyWithImpl(this._self, this._then);

  final LiveTrackingResponse _self;
  final $Res Function(LiveTrackingResponse) _then;

/// Create a copy of LiveTrackingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelId = null,Object? departments = null,}) {
  return _then(_self.copyWith(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<TrackingDepartment>,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveTrackingResponse].
extension LiveTrackingResponsePatterns on LiveTrackingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveTrackingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveTrackingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveTrackingResponse value)  $default,){
final _that = this;
switch (_that) {
case _LiveTrackingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveTrackingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LiveTrackingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId,  List<TrackingDepartment> departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveTrackingResponse() when $default != null:
return $default(_that.hotelId,_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId,  List<TrackingDepartment> departments)  $default,) {final _that = this;
switch (_that) {
case _LiveTrackingResponse():
return $default(_that.hotelId,_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotel_id')  String hotelId,  List<TrackingDepartment> departments)?  $default,) {final _that = this;
switch (_that) {
case _LiveTrackingResponse() when $default != null:
return $default(_that.hotelId,_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveTrackingResponse implements LiveTrackingResponse {
  const _LiveTrackingResponse({@JsonKey(name: 'hotel_id') required this.hotelId, required final  List<TrackingDepartment> departments}): _departments = departments;
  factory _LiveTrackingResponse.fromJson(Map<String, dynamic> json) => _$LiveTrackingResponseFromJson(json);

@override@JsonKey(name: 'hotel_id') final  String hotelId;
 final  List<TrackingDepartment> _departments;
@override List<TrackingDepartment> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}


/// Create a copy of LiveTrackingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveTrackingResponseCopyWith<_LiveTrackingResponse> get copyWith => __$LiveTrackingResponseCopyWithImpl<_LiveTrackingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveTrackingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveTrackingResponse&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'LiveTrackingResponse(hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$LiveTrackingResponseCopyWith<$Res> implements $LiveTrackingResponseCopyWith<$Res> {
  factory _$LiveTrackingResponseCopyWith(_LiveTrackingResponse value, $Res Function(_LiveTrackingResponse) _then) = __$LiveTrackingResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId, List<TrackingDepartment> departments
});




}
/// @nodoc
class __$LiveTrackingResponseCopyWithImpl<$Res>
    implements _$LiveTrackingResponseCopyWith<$Res> {
  __$LiveTrackingResponseCopyWithImpl(this._self, this._then);

  final _LiveTrackingResponse _self;
  final $Res Function(_LiveTrackingResponse) _then;

/// Create a copy of LiveTrackingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelId = null,Object? departments = null,}) {
  return _then(_LiveTrackingResponse(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<TrackingDepartment>,
  ));
}


}

// dart format on
