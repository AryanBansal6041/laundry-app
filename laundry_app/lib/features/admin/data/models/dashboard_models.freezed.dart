// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuperAdminRecentChallan {

@JsonKey(name: 'challan_id') String get challanId;@JsonKey(name: 'challan_number') String get challanNumber;@JsonKey(name: 'challan_type') String get challanType;@JsonKey(name: 'hotel_name') String? get hotelName;@JsonKey(name: 'agent_name') String? get agentName;@JsonKey(name: 'entry_timestamp') DateTime get entryTimestamp;
/// Create a copy of SuperAdminRecentChallan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuperAdminRecentChallanCopyWith<SuperAdminRecentChallan> get copyWith => _$SuperAdminRecentChallanCopyWithImpl<SuperAdminRecentChallan>(this as SuperAdminRecentChallan, _$identity);

  /// Serializes this SuperAdminRecentChallan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuperAdminRecentChallan&&(identical(other.challanId, challanId) || other.challanId == challanId)&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanId,challanNumber,challanType,hotelName,agentName,entryTimestamp);

@override
String toString() {
  return 'SuperAdminRecentChallan(challanId: $challanId, challanNumber: $challanNumber, challanType: $challanType, hotelName: $hotelName, agentName: $agentName, entryTimestamp: $entryTimestamp)';
}


}

/// @nodoc
abstract mixin class $SuperAdminRecentChallanCopyWith<$Res>  {
  factory $SuperAdminRecentChallanCopyWith(SuperAdminRecentChallan value, $Res Function(SuperAdminRecentChallan) _then) = _$SuperAdminRecentChallanCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'challan_id') String challanId,@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'hotel_name') String? hotelName,@JsonKey(name: 'agent_name') String? agentName,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp
});




}
/// @nodoc
class _$SuperAdminRecentChallanCopyWithImpl<$Res>
    implements $SuperAdminRecentChallanCopyWith<$Res> {
  _$SuperAdminRecentChallanCopyWithImpl(this._self, this._then);

  final SuperAdminRecentChallan _self;
  final $Res Function(SuperAdminRecentChallan) _then;

/// Create a copy of SuperAdminRecentChallan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challanId = null,Object? challanNumber = null,Object? challanType = null,Object? hotelName = freezed,Object? agentName = freezed,Object? entryTimestamp = null,}) {
  return _then(_self.copyWith(
challanId: null == challanId ? _self.challanId : challanId // ignore: cast_nullable_to_non_nullable
as String,challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SuperAdminRecentChallan].
extension SuperAdminRecentChallanPatterns on SuperAdminRecentChallan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuperAdminRecentChallan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuperAdminRecentChallan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuperAdminRecentChallan value)  $default,){
final _that = this;
switch (_that) {
case _SuperAdminRecentChallan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuperAdminRecentChallan value)?  $default,){
final _that = this;
switch (_that) {
case _SuperAdminRecentChallan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_id')  String challanId, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'hotel_name')  String? hotelName, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuperAdminRecentChallan() when $default != null:
return $default(_that.challanId,_that.challanNumber,_that.challanType,_that.hotelName,_that.agentName,_that.entryTimestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'challan_id')  String challanId, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'hotel_name')  String? hotelName, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp)  $default,) {final _that = this;
switch (_that) {
case _SuperAdminRecentChallan():
return $default(_that.challanId,_that.challanNumber,_that.challanType,_that.hotelName,_that.agentName,_that.entryTimestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'challan_id')  String challanId, @JsonKey(name: 'challan_number')  String challanNumber, @JsonKey(name: 'challan_type')  String challanType, @JsonKey(name: 'hotel_name')  String? hotelName, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'entry_timestamp')  DateTime entryTimestamp)?  $default,) {final _that = this;
switch (_that) {
case _SuperAdminRecentChallan() when $default != null:
return $default(_that.challanId,_that.challanNumber,_that.challanType,_that.hotelName,_that.agentName,_that.entryTimestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuperAdminRecentChallan implements SuperAdminRecentChallan {
  const _SuperAdminRecentChallan({@JsonKey(name: 'challan_id') required this.challanId, @JsonKey(name: 'challan_number') required this.challanNumber, @JsonKey(name: 'challan_type') required this.challanType, @JsonKey(name: 'hotel_name') this.hotelName, @JsonKey(name: 'agent_name') this.agentName, @JsonKey(name: 'entry_timestamp') required this.entryTimestamp});
  factory _SuperAdminRecentChallan.fromJson(Map<String, dynamic> json) => _$SuperAdminRecentChallanFromJson(json);

@override@JsonKey(name: 'challan_id') final  String challanId;
@override@JsonKey(name: 'challan_number') final  String challanNumber;
@override@JsonKey(name: 'challan_type') final  String challanType;
@override@JsonKey(name: 'hotel_name') final  String? hotelName;
@override@JsonKey(name: 'agent_name') final  String? agentName;
@override@JsonKey(name: 'entry_timestamp') final  DateTime entryTimestamp;

/// Create a copy of SuperAdminRecentChallan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuperAdminRecentChallanCopyWith<_SuperAdminRecentChallan> get copyWith => __$SuperAdminRecentChallanCopyWithImpl<_SuperAdminRecentChallan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuperAdminRecentChallanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuperAdminRecentChallan&&(identical(other.challanId, challanId) || other.challanId == challanId)&&(identical(other.challanNumber, challanNumber) || other.challanNumber == challanNumber)&&(identical(other.challanType, challanType) || other.challanType == challanType)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.entryTimestamp, entryTimestamp) || other.entryTimestamp == entryTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challanId,challanNumber,challanType,hotelName,agentName,entryTimestamp);

@override
String toString() {
  return 'SuperAdminRecentChallan(challanId: $challanId, challanNumber: $challanNumber, challanType: $challanType, hotelName: $hotelName, agentName: $agentName, entryTimestamp: $entryTimestamp)';
}


}

/// @nodoc
abstract mixin class _$SuperAdminRecentChallanCopyWith<$Res> implements $SuperAdminRecentChallanCopyWith<$Res> {
  factory _$SuperAdminRecentChallanCopyWith(_SuperAdminRecentChallan value, $Res Function(_SuperAdminRecentChallan) _then) = __$SuperAdminRecentChallanCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'challan_id') String challanId,@JsonKey(name: 'challan_number') String challanNumber,@JsonKey(name: 'challan_type') String challanType,@JsonKey(name: 'hotel_name') String? hotelName,@JsonKey(name: 'agent_name') String? agentName,@JsonKey(name: 'entry_timestamp') DateTime entryTimestamp
});




}
/// @nodoc
class __$SuperAdminRecentChallanCopyWithImpl<$Res>
    implements _$SuperAdminRecentChallanCopyWith<$Res> {
  __$SuperAdminRecentChallanCopyWithImpl(this._self, this._then);

  final _SuperAdminRecentChallan _self;
  final $Res Function(_SuperAdminRecentChallan) _then;

/// Create a copy of SuperAdminRecentChallan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challanId = null,Object? challanNumber = null,Object? challanType = null,Object? hotelName = freezed,Object? agentName = freezed,Object? entryTimestamp = null,}) {
  return _then(_SuperAdminRecentChallan(
challanId: null == challanId ? _self.challanId : challanId // ignore: cast_nullable_to_non_nullable
as String,challanNumber: null == challanNumber ? _self.challanNumber : challanNumber // ignore: cast_nullable_to_non_nullable
as String,challanType: null == challanType ? _self.challanType : challanType // ignore: cast_nullable_to_non_nullable
as String,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,entryTimestamp: null == entryTimestamp ? _self.entryTimestamp : entryTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SuperAdminDashboardResponse {

@JsonKey(name: 'total_items_in_laundry') int get totalItemsInLaundry;@JsonKey(name: 'total_weight_in_laundry_kg') double get totalWeightInLaundryKg;@JsonKey(name: 'total_hotels') int get totalHotels;@JsonKey(name: 'recent_challans') List<SuperAdminRecentChallan> get recentChallans;
/// Create a copy of SuperAdminDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuperAdminDashboardResponseCopyWith<SuperAdminDashboardResponse> get copyWith => _$SuperAdminDashboardResponseCopyWithImpl<SuperAdminDashboardResponse>(this as SuperAdminDashboardResponse, _$identity);

  /// Serializes this SuperAdminDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuperAdminDashboardResponse&&(identical(other.totalItemsInLaundry, totalItemsInLaundry) || other.totalItemsInLaundry == totalItemsInLaundry)&&(identical(other.totalWeightInLaundryKg, totalWeightInLaundryKg) || other.totalWeightInLaundryKg == totalWeightInLaundryKg)&&(identical(other.totalHotels, totalHotels) || other.totalHotels == totalHotels)&&const DeepCollectionEquality().equals(other.recentChallans, recentChallans));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalItemsInLaundry,totalWeightInLaundryKg,totalHotels,const DeepCollectionEquality().hash(recentChallans));

@override
String toString() {
  return 'SuperAdminDashboardResponse(totalItemsInLaundry: $totalItemsInLaundry, totalWeightInLaundryKg: $totalWeightInLaundryKg, totalHotels: $totalHotels, recentChallans: $recentChallans)';
}


}

/// @nodoc
abstract mixin class $SuperAdminDashboardResponseCopyWith<$Res>  {
  factory $SuperAdminDashboardResponseCopyWith(SuperAdminDashboardResponse value, $Res Function(SuperAdminDashboardResponse) _then) = _$SuperAdminDashboardResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_items_in_laundry') int totalItemsInLaundry,@JsonKey(name: 'total_weight_in_laundry_kg') double totalWeightInLaundryKg,@JsonKey(name: 'total_hotels') int totalHotels,@JsonKey(name: 'recent_challans') List<SuperAdminRecentChallan> recentChallans
});




}
/// @nodoc
class _$SuperAdminDashboardResponseCopyWithImpl<$Res>
    implements $SuperAdminDashboardResponseCopyWith<$Res> {
  _$SuperAdminDashboardResponseCopyWithImpl(this._self, this._then);

  final SuperAdminDashboardResponse _self;
  final $Res Function(SuperAdminDashboardResponse) _then;

/// Create a copy of SuperAdminDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalItemsInLaundry = null,Object? totalWeightInLaundryKg = null,Object? totalHotels = null,Object? recentChallans = null,}) {
  return _then(_self.copyWith(
totalItemsInLaundry: null == totalItemsInLaundry ? _self.totalItemsInLaundry : totalItemsInLaundry // ignore: cast_nullable_to_non_nullable
as int,totalWeightInLaundryKg: null == totalWeightInLaundryKg ? _self.totalWeightInLaundryKg : totalWeightInLaundryKg // ignore: cast_nullable_to_non_nullable
as double,totalHotels: null == totalHotels ? _self.totalHotels : totalHotels // ignore: cast_nullable_to_non_nullable
as int,recentChallans: null == recentChallans ? _self.recentChallans : recentChallans // ignore: cast_nullable_to_non_nullable
as List<SuperAdminRecentChallan>,
  ));
}

}


/// Adds pattern-matching-related methods to [SuperAdminDashboardResponse].
extension SuperAdminDashboardResponsePatterns on SuperAdminDashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuperAdminDashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuperAdminDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuperAdminDashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _SuperAdminDashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuperAdminDashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SuperAdminDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_items_in_laundry')  int totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg')  double totalWeightInLaundryKg, @JsonKey(name: 'total_hotels')  int totalHotels, @JsonKey(name: 'recent_challans')  List<SuperAdminRecentChallan> recentChallans)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuperAdminDashboardResponse() when $default != null:
return $default(_that.totalItemsInLaundry,_that.totalWeightInLaundryKg,_that.totalHotels,_that.recentChallans);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_items_in_laundry')  int totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg')  double totalWeightInLaundryKg, @JsonKey(name: 'total_hotels')  int totalHotels, @JsonKey(name: 'recent_challans')  List<SuperAdminRecentChallan> recentChallans)  $default,) {final _that = this;
switch (_that) {
case _SuperAdminDashboardResponse():
return $default(_that.totalItemsInLaundry,_that.totalWeightInLaundryKg,_that.totalHotels,_that.recentChallans);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_items_in_laundry')  int totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg')  double totalWeightInLaundryKg, @JsonKey(name: 'total_hotels')  int totalHotels, @JsonKey(name: 'recent_challans')  List<SuperAdminRecentChallan> recentChallans)?  $default,) {final _that = this;
switch (_that) {
case _SuperAdminDashboardResponse() when $default != null:
return $default(_that.totalItemsInLaundry,_that.totalWeightInLaundryKg,_that.totalHotels,_that.recentChallans);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuperAdminDashboardResponse implements SuperAdminDashboardResponse {
  const _SuperAdminDashboardResponse({@JsonKey(name: 'total_items_in_laundry') required this.totalItemsInLaundry, @JsonKey(name: 'total_weight_in_laundry_kg') required this.totalWeightInLaundryKg, @JsonKey(name: 'total_hotels') required this.totalHotels, @JsonKey(name: 'recent_challans') required final  List<SuperAdminRecentChallan> recentChallans}): _recentChallans = recentChallans;
  factory _SuperAdminDashboardResponse.fromJson(Map<String, dynamic> json) => _$SuperAdminDashboardResponseFromJson(json);

@override@JsonKey(name: 'total_items_in_laundry') final  int totalItemsInLaundry;
@override@JsonKey(name: 'total_weight_in_laundry_kg') final  double totalWeightInLaundryKg;
@override@JsonKey(name: 'total_hotels') final  int totalHotels;
 final  List<SuperAdminRecentChallan> _recentChallans;
@override@JsonKey(name: 'recent_challans') List<SuperAdminRecentChallan> get recentChallans {
  if (_recentChallans is EqualUnmodifiableListView) return _recentChallans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentChallans);
}


/// Create a copy of SuperAdminDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuperAdminDashboardResponseCopyWith<_SuperAdminDashboardResponse> get copyWith => __$SuperAdminDashboardResponseCopyWithImpl<_SuperAdminDashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuperAdminDashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuperAdminDashboardResponse&&(identical(other.totalItemsInLaundry, totalItemsInLaundry) || other.totalItemsInLaundry == totalItemsInLaundry)&&(identical(other.totalWeightInLaundryKg, totalWeightInLaundryKg) || other.totalWeightInLaundryKg == totalWeightInLaundryKg)&&(identical(other.totalHotels, totalHotels) || other.totalHotels == totalHotels)&&const DeepCollectionEquality().equals(other._recentChallans, _recentChallans));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalItemsInLaundry,totalWeightInLaundryKg,totalHotels,const DeepCollectionEquality().hash(_recentChallans));

@override
String toString() {
  return 'SuperAdminDashboardResponse(totalItemsInLaundry: $totalItemsInLaundry, totalWeightInLaundryKg: $totalWeightInLaundryKg, totalHotels: $totalHotels, recentChallans: $recentChallans)';
}


}

/// @nodoc
abstract mixin class _$SuperAdminDashboardResponseCopyWith<$Res> implements $SuperAdminDashboardResponseCopyWith<$Res> {
  factory _$SuperAdminDashboardResponseCopyWith(_SuperAdminDashboardResponse value, $Res Function(_SuperAdminDashboardResponse) _then) = __$SuperAdminDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_items_in_laundry') int totalItemsInLaundry,@JsonKey(name: 'total_weight_in_laundry_kg') double totalWeightInLaundryKg,@JsonKey(name: 'total_hotels') int totalHotels,@JsonKey(name: 'recent_challans') List<SuperAdminRecentChallan> recentChallans
});




}
/// @nodoc
class __$SuperAdminDashboardResponseCopyWithImpl<$Res>
    implements _$SuperAdminDashboardResponseCopyWith<$Res> {
  __$SuperAdminDashboardResponseCopyWithImpl(this._self, this._then);

  final _SuperAdminDashboardResponse _self;
  final $Res Function(_SuperAdminDashboardResponse) _then;

/// Create a copy of SuperAdminDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalItemsInLaundry = null,Object? totalWeightInLaundryKg = null,Object? totalHotels = null,Object? recentChallans = null,}) {
  return _then(_SuperAdminDashboardResponse(
totalItemsInLaundry: null == totalItemsInLaundry ? _self.totalItemsInLaundry : totalItemsInLaundry // ignore: cast_nullable_to_non_nullable
as int,totalWeightInLaundryKg: null == totalWeightInLaundryKg ? _self.totalWeightInLaundryKg : totalWeightInLaundryKg // ignore: cast_nullable_to_non_nullable
as double,totalHotels: null == totalHotels ? _self.totalHotels : totalHotels // ignore: cast_nullable_to_non_nullable
as int,recentChallans: null == recentChallans ? _self._recentChallans : recentChallans // ignore: cast_nullable_to_non_nullable
as List<SuperAdminRecentChallan>,
  ));
}


}

// dart format on
