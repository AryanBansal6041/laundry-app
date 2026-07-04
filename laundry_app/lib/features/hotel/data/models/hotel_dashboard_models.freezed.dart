// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotelDashboardRecentChallan {

@JsonKey(name: 'challan_id') String get challanId;@JsonKey(name: 'challan_number') String get challanNumber;@JsonKey(name: 'challan_type') String get challanType;@JsonKey(name: 'agent_name') String? get agentName;@JsonKey(name: 'entry_timestamp') DateTime get entryTimestamp;
/// Create a copy of HotelDashboardRecentChallan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelDashboardRecentChallanCopyWith<HotelDashboardRecentChallan> get copyWith => _$HotelDashboardRecentChallanCopyWithImpl<HotelDashboardRecentChallan>(this as HotelDashboardRecentChallan, _$identity);

  /// Serializes this HotelDashboardRecentChallan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelDashboardRecentChallan&&(identical(other.challanId, challanId) || other.challanId == challanId)&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanId,challanNumber,challanType,agentName,entryTimestamp);

@override
String toString() {
  return 'HotelDashboardRecentChallan(challanId: $challanId, challanNumber: $challanNumber, challanType: $challanType, agentName: $agentName, entryTimestamp: $entryTimestamp)';
}


}

/// @nodoc
abstract mixin class $HotelDashboardRecentChallanCopyWith<$Res>  {
  factory $HotelDashboardRecentChallanCopyWith(HotelDashboardRecentChallan value, $Res Function(HotelDashboardRecentChallan) _then) = _$HotelDashboardRecentChallanCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'challan_id') String challanId,@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'agent_name') String? agentName,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp
});




}
/// @nodoc
class _$HotelDashboardRecentChallanCopyWithImpl<$Res>
    implements $HotelDashboardRecentChallanCopyWith<$Res> {
  _$HotelDashboardRecentChallanCopyWithImpl(this._self, this._then);

  final HotelDashboardRecentChallan _self;
  final $Res Function(HotelDashboardRecentChallan) _then;

/// Create a copy of HotelDashboardRecentChallan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challanId = null,Object? challanNumber = null,Object? challanType = null,Object? agentName = freezed,Object? entryTimestamp = null,}) {
  return _then(_self.copyWith(
challanId: null == challanId ? _self.challanId : challanId // ignore: cast_nullable_to_non_nullable
as String,challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelDashboardRecentChallan].
extension HotelDashboardRecentChallanPatterns on HotelDashboardRecentChallan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelDashboardRecentChallan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelDashboardRecentChallan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelDashboardRecentChallan value)  $default,){
final _that = this;
switch (_that) {
case _HotelDashboardRecentChallan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelDashboardRecentChallan value)?  $default,){
final _that = this;
switch (_that) {
case _HotelDashboardRecentChallan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_id')  String challanId, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelDashboardRecentChallan() when $default != null:
return $default(_that.challanId,_that.challanNumber,_that.challanType,_that.agentName,_that.entryTimestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_id')  String challanId, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp)  $default,) {final _that = this;
switch (_that) {
case _HotelDashboardRecentChallan():
return $default(_that.challanId,_that.challanNumber,_that.challanType,_that.agentName,_that.entryTimestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'challan_id')  String challanId, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp)?  $default,) {final _that = this;
switch (_that) {
case _HotelDashboardRecentChallan() when $default != null:
return $default(_that.challanId,_that.challanNumber,_that.challanType,_that.agentName,_that.entryTimestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelDashboardRecentChallan implements HotelDashboardRecentChallan {
  const _HotelDashboardRecentChallan({@JsonKey(name: 'challan_id') required this.challanId, @JsonKey(name: 'challan_number') required this.challanNumber, @JsonKey(name: 'challan_type') required this.challanType, @JsonKey(name: 'agent_name') this.agentName, @JsonKey(name: 'entry_timestamp') required this.entryTimestamp});
  factory _HotelDashboardRecentChallan.fromJson(Map<String, dynamic> json) => _$HotelDashboardRecentChallanFromJson(json);

@override@JsonKey(name: 'challan_id') final  String challanId;
@override@JsonKey(name: 'challan_number') final  String challanNumber;
@override@JsonKey(name: 'challan_type') final  String challanType;
@override@JsonKey(name: 'agent_name') final  String? agentName;
@override@JsonKey(name: 'entry_timestamp') final  DateTime entryTimestamp;

/// Create a copy of HotelDashboardRecentChallan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelDashboardRecentChallanCopyWith<_HotelDashboardRecentChallan> get copyWith => __$HotelDashboardRecentChallanCopyWithImpl<_HotelDashboardRecentChallan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelDashboardRecentChallanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelDashboardRecentChallan&&(identical(other.challanId, challanId) || other.challanId == challanId)&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanId,challanNumber,challanType,agentName,entryTimestamp);

@override
String toString() {
  return 'HotelDashboardRecentChallan(challanId: $challanId, challanNumber: $challanNumber, challanType: $challanType, agentName: $agentName, entryTimestamp: $entryTimestamp)';
}


}

/// @nodoc
abstract mixin class _$HotelDashboardRecentChallanCopyWith<$Res> implements $HotelDashboardRecentChallanCopyWith<$Res> {
  factory _$HotelDashboardRecentChallanCopyWith(_HotelDashboardRecentChallan value, $Res Function(_HotelDashboardRecentChallan) _then) = __$HotelDashboardRecentChallanCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'challan_id') String challanId,@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'agent_name') String? agentName,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp
});




}
/// @nodoc
class __$HotelDashboardRecentChallanCopyWithImpl<$Res>
    implements _$HotelDashboardRecentChallanCopyWith<$Res> {
  __$HotelDashboardRecentChallanCopyWithImpl(this._self, this._then);

  final _HotelDashboardRecentChallan _self;
  final $Res Function(_HotelDashboardRecentChallan) _then;

/// Create a copy of HotelDashboardRecentChallan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challanId = null,Object? challanNumber = null,Object? challanType = null,Object? agentName = freezed,Object? entryTimestamp = null,}) {
  return _then(_HotelDashboardRecentChallan(
challanId: null == challanId ? _self.challanId : challanId // ignore: cast_nullable_to_non_nullable
as String,challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$HotelDashboardLiveTracking {

@JsonKey(name: 'total_items_in_laundry') int get totalItemsInLaundry;@JsonKey(name: 'total_weight_in_laundry_kg') double get totalWeightInLaundryKg; List<TrackingDepartment> get departments;
/// Create a copy of HotelDashboardLiveTracking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelDashboardLiveTrackingCopyWith<HotelDashboardLiveTracking> get copyWith => _$HotelDashboardLiveTrackingCopyWithImpl<HotelDashboardLiveTracking>(this as HotelDashboardLiveTracking, _$identity);

  /// Serializes this HotelDashboardLiveTracking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelDashboardLiveTracking&&(identical(other.totalItemsInLaundry, totalItemsInLaundry) || other.totalItemsInLaundry == totalItemsInLaundry)&&(identical(other.totalWeightInLaundryKg, totalWeightInLaundryKg) || other.totalWeightInLaundryKg == totalWeightInLaundryKg)&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalItemsInLaundry,totalWeightInLaundryKg,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'HotelDashboardLiveTracking(totalItemsInLaundry: $totalItemsInLaundry, totalWeightInLaundryKg: $totalWeightInLaundryKg, departments: $departments)';
}


}

/// @nodoc
abstract mixin class $HotelDashboardLiveTrackingCopyWith<$Res>  {
  factory $HotelDashboardLiveTrackingCopyWith(HotelDashboardLiveTracking value, $Res Function(HotelDashboardLiveTracking) _then) = _$HotelDashboardLiveTrackingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_items_in_laundry') int totalItemsInLaundry,@JsonKey(name: 'total_weight_in_laundry_kg') double totalWeightInLaundryKg, List<TrackingDepartment> departments
});




}
/// @nodoc
class _$HotelDashboardLiveTrackingCopyWithImpl<$Res>
    implements $HotelDashboardLiveTrackingCopyWith<$Res> {
  _$HotelDashboardLiveTrackingCopyWithImpl(this._self, this._then);

  final HotelDashboardLiveTracking _self;
  final $Res Function(HotelDashboardLiveTracking) _then;

/// Create a copy of HotelDashboardLiveTracking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalItemsInLaundry = null,Object? totalWeightInLaundryKg = null,Object? departments = null,}) {
  return _then(_self.copyWith(
totalItemsInLaundry: null == totalItemsInLaundry ? _self.totalItemsInLaundry : totalItemsInLaundry // ignore: cast_nullable_to_non_nullable
as int,totalWeightInLaundryKg: null == totalWeightInLaundryKg ? _self.totalWeightInLaundryKg : totalWeightInLaundryKg // ignore: cast_nullable_to_non_nullable
as double,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<TrackingDepartment>,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelDashboardLiveTracking].
extension HotelDashboardLiveTrackingPatterns on HotelDashboardLiveTracking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelDashboardLiveTracking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelDashboardLiveTracking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelDashboardLiveTracking value)  $default,){
final _that = this;
switch (_that) {
case _HotelDashboardLiveTracking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelDashboardLiveTracking value)?  $default,){
final _that = this;
switch (_that) {
case _HotelDashboardLiveTracking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_items_in_laundry')  int totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg')  double totalWeightInLaundryKg,  List<TrackingDepartment> departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelDashboardLiveTracking() when $default != null:
return $default(_that.totalItemsInLaundry,_that.totalWeightInLaundryKg,_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_items_in_laundry')  int totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg')  double totalWeightInLaundryKg,  List<TrackingDepartment> departments)  $default,) {final _that = this;
switch (_that) {
case _HotelDashboardLiveTracking():
return $default(_that.totalItemsInLaundry,_that.totalWeightInLaundryKg,_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_items_in_laundry')  int totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg')  double totalWeightInLaundryKg,  List<TrackingDepartment> departments)?  $default,) {final _that = this;
switch (_that) {
case _HotelDashboardLiveTracking() when $default != null:
return $default(_that.totalItemsInLaundry,_that.totalWeightInLaundryKg,_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelDashboardLiveTracking implements HotelDashboardLiveTracking {
  const _HotelDashboardLiveTracking({@JsonKey(name: 'total_items_in_laundry') required this.totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg') required this.totalWeightInLaundryKg, required final  List<TrackingDepartment> departments}): _departments = departments;
  factory _HotelDashboardLiveTracking.fromJson(Map<String, dynamic> json) => _$HotelDashboardLiveTrackingFromJson(json);

@override@JsonKey(name: 'total_items_in_laundry') final  int totalItemsInLaundry;
@override@JsonKey(name: 'total_weight_in_laundry_kg') final  double totalWeightInLaundryKg;
 final  List<TrackingDepartment> _departments;
@override List<TrackingDepartment> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}


/// Create a copy of HotelDashboardLiveTracking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelDashboardLiveTrackingCopyWith<_HotelDashboardLiveTracking> get copyWith => __$HotelDashboardLiveTrackingCopyWithImpl<_HotelDashboardLiveTracking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelDashboardLiveTrackingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelDashboardLiveTracking&&(identical(other.totalItemsInLaundry, totalItemsInLaundry) || other.totalItemsInLaundry == totalItemsInLaundry)&&(identical(other.totalWeightInLaundryKg, totalWeightInLaundryKg) || other.totalWeightInLaundryKg == totalWeightInLaundryKg)&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalItemsInLaundry,totalWeightInLaundryKg,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'HotelDashboardLiveTracking(totalItemsInLaundry: $totalItemsInLaundry, totalWeightInLaundryKg: $totalWeightInLaundryKg, departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$HotelDashboardLiveTrackingCopyWith<$Res> implements $HotelDashboardLiveTrackingCopyWith<$Res> {
  factory _$HotelDashboardLiveTrackingCopyWith(_HotelDashboardLiveTracking value, $Res Function(_HotelDashboardLiveTracking) _then) = __$HotelDashboardLiveTrackingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_items_in_laundry') int totalItemsInLaundry,@JsonKey(name: 'total_weight_in_laundry_kg') double totalWeightInLaundryKg, List<TrackingDepartment> departments
});




}
/// @nodoc
class __$HotelDashboardLiveTrackingCopyWithImpl<$Res>
    implements _$HotelDashboardLiveTrackingCopyWith<$Res> {
  __$HotelDashboardLiveTrackingCopyWithImpl(this._self, this._then);

  final _HotelDashboardLiveTracking _self;
  final $Res Function(_HotelDashboardLiveTracking) _then;

/// Create a copy of HotelDashboardLiveTracking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalItemsInLaundry = null,Object? totalWeightInLaundryKg = null,Object? departments = null,}) {
  return _then(_HotelDashboardLiveTracking(
totalItemsInLaundry: null == totalItemsInLaundry ? _self.totalItemsInLaundry : totalItemsInLaundry // ignore: cast_nullable_to_non_nullable
as int,totalWeightInLaundryKg: null == totalWeightInLaundryKg ? _self.totalWeightInLaundryKg : totalWeightInLaundryKg // ignore: cast_nullable_to_non_nullable
as double,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<TrackingDepartment>,
  ));
}


}


/// @nodoc
mixin _$HotelDashboardResponse {

@JsonKey(name: 'hotel_id') String get hotelId;@JsonKey(name: 'live_tracking') HotelDashboardLiveTracking get liveTracking;@JsonKey(name: 'recent_challans') List<HotelDashboardRecentChallan> get recentChallans;@JsonKey(name: 'pending_deliveries_count') int get pendingDeliveriesCount;@JsonKey(name: 'pending_deliveries') List<dynamic> get pendingDeliveries;
/// Create a copy of HotelDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelDashboardResponseCopyWith<HotelDashboardResponse> get copyWith => _$HotelDashboardResponseCopyWithImpl<HotelDashboardResponse>(this as HotelDashboardResponse, _$identity);

  /// Serializes this HotelDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelDashboardResponse&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.liveTracking, liveTracking) || other.liveTracking == liveTracking)&&const DeepCollectionEquality().equals(other.recentChallans, recentChallans)&&(identical(other.pendingDeliveriesCount, pendingDeliveriesCount) || other.pendingDeliveriesCount == pendingDeliveriesCount)&&const DeepCollectionEquality().equals(other.pendingDeliveries, pendingDeliveries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,liveTracking,const DeepCollectionEquality().hash(recentChallans),pendingDeliveriesCount,const DeepCollectionEquality().hash(pendingDeliveries));

@override
String toString() {
  return 'HotelDashboardResponse(hotelId: $hotelId, liveTracking: $liveTracking, recentChallans: $recentChallans, pendingDeliveriesCount: $pendingDeliveriesCount, pendingDeliveries: $pendingDeliveries)';
}


}

/// @nodoc
abstract mixin class $HotelDashboardResponseCopyWith<$Res>  {
  factory $HotelDashboardResponseCopyWith(HotelDashboardResponse value, $Res Function(HotelDashboardResponse) _then) = _$HotelDashboardResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'live_tracking') HotelDashboardLiveTracking liveTracking,@JsonKey(name: 'recent_challans') List<HotelDashboardRecentChallan> recentChallans,@JsonKey(name: 'pending_deliveries_count') int pendingDeliveriesCount,@JsonKey(name: 'pending_deliveries') List<dynamic> pendingDeliveries
});


$HotelDashboardLiveTrackingCopyWith<$Res> get liveTracking;

}
/// @nodoc
class _$HotelDashboardResponseCopyWithImpl<$Res>
    implements $HotelDashboardResponseCopyWith<$Res> {
  _$HotelDashboardResponseCopyWithImpl(this._self, this._then);

  final HotelDashboardResponse _self;
  final $Res Function(HotelDashboardResponse) _then;

/// Create a copy of HotelDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelId = null,Object? liveTracking = null,Object? recentChallans = null,Object? pendingDeliveriesCount = null,Object? pendingDeliveries = null,}) {
  return _then(_self.copyWith(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,liveTracking: null == liveTracking ? _self.liveTracking : liveTracking // ignore: cast_nullable_to_non_nullable
as HotelDashboardLiveTracking,recentChallans: null == recentChallans ? _self.recentChallans : recentChallans // ignore: cast_nullable_to_non_nullable
as List<HotelDashboardRecentChallan>,pendingDeliveriesCount: null == pendingDeliveriesCount ? _self.pendingDeliveriesCount : pendingDeliveriesCount // ignore: cast_nullable_to_non_nullable
as int,pendingDeliveries: null == pendingDeliveries ? _self.pendingDeliveries : pendingDeliveries // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of HotelDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelDashboardLiveTrackingCopyWith<$Res> get liveTracking {
  
  return $HotelDashboardLiveTrackingCopyWith<$Res>(_self.liveTracking, (value) {
    return _then(_self.copyWith(liveTracking: value));
  });
}
}


/// Adds pattern-matching-related methods to [HotelDashboardResponse].
extension HotelDashboardResponsePatterns on HotelDashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelDashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelDashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _HotelDashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelDashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HotelDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'live_tracking')  HotelDashboardLiveTracking liveTracking, @JsonKey(name: 'recent_challans')  List<HotelDashboardRecentChallan> recentChallans, @JsonKey(name: 'pending_deliveries_count')  int pendingDeliveriesCount, @JsonKey(name: 'pending_deliveries')  List<dynamic> pendingDeliveries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelDashboardResponse() when $default != null:
return $default(_that.hotelId,_that.liveTracking,_that.recentChallans,_that.pendingDeliveriesCount,_that.pendingDeliveries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'live_tracking')  HotelDashboardLiveTracking liveTracking, @JsonKey(name: 'recent_challans')  List<HotelDashboardRecentChallan> recentChallans, @JsonKey(name: 'pending_deliveries_count')  int pendingDeliveriesCount, @JsonKey(name: 'pending_deliveries')  List<dynamic> pendingDeliveries)  $default,) {final _that = this;
switch (_that) {
case _HotelDashboardResponse():
return $default(_that.hotelId,_that.liveTracking,_that.recentChallans,_that.pendingDeliveriesCount,_that.pendingDeliveries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'live_tracking')  HotelDashboardLiveTracking liveTracking, @JsonKey(name: 'recent_challans')  List<HotelDashboardRecentChallan> recentChallans, @JsonKey(name: 'pending_deliveries_count')  int pendingDeliveriesCount, @JsonKey(name: 'pending_deliveries')  List<dynamic> pendingDeliveries)?  $default,) {final _that = this;
switch (_that) {
case _HotelDashboardResponse() when $default != null:
return $default(_that.hotelId,_that.liveTracking,_that.recentChallans,_that.pendingDeliveriesCount,_that.pendingDeliveries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelDashboardResponse implements HotelDashboardResponse {
  const _HotelDashboardResponse({@JsonKey(name: 'hotel_id') required this.hotelId, @JsonKey(name: 'live_tracking') required this.liveTracking, @JsonKey(name: 'recent_challans') required final  List<HotelDashboardRecentChallan> recentChallans, @JsonKey(name: 'pending_deliveries_count') required this.pendingDeliveriesCount, @JsonKey(name: 'pending_deliveries') required final  List<dynamic> pendingDeliveries}): _recentChallans = recentChallans,_pendingDeliveries = pendingDeliveries;
  factory _HotelDashboardResponse.fromJson(Map<String, dynamic> json) => _$HotelDashboardResponseFromJson(json);

@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override@JsonKey(name: 'live_tracking') final  HotelDashboardLiveTracking liveTracking;
 final  List<HotelDashboardRecentChallan> _recentChallans;
@override@JsonKey(name: 'recent_challans') List<HotelDashboardRecentChallan> get recentChallans {
  if (_recentChallans is EqualUnmodifiableListView) return _recentChallans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentChallans);
}

@override@JsonKey(name: 'pending_deliveries_count') final  int pendingDeliveriesCount;
 final  List<dynamic> _pendingDeliveries;
@override@JsonKey(name: 'pending_deliveries') List<dynamic> get pendingDeliveries {
  if (_pendingDeliveries is EqualUnmodifiableListView) return _pendingDeliveries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingDeliveries);
}


/// Create a copy of HotelDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelDashboardResponseCopyWith<_HotelDashboardResponse> get copyWith => __$HotelDashboardResponseCopyWithImpl<_HotelDashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelDashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelDashboardResponse&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.liveTracking, liveTracking) || other.liveTracking == liveTracking)&&const DeepCollectionEquality().equals(other._recentChallans, _recentChallans)&&(identical(other.pendingDeliveriesCount, pendingDeliveriesCount) || other.pendingDeliveriesCount == pendingDeliveriesCount)&&const DeepCollectionEquality().equals(other._pendingDeliveries, _pendingDeliveries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,liveTracking,const DeepCollectionEquality().hash(_recentChallans),pendingDeliveriesCount,const DeepCollectionEquality().hash(_pendingDeliveries));

@override
String toString() {
  return 'HotelDashboardResponse(hotelId: $hotelId, liveTracking: $liveTracking, recentChallans: $recentChallans, pendingDeliveriesCount: $pendingDeliveriesCount, pendingDeliveries: $pendingDeliveries)';
}


}

/// @nodoc
abstract mixin class _$HotelDashboardResponseCopyWith<$Res> implements $HotelDashboardResponseCopyWith<$Res> {
  factory _$HotelDashboardResponseCopyWith(_HotelDashboardResponse value, $Res Function(_HotelDashboardResponse) _then) = __$HotelDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'live_tracking') HotelDashboardLiveTracking liveTracking,@JsonKey(name: 'recent_challans') List<HotelDashboardRecentChallan> recentChallans,@JsonKey(name: 'pending_deliveries_count') int pendingDeliveriesCount,@JsonKey(name: 'pending_deliveries') List<dynamic> pendingDeliveries
});


@override $HotelDashboardLiveTrackingCopyWith<$Res> get liveTracking;

}
/// @nodoc
class __$HotelDashboardResponseCopyWithImpl<$Res>
    implements _$HotelDashboardResponseCopyWith<$Res> {
  __$HotelDashboardResponseCopyWithImpl(this._self, this._then);

  final _HotelDashboardResponse _self;
  final $Res Function(_HotelDashboardResponse) _then;

/// Create a copy of HotelDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelId = null,Object? liveTracking = null,Object? recentChallans = null,Object? pendingDeliveriesCount = null,Object? pendingDeliveries = null,}) {
  return _then(_HotelDashboardResponse(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,liveTracking: null == liveTracking ? _self.liveTracking : liveTracking // ignore: cast_nullable_to_non_nullable
as HotelDashboardLiveTracking,recentChallans: null == recentChallans ? _self._recentChallans : recentChallans // ignore: cast_nullable_to_non_nullable
as List<HotelDashboardRecentChallan>,pendingDeliveriesCount: null == pendingDeliveriesCount ? _self.pendingDeliveriesCount : pendingDeliveriesCount // ignore: cast_nullable_to_non_nullable
as int,pendingDeliveries: null == pendingDeliveries ? _self._pendingDeliveries : pendingDeliveries // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of HotelDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelDashboardLiveTrackingCopyWith<$Res> get liveTracking {
  
  return $HotelDashboardLiveTrackingCopyWith<$Res>(_self.liveTracking, (value) {
    return _then(_self.copyWith(liveTracking: value));
  });
}
}

// dart format on
