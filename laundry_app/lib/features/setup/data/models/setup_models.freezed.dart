// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepartmentCreateRequest {

 String get name;@JsonKey(name: 'billing_type') BillingType get billingType;@JsonKey(name: 'price_per_kg') double? get pricePerKg;@JsonKey(name: 'weight_source') WeightSource? get weightSource;
/// Create a copy of DepartmentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentCreateRequestCopyWith<DepartmentCreateRequest> get copyWith => _$DepartmentCreateRequestCopyWithImpl<DepartmentCreateRequest>(this as DepartmentCreateRequest, _$identity);

  /// Serializes this DepartmentCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.weightSource, weightSource) || other.weightSource == weightSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,billingType,pricePerKg,weightSource);

@override
String toString() {
  return 'DepartmentCreateRequest(name: $name, billingType: $billingType, pricePerKg: $pricePerKg, weightSource: $weightSource)';
}


}

/// @nodoc
abstract mixin class $DepartmentCreateRequestCopyWith<$Res>  {
  factory $DepartmentCreateRequestCopyWith(DepartmentCreateRequest value, $Res Function(DepartmentCreateRequest) _then) = _$DepartmentCreateRequestCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'billing_type') BillingType billingType,@JsonKey(name: 'price_per_kg') double? pricePerKg,@JsonKey(name: 'weight_source') WeightSource? weightSource
});




}
/// @nodoc
class _$DepartmentCreateRequestCopyWithImpl<$Res>
    implements $DepartmentCreateRequestCopyWith<$Res> {
  _$DepartmentCreateRequestCopyWithImpl(this._self, this._then);

  final DepartmentCreateRequest _self;
  final $Res Function(DepartmentCreateRequest) _then;

/// Create a copy of DepartmentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? billingType = null,Object? pricePerKg = freezed,Object? weightSource = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as BillingType,pricePerKg: freezed == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double?,weightSource: freezed == weightSource ? _self.weightSource : weightSource // ignore: cast_nullable_to_non_nullable
as WeightSource?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentCreateRequest].
extension DepartmentCreateRequestPatterns on DepartmentCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  double? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentCreateRequest() when $default != null:
return $default(_that.name,_that.billingType,_that.pricePerKg,_that.weightSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  double? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource)  $default,) {final _that = this;
switch (_that) {
case _DepartmentCreateRequest():
return $default(_that.name,_that.billingType,_that.pricePerKg,_that.weightSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  double? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentCreateRequest() when $default != null:
return $default(_that.name,_that.billingType,_that.pricePerKg,_that.weightSource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentCreateRequest implements DepartmentCreateRequest {
  const _DepartmentCreateRequest({required this.name, @JsonKey(name: 'billing_type') required this.billingType, @JsonKey(name: 'price_per_kg') this.pricePerKg, @JsonKey(name: 'weight_source') this.weightSource});
  factory _DepartmentCreateRequest.fromJson(Map<String, dynamic> json) => _$DepartmentCreateRequestFromJson(json);

@override final  String name;
@override@JsonKey(name: 'billing_type') final  BillingType billingType;
@override@JsonKey(name: 'price_per_kg') final  double? pricePerKg;
@override@JsonKey(name: 'weight_source') final  WeightSource? weightSource;

/// Create a copy of DepartmentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentCreateRequestCopyWith<_DepartmentCreateRequest> get copyWith => __$DepartmentCreateRequestCopyWithImpl<_DepartmentCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.weightSource, weightSource) || other.weightSource == weightSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,billingType,pricePerKg,weightSource);

@override
String toString() {
  return 'DepartmentCreateRequest(name: $name, billingType: $billingType, pricePerKg: $pricePerKg, weightSource: $weightSource)';
}


}

/// @nodoc
abstract mixin class _$DepartmentCreateRequestCopyWith<$Res> implements $DepartmentCreateRequestCopyWith<$Res> {
  factory _$DepartmentCreateRequestCopyWith(_DepartmentCreateRequest value, $Res Function(_DepartmentCreateRequest) _then) = __$DepartmentCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'billing_type') BillingType billingType,@JsonKey(name: 'price_per_kg') double? pricePerKg,@JsonKey(name: 'weight_source') WeightSource? weightSource
});




}
/// @nodoc
class __$DepartmentCreateRequestCopyWithImpl<$Res>
    implements _$DepartmentCreateRequestCopyWith<$Res> {
  __$DepartmentCreateRequestCopyWithImpl(this._self, this._then);

  final _DepartmentCreateRequest _self;
  final $Res Function(_DepartmentCreateRequest) _then;

/// Create a copy of DepartmentCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? billingType = null,Object? pricePerKg = freezed,Object? weightSource = freezed,}) {
  return _then(_DepartmentCreateRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as BillingType,pricePerKg: freezed == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double?,weightSource: freezed == weightSource ? _self.weightSource : weightSource // ignore: cast_nullable_to_non_nullable
as WeightSource?,
  ));
}


}


/// @nodoc
mixin _$DepartmentResponse {

 String get id;@JsonKey(name: 'hotel_id') String get hotelId; String get name;@JsonKey(name: 'billing_type') BillingType get billingType;@JsonKey(name: 'price_per_kg') String? get pricePerKg;@JsonKey(name: 'weight_source') WeightSource? get weightSource;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of DepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentResponseCopyWith<DepartmentResponse> get copyWith => _$DepartmentResponseCopyWithImpl<DepartmentResponse>(this as DepartmentResponse, _$identity);

  /// Serializes this DepartmentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.weightSource, weightSource) || other.weightSource == weightSource)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,billingType,pricePerKg,weightSource,createdAt);

@override
String toString() {
  return 'DepartmentResponse(id: $id, hotelId: $hotelId, name: $name, billingType: $billingType, pricePerKg: $pricePerKg, weightSource: $weightSource, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DepartmentResponseCopyWith<$Res>  {
  factory $DepartmentResponseCopyWith(DepartmentResponse value, $Res Function(DepartmentResponse) _then) = _$DepartmentResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'hotel_id') String hotelId, String name,@JsonKey(name: 'billing_type') BillingType billingType,@JsonKey(name: 'price_per_kg') String? pricePerKg,@JsonKey(name: 'weight_source') WeightSource? weightSource,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$DepartmentResponseCopyWithImpl<$Res>
    implements $DepartmentResponseCopyWith<$Res> {
  _$DepartmentResponseCopyWithImpl(this._self, this._then);

  final DepartmentResponse _self;
  final $Res Function(DepartmentResponse) _then;

/// Create a copy of DepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hotelId = null,Object? name = null,Object? billingType = null,Object? pricePerKg = freezed,Object? weightSource = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as BillingType,pricePerKg: freezed == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as String?,weightSource: freezed == weightSource ? _self.weightSource : weightSource // ignore: cast_nullable_to_non_nullable
as WeightSource?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentResponse].
extension DepartmentResponsePatterns on DepartmentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentResponse value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'hotel_id')  String hotelId,  String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  String? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentResponse() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.billingType,_that.pricePerKg,_that.weightSource,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'hotel_id')  String hotelId,  String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  String? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _DepartmentResponse():
return $default(_that.id,_that.hotelId,_that.name,_that.billingType,_that.pricePerKg,_that.weightSource,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'hotel_id')  String hotelId,  String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  String? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentResponse() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.billingType,_that.pricePerKg,_that.weightSource,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentResponse implements DepartmentResponse {
  const _DepartmentResponse({required this.id, @JsonKey(name: 'hotel_id') required this.hotelId, required this.name, @JsonKey(name: 'billing_type') required this.billingType, @JsonKey(name: 'price_per_kg') this.pricePerKg, @JsonKey(name: 'weight_source') this.weightSource, @JsonKey(name: 'created_at') required this.createdAt});
  factory _DepartmentResponse.fromJson(Map<String, dynamic> json) => _$DepartmentResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override final  String name;
@override@JsonKey(name: 'billing_type') final  BillingType billingType;
@override@JsonKey(name: 'price_per_kg') final  String? pricePerKg;
@override@JsonKey(name: 'weight_source') final  WeightSource? weightSource;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of DepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentResponseCopyWith<_DepartmentResponse> get copyWith => __$DepartmentResponseCopyWithImpl<_DepartmentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.weightSource, weightSource) || other.weightSource == weightSource)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,billingType,pricePerKg,weightSource,createdAt);

@override
String toString() {
  return 'DepartmentResponse(id: $id, hotelId: $hotelId, name: $name, billingType: $billingType, pricePerKg: $pricePerKg, weightSource: $weightSource, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DepartmentResponseCopyWith<$Res> implements $DepartmentResponseCopyWith<$Res> {
  factory _$DepartmentResponseCopyWith(_DepartmentResponse value, $Res Function(_DepartmentResponse) _then) = __$DepartmentResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'hotel_id') String hotelId, String name,@JsonKey(name: 'billing_type') BillingType billingType,@JsonKey(name: 'price_per_kg') String? pricePerKg,@JsonKey(name: 'weight_source') WeightSource? weightSource,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$DepartmentResponseCopyWithImpl<$Res>
    implements _$DepartmentResponseCopyWith<$Res> {
  __$DepartmentResponseCopyWithImpl(this._self, this._then);

  final _DepartmentResponse _self;
  final $Res Function(_DepartmentResponse) _then;

/// Create a copy of DepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hotelId = null,Object? name = null,Object? billingType = null,Object? pricePerKg = freezed,Object? weightSource = freezed,Object? createdAt = null,}) {
  return _then(_DepartmentResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as BillingType,pricePerKg: freezed == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as String?,weightSource: freezed == weightSource ? _self.weightSource : weightSource // ignore: cast_nullable_to_non_nullable
as WeightSource?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ItemCreateRequest {

 String get name;
/// Create a copy of ItemCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCreateRequestCopyWith<ItemCreateRequest> get copyWith => _$ItemCreateRequestCopyWithImpl<ItemCreateRequest>(this as ItemCreateRequest, _$identity);

  /// Serializes this ItemCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemCreateRequest&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ItemCreateRequest(name: $name)';
}


}

/// @nodoc
abstract mixin class $ItemCreateRequestCopyWith<$Res>  {
  factory $ItemCreateRequestCopyWith(ItemCreateRequest value, $Res Function(ItemCreateRequest) _then) = _$ItemCreateRequestCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$ItemCreateRequestCopyWithImpl<$Res>
    implements $ItemCreateRequestCopyWith<$Res> {
  _$ItemCreateRequestCopyWithImpl(this._self, this._then);

  final ItemCreateRequest _self;
  final $Res Function(ItemCreateRequest) _then;

/// Create a copy of ItemCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemCreateRequest].
extension ItemCreateRequestPatterns on ItemCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _ItemCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ItemCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemCreateRequest() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _ItemCreateRequest():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _ItemCreateRequest() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemCreateRequest implements ItemCreateRequest {
  const _ItemCreateRequest({required this.name});
  factory _ItemCreateRequest.fromJson(Map<String, dynamic> json) => _$ItemCreateRequestFromJson(json);

@override final  String name;

/// Create a copy of ItemCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCreateRequestCopyWith<_ItemCreateRequest> get copyWith => __$ItemCreateRequestCopyWithImpl<_ItemCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemCreateRequest&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ItemCreateRequest(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ItemCreateRequestCopyWith<$Res> implements $ItemCreateRequestCopyWith<$Res> {
  factory _$ItemCreateRequestCopyWith(_ItemCreateRequest value, $Res Function(_ItemCreateRequest) _then) = __$ItemCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$ItemCreateRequestCopyWithImpl<$Res>
    implements _$ItemCreateRequestCopyWith<$Res> {
  __$ItemCreateRequestCopyWithImpl(this._self, this._then);

  final _ItemCreateRequest _self;
  final $Res Function(_ItemCreateRequest) _then;

/// Create a copy of ItemCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_ItemCreateRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ItemResponse {

 String get id; String get name;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of ItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemResponseCopyWith<ItemResponse> get copyWith => _$ItemResponseCopyWithImpl<ItemResponse>(this as ItemResponse, _$identity);

  /// Serializes this ItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt);

@override
String toString() {
  return 'ItemResponse(id: $id, name: $name, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ItemResponseCopyWith<$Res>  {
  factory $ItemResponseCopyWith(ItemResponse value, $Res Function(ItemResponse) _then) = _$ItemResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$ItemResponseCopyWithImpl<$Res>
    implements $ItemResponseCopyWith<$Res> {
  _$ItemResponseCopyWithImpl(this._self, this._then);

  final ItemResponse _self;
  final $Res Function(ItemResponse) _then;

/// Create a copy of ItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemResponse].
extension ItemResponsePatterns on ItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _ItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemResponse() when $default != null:
return $default(_that.id,_that.name,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ItemResponse():
return $default(_that.id,_that.name,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ItemResponse() when $default != null:
return $default(_that.id,_that.name,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemResponse implements ItemResponse {
  const _ItemResponse({required this.id, required this.name, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ItemResponse.fromJson(Map<String, dynamic> json) => _$ItemResponseFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of ItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemResponseCopyWith<_ItemResponse> get copyWith => __$ItemResponseCopyWithImpl<_ItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt);

@override
String toString() {
  return 'ItemResponse(id: $id, name: $name, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ItemResponseCopyWith<$Res> implements $ItemResponseCopyWith<$Res> {
  factory _$ItemResponseCopyWith(_ItemResponse value, $Res Function(_ItemResponse) _then) = __$ItemResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$ItemResponseCopyWithImpl<$Res>
    implements _$ItemResponseCopyWith<$Res> {
  __$ItemResponseCopyWithImpl(this._self, this._then);

  final _ItemResponse _self;
  final $Res Function(_ItemResponse) _then;

/// Create a copy of ItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = null,}) {
  return _then(_ItemResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$DeptItemLinkRequest {

@JsonKey(name: 'item_id') String get itemId;@JsonKey(name: 'price_per_piece') double? get pricePerPiece;@JsonKey(name: 'calculated_weight') double? get calculatedWeight;
/// Create a copy of DeptItemLinkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeptItemLinkRequestCopyWith<DeptItemLinkRequest> get copyWith => _$DeptItemLinkRequestCopyWithImpl<DeptItemLinkRequest>(this as DeptItemLinkRequest, _$identity);

  /// Serializes this DeptItemLinkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeptItemLinkRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.pricePerPiece, pricePerPiece) || other.pricePerPiece == pricePerPiece)&&(identical(other.calculatedWeight, calculatedWeight) || other.calculatedWeight == calculatedWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,pricePerPiece,calculatedWeight);

@override
String toString() {
  return 'DeptItemLinkRequest(itemId: $itemId, pricePerPiece: $pricePerPiece, calculatedWeight: $calculatedWeight)';
}


}

/// @nodoc
abstract mixin class $DeptItemLinkRequestCopyWith<$Res>  {
  factory $DeptItemLinkRequestCopyWith(DeptItemLinkRequest value, $Res Function(DeptItemLinkRequest) _then) = _$DeptItemLinkRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'price_per_piece') double? pricePerPiece,@JsonKey(name: 'calculated_weight') double? calculatedWeight
});




}
/// @nodoc
class _$DeptItemLinkRequestCopyWithImpl<$Res>
    implements $DeptItemLinkRequestCopyWith<$Res> {
  _$DeptItemLinkRequestCopyWithImpl(this._self, this._then);

  final DeptItemLinkRequest _self;
  final $Res Function(DeptItemLinkRequest) _then;

/// Create a copy of DeptItemLinkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? pricePerPiece = freezed,Object? calculatedWeight = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,pricePerPiece: freezed == pricePerPiece ? _self.pricePerPiece : pricePerPiece // ignore: cast_nullable_to_non_nullable
as double?,calculatedWeight: freezed == calculatedWeight ? _self.calculatedWeight : calculatedWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeptItemLinkRequest].
extension DeptItemLinkRequestPatterns on DeptItemLinkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeptItemLinkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeptItemLinkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeptItemLinkRequest value)  $default,){
final _that = this;
switch (_that) {
case _DeptItemLinkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeptItemLinkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DeptItemLinkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'price_per_piece')  double? pricePerPiece, @JsonKey(name: 'calculated_weight')  double? calculatedWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeptItemLinkRequest() when $default != null:
return $default(_that.itemId,_that.pricePerPiece,_that.calculatedWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'price_per_piece')  double? pricePerPiece, @JsonKey(name: 'calculated_weight')  double? calculatedWeight)  $default,) {final _that = this;
switch (_that) {
case _DeptItemLinkRequest():
return $default(_that.itemId,_that.pricePerPiece,_that.calculatedWeight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'price_per_piece')  double? pricePerPiece, @JsonKey(name: 'calculated_weight')  double? calculatedWeight)?  $default,) {final _that = this;
switch (_that) {
case _DeptItemLinkRequest() when $default != null:
return $default(_that.itemId,_that.pricePerPiece,_that.calculatedWeight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeptItemLinkRequest implements DeptItemLinkRequest {
  const _DeptItemLinkRequest({@JsonKey(name: 'item_id') required this.itemId, @JsonKey(name: 'price_per_piece') this.pricePerPiece, @JsonKey(name: 'calculated_weight') this.calculatedWeight});
  factory _DeptItemLinkRequest.fromJson(Map<String, dynamic> json) => _$DeptItemLinkRequestFromJson(json);

@override@JsonKey(name: 'item_id') final  String itemId;
@override@JsonKey(name: 'price_per_piece') final  double? pricePerPiece;
@override@JsonKey(name: 'calculated_weight') final  double? calculatedWeight;

/// Create a copy of DeptItemLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeptItemLinkRequestCopyWith<_DeptItemLinkRequest> get copyWith => __$DeptItemLinkRequestCopyWithImpl<_DeptItemLinkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeptItemLinkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeptItemLinkRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.pricePerPiece, pricePerPiece) || other.pricePerPiece == pricePerPiece)&&(identical(other.calculatedWeight, calculatedWeight) || other.calculatedWeight == calculatedWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,pricePerPiece,calculatedWeight);

@override
String toString() {
  return 'DeptItemLinkRequest(itemId: $itemId, pricePerPiece: $pricePerPiece, calculatedWeight: $calculatedWeight)';
}


}

/// @nodoc
abstract mixin class _$DeptItemLinkRequestCopyWith<$Res> implements $DeptItemLinkRequestCopyWith<$Res> {
  factory _$DeptItemLinkRequestCopyWith(_DeptItemLinkRequest value, $Res Function(_DeptItemLinkRequest) _then) = __$DeptItemLinkRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'price_per_piece') double? pricePerPiece,@JsonKey(name: 'calculated_weight') double? calculatedWeight
});




}
/// @nodoc
class __$DeptItemLinkRequestCopyWithImpl<$Res>
    implements _$DeptItemLinkRequestCopyWith<$Res> {
  __$DeptItemLinkRequestCopyWithImpl(this._self, this._then);

  final _DeptItemLinkRequest _self;
  final $Res Function(_DeptItemLinkRequest) _then;

/// Create a copy of DeptItemLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? pricePerPiece = freezed,Object? calculatedWeight = freezed,}) {
  return _then(_DeptItemLinkRequest(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,pricePerPiece: freezed == pricePerPiece ? _self.pricePerPiece : pricePerPiece // ignore: cast_nullable_to_non_nullable
as double?,calculatedWeight: freezed == calculatedWeight ? _self.calculatedWeight : calculatedWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$DeptItemLinkResponse {

 String get id;@JsonKey(name: 'dept_id') String get deptId;@JsonKey(name: 'item_id') String get itemId;@JsonKey(name: 'price_per_piece') String? get pricePerPiece;@JsonKey(name: 'calculated_weight') String? get calculatedWeight;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of DeptItemLinkResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeptItemLinkResponseCopyWith<DeptItemLinkResponse> get copyWith => _$DeptItemLinkResponseCopyWithImpl<DeptItemLinkResponse>(this as DeptItemLinkResponse, _$identity);

  /// Serializes this DeptItemLinkResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeptItemLinkResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.pricePerPiece, pricePerPiece) || other.pricePerPiece == pricePerPiece)&&(identical(other.calculatedWeight, calculatedWeight) || other.calculatedWeight == calculatedWeight)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deptId,itemId,pricePerPiece,calculatedWeight,createdAt);

@override
String toString() {
  return 'DeptItemLinkResponse(id: $id, deptId: $deptId, itemId: $itemId, pricePerPiece: $pricePerPiece, calculatedWeight: $calculatedWeight, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DeptItemLinkResponseCopyWith<$Res>  {
  factory $DeptItemLinkResponseCopyWith(DeptItemLinkResponse value, $Res Function(DeptItemLinkResponse) _then) = _$DeptItemLinkResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'dept_id') String deptId,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'price_per_piece') String? pricePerPiece,@JsonKey(name: 'calculated_weight') String? calculatedWeight,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$DeptItemLinkResponseCopyWithImpl<$Res>
    implements $DeptItemLinkResponseCopyWith<$Res> {
  _$DeptItemLinkResponseCopyWithImpl(this._self, this._then);

  final DeptItemLinkResponse _self;
  final $Res Function(DeptItemLinkResponse) _then;

/// Create a copy of DeptItemLinkResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deptId = null,Object? itemId = null,Object? pricePerPiece = freezed,Object? calculatedWeight = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,pricePerPiece: freezed == pricePerPiece ? _self.pricePerPiece : pricePerPiece // ignore: cast_nullable_to_non_nullable
as String?,calculatedWeight: freezed == calculatedWeight ? _self.calculatedWeight : calculatedWeight // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DeptItemLinkResponse].
extension DeptItemLinkResponsePatterns on DeptItemLinkResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeptItemLinkResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeptItemLinkResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeptItemLinkResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeptItemLinkResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeptItemLinkResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeptItemLinkResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'price_per_piece')  String? pricePerPiece, @JsonKey(name: 'calculated_weight')  String? calculatedWeight, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeptItemLinkResponse() when $default != null:
return $default(_that.id,_that.deptId,_that.itemId,_that.pricePerPiece,_that.calculatedWeight,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'price_per_piece')  String? pricePerPiece, @JsonKey(name: 'calculated_weight')  String? calculatedWeight, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _DeptItemLinkResponse():
return $default(_that.id,_that.deptId,_that.itemId,_that.pricePerPiece,_that.calculatedWeight,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'dept_id')  String deptId, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'price_per_piece')  String? pricePerPiece, @JsonKey(name: 'calculated_weight')  String? calculatedWeight, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DeptItemLinkResponse() when $default != null:
return $default(_that.id,_that.deptId,_that.itemId,_that.pricePerPiece,_that.calculatedWeight,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeptItemLinkResponse implements DeptItemLinkResponse {
  const _DeptItemLinkResponse({required this.id, @JsonKey(name: 'dept_id') required this.deptId, @JsonKey(name: 'item_id') required this.itemId, @JsonKey(name: 'price_per_piece') this.pricePerPiece, @JsonKey(name: 'calculated_weight') this.calculatedWeight, @JsonKey(name: 'created_at') required this.createdAt});
  factory _DeptItemLinkResponse.fromJson(Map<String, dynamic> json) => _$DeptItemLinkResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'dept_id') final  String deptId;
@override@JsonKey(name: 'item_id') final  String itemId;
@override@JsonKey(name: 'price_per_piece') final  String? pricePerPiece;
@override@JsonKey(name: 'calculated_weight') final  String? calculatedWeight;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of DeptItemLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeptItemLinkResponseCopyWith<_DeptItemLinkResponse> get copyWith => __$DeptItemLinkResponseCopyWithImpl<_DeptItemLinkResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeptItemLinkResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeptItemLinkResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.pricePerPiece, pricePerPiece) || other.pricePerPiece == pricePerPiece)&&(identical(other.calculatedWeight, calculatedWeight) || other.calculatedWeight == calculatedWeight)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deptId,itemId,pricePerPiece,calculatedWeight,createdAt);

@override
String toString() {
  return 'DeptItemLinkResponse(id: $id, deptId: $deptId, itemId: $itemId, pricePerPiece: $pricePerPiece, calculatedWeight: $calculatedWeight, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DeptItemLinkResponseCopyWith<$Res> implements $DeptItemLinkResponseCopyWith<$Res> {
  factory _$DeptItemLinkResponseCopyWith(_DeptItemLinkResponse value, $Res Function(_DeptItemLinkResponse) _then) = __$DeptItemLinkResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'dept_id') String deptId,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'price_per_piece') String? pricePerPiece,@JsonKey(name: 'calculated_weight') String? calculatedWeight,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$DeptItemLinkResponseCopyWithImpl<$Res>
    implements _$DeptItemLinkResponseCopyWith<$Res> {
  __$DeptItemLinkResponseCopyWithImpl(this._self, this._then);

  final _DeptItemLinkResponse _self;
  final $Res Function(_DeptItemLinkResponse) _then;

/// Create a copy of DeptItemLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deptId = null,Object? itemId = null,Object? pricePerPiece = freezed,Object? calculatedWeight = freezed,Object? createdAt = null,}) {
  return _then(_DeptItemLinkResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,pricePerPiece: freezed == pricePerPiece ? _self.pricePerPiece : pricePerPiece // ignore: cast_nullable_to_non_nullable
as String?,calculatedWeight: freezed == calculatedWeight ? _self.calculatedWeight : calculatedWeight // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$FormSchemaResponse {

@JsonKey(name: 'hotel_id') String get hotelId; List<FormSchemaDepartment> get departments;
/// Create a copy of FormSchemaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormSchemaResponseCopyWith<FormSchemaResponse> get copyWith => _$FormSchemaResponseCopyWithImpl<FormSchemaResponse>(this as FormSchemaResponse, _$identity);

  /// Serializes this FormSchemaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormSchemaResponse&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'FormSchemaResponse(hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class $FormSchemaResponseCopyWith<$Res>  {
  factory $FormSchemaResponseCopyWith(FormSchemaResponse value, $Res Function(FormSchemaResponse) _then) = _$FormSchemaResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId, List<FormSchemaDepartment> departments
});




}
/// @nodoc
class _$FormSchemaResponseCopyWithImpl<$Res>
    implements $FormSchemaResponseCopyWith<$Res> {
  _$FormSchemaResponseCopyWithImpl(this._self, this._then);

  final FormSchemaResponse _self;
  final $Res Function(FormSchemaResponse) _then;

/// Create a copy of FormSchemaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelId = null,Object? departments = null,}) {
  return _then(_self.copyWith(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<FormSchemaDepartment>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormSchemaResponse].
extension FormSchemaResponsePatterns on FormSchemaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormSchemaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormSchemaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormSchemaResponse value)  $default,){
final _that = this;
switch (_that) {
case _FormSchemaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormSchemaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FormSchemaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId,  List<FormSchemaDepartment> departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormSchemaResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotel_id')  String hotelId,  List<FormSchemaDepartment> departments)  $default,) {final _that = this;
switch (_that) {
case _FormSchemaResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotel_id')  String hotelId,  List<FormSchemaDepartment> departments)?  $default,) {final _that = this;
switch (_that) {
case _FormSchemaResponse() when $default != null:
return $default(_that.hotelId,_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormSchemaResponse implements FormSchemaResponse {
  const _FormSchemaResponse({@JsonKey(name: 'hotel_id') required this.hotelId, required final  List<FormSchemaDepartment> departments}): _departments = departments;
  factory _FormSchemaResponse.fromJson(Map<String, dynamic> json) => _$FormSchemaResponseFromJson(json);

@override@JsonKey(name: 'hotel_id') final  String hotelId;
 final  List<FormSchemaDepartment> _departments;
@override List<FormSchemaDepartment> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}


/// Create a copy of FormSchemaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormSchemaResponseCopyWith<_FormSchemaResponse> get copyWith => __$FormSchemaResponseCopyWithImpl<_FormSchemaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormSchemaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormSchemaResponse&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelId,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'FormSchemaResponse(hotelId: $hotelId, departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$FormSchemaResponseCopyWith<$Res> implements $FormSchemaResponseCopyWith<$Res> {
  factory _$FormSchemaResponseCopyWith(_FormSchemaResponse value, $Res Function(_FormSchemaResponse) _then) = __$FormSchemaResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotel_id') String hotelId, List<FormSchemaDepartment> departments
});




}
/// @nodoc
class __$FormSchemaResponseCopyWithImpl<$Res>
    implements _$FormSchemaResponseCopyWith<$Res> {
  __$FormSchemaResponseCopyWithImpl(this._self, this._then);

  final _FormSchemaResponse _self;
  final $Res Function(_FormSchemaResponse) _then;

/// Create a copy of FormSchemaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelId = null,Object? departments = null,}) {
  return _then(_FormSchemaResponse(
hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<FormSchemaDepartment>,
  ));
}


}


/// @nodoc
mixin _$FormSchemaDepartment {

@JsonKey(name: 'dept_id') String get deptId; String get name;@JsonKey(name: 'billing_type') BillingType get billingType;@JsonKey(name: 'price_per_kg') String? get pricePerKg;@JsonKey(name: 'weight_source') WeightSource? get weightSource; List<FormSchemaItem> get items;
/// Create a copy of FormSchemaDepartment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormSchemaDepartmentCopyWith<FormSchemaDepartment> get copyWith => _$FormSchemaDepartmentCopyWithImpl<FormSchemaDepartment>(this as FormSchemaDepartment, _$identity);

  /// Serializes this FormSchemaDepartment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormSchemaDepartment&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.name, name) || other.name == name)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.weightSource, weightSource) || other.weightSource == weightSource)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptId,name,billingType,pricePerKg,weightSource,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'FormSchemaDepartment(deptId: $deptId, name: $name, billingType: $billingType, pricePerKg: $pricePerKg, weightSource: $weightSource, items: $items)';
}


}

/// @nodoc
abstract mixin class $FormSchemaDepartmentCopyWith<$Res>  {
  factory $FormSchemaDepartmentCopyWith(FormSchemaDepartment value, $Res Function(FormSchemaDepartment) _then) = _$FormSchemaDepartmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dept_id') String deptId, String name,@JsonKey(name: 'billing_type') BillingType billingType,@JsonKey(name: 'price_per_kg') String? pricePerKg,@JsonKey(name: 'weight_source') WeightSource? weightSource, List<FormSchemaItem> items
});




}
/// @nodoc
class _$FormSchemaDepartmentCopyWithImpl<$Res>
    implements $FormSchemaDepartmentCopyWith<$Res> {
  _$FormSchemaDepartmentCopyWithImpl(this._self, this._then);

  final FormSchemaDepartment _self;
  final $Res Function(FormSchemaDepartment) _then;

/// Create a copy of FormSchemaDepartment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deptId = null,Object? name = null,Object? billingType = null,Object? pricePerKg = freezed,Object? weightSource = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as BillingType,pricePerKg: freezed == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as String?,weightSource: freezed == weightSource ? _self.weightSource : weightSource // ignore: cast_nullable_to_non_nullable
as WeightSource?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FormSchemaItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormSchemaDepartment].
extension FormSchemaDepartmentPatterns on FormSchemaDepartment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormSchemaDepartment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormSchemaDepartment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormSchemaDepartment value)  $default,){
final _that = this;
switch (_that) {
case _FormSchemaDepartment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormSchemaDepartment value)?  $default,){
final _that = this;
switch (_that) {
case _FormSchemaDepartment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_id')  String deptId,  String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  String? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource,  List<FormSchemaItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormSchemaDepartment() when $default != null:
return $default(_that.deptId,_that.name,_that.billingType,_that.pricePerKg,_that.weightSource,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dept_id')  String deptId,  String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  String? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource,  List<FormSchemaItem> items)  $default,) {final _that = this;
switch (_that) {
case _FormSchemaDepartment():
return $default(_that.deptId,_that.name,_that.billingType,_that.pricePerKg,_that.weightSource,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dept_id')  String deptId,  String name, @JsonKey(name: 'billing_type')  BillingType billingType, @JsonKey(name: 'price_per_kg')  String? pricePerKg, @JsonKey(name: 'weight_source')  WeightSource? weightSource,  List<FormSchemaItem> items)?  $default,) {final _that = this;
switch (_that) {
case _FormSchemaDepartment() when $default != null:
return $default(_that.deptId,_that.name,_that.billingType,_that.pricePerKg,_that.weightSource,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormSchemaDepartment implements FormSchemaDepartment {
  const _FormSchemaDepartment({@JsonKey(name: 'dept_id') required this.deptId, required this.name, @JsonKey(name: 'billing_type') required this.billingType, @JsonKey(name: 'price_per_kg') this.pricePerKg, @JsonKey(name: 'weight_source') this.weightSource, required final  List<FormSchemaItem> items}): _items = items;
  factory _FormSchemaDepartment.fromJson(Map<String, dynamic> json) => _$FormSchemaDepartmentFromJson(json);

@override@JsonKey(name: 'dept_id') final  String deptId;
@override final  String name;
@override@JsonKey(name: 'billing_type') final  BillingType billingType;
@override@JsonKey(name: 'price_per_kg') final  String? pricePerKg;
@override@JsonKey(name: 'weight_source') final  WeightSource? weightSource;
 final  List<FormSchemaItem> _items;
@override List<FormSchemaItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of FormSchemaDepartment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormSchemaDepartmentCopyWith<_FormSchemaDepartment> get copyWith => __$FormSchemaDepartmentCopyWithImpl<_FormSchemaDepartment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormSchemaDepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormSchemaDepartment&&(identical(other.deptId, deptId) || other.deptId == deptId)&&(identical(other.name, name) || other.name == name)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.weightSource, weightSource) || other.weightSource == weightSource)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deptId,name,billingType,pricePerKg,weightSource,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'FormSchemaDepartment(deptId: $deptId, name: $name, billingType: $billingType, pricePerKg: $pricePerKg, weightSource: $weightSource, items: $items)';
}


}

/// @nodoc
abstract mixin class _$FormSchemaDepartmentCopyWith<$Res> implements $FormSchemaDepartmentCopyWith<$Res> {
  factory _$FormSchemaDepartmentCopyWith(_FormSchemaDepartment value, $Res Function(_FormSchemaDepartment) _then) = __$FormSchemaDepartmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dept_id') String deptId, String name,@JsonKey(name: 'billing_type') BillingType billingType,@JsonKey(name: 'price_per_kg') String? pricePerKg,@JsonKey(name: 'weight_source') WeightSource? weightSource, List<FormSchemaItem> items
});




}
/// @nodoc
class __$FormSchemaDepartmentCopyWithImpl<$Res>
    implements _$FormSchemaDepartmentCopyWith<$Res> {
  __$FormSchemaDepartmentCopyWithImpl(this._self, this._then);

  final _FormSchemaDepartment _self;
  final $Res Function(_FormSchemaDepartment) _then;

/// Create a copy of FormSchemaDepartment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deptId = null,Object? name = null,Object? billingType = null,Object? pricePerKg = freezed,Object? weightSource = freezed,Object? items = null,}) {
  return _then(_FormSchemaDepartment(
deptId: null == deptId ? _self.deptId : deptId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as BillingType,pricePerKg: freezed == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as String?,weightSource: freezed == weightSource ? _self.weightSource : weightSource // ignore: cast_nullable_to_non_nullable
as WeightSource?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FormSchemaItem>,
  ));
}


}


/// @nodoc
mixin _$FormSchemaItem {

@JsonKey(name: 'item_id') String get itemId; String get name;@JsonKey(name: 'price_per_piece') String? get pricePerPiece;@JsonKey(name: 'calculated_weight') String? get calculatedWeight;
/// Create a copy of FormSchemaItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormSchemaItemCopyWith<FormSchemaItem> get copyWith => _$FormSchemaItemCopyWithImpl<FormSchemaItem>(this as FormSchemaItem, _$identity);

  /// Serializes this FormSchemaItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormSchemaItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerPiece, pricePerPiece) || other.pricePerPiece == pricePerPiece)&&(identical(other.calculatedWeight, calculatedWeight) || other.calculatedWeight == calculatedWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,name,pricePerPiece,calculatedWeight);

@override
String toString() {
  return 'FormSchemaItem(itemId: $itemId, name: $name, pricePerPiece: $pricePerPiece, calculatedWeight: $calculatedWeight)';
}


}

/// @nodoc
abstract mixin class $FormSchemaItemCopyWith<$Res>  {
  factory $FormSchemaItemCopyWith(FormSchemaItem value, $Res Function(FormSchemaItem) _then) = _$FormSchemaItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_id') String itemId, String name,@JsonKey(name: 'price_per_piece') String? pricePerPiece,@JsonKey(name: 'calculated_weight') String? calculatedWeight
});




}
/// @nodoc
class _$FormSchemaItemCopyWithImpl<$Res>
    implements $FormSchemaItemCopyWith<$Res> {
  _$FormSchemaItemCopyWithImpl(this._self, this._then);

  final FormSchemaItem _self;
  final $Res Function(FormSchemaItem) _then;

/// Create a copy of FormSchemaItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? name = null,Object? pricePerPiece = freezed,Object? calculatedWeight = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerPiece: freezed == pricePerPiece ? _self.pricePerPiece : pricePerPiece // ignore: cast_nullable_to_non_nullable
as String?,calculatedWeight: freezed == calculatedWeight ? _self.calculatedWeight : calculatedWeight // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FormSchemaItem].
extension FormSchemaItemPatterns on FormSchemaItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormSchemaItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormSchemaItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormSchemaItem value)  $default,){
final _that = this;
switch (_that) {
case _FormSchemaItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormSchemaItem value)?  $default,){
final _that = this;
switch (_that) {
case _FormSchemaItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId,  String name, @JsonKey(name: 'price_per_piece')  String? pricePerPiece, @JsonKey(name: 'calculated_weight')  String? calculatedWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormSchemaItem() when $default != null:
return $default(_that.itemId,_that.name,_that.pricePerPiece,_that.calculatedWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId,  String name, @JsonKey(name: 'price_per_piece')  String? pricePerPiece, @JsonKey(name: 'calculated_weight')  String? calculatedWeight)  $default,) {final _that = this;
switch (_that) {
case _FormSchemaItem():
return $default(_that.itemId,_that.name,_that.pricePerPiece,_that.calculatedWeight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_id')  String itemId,  String name, @JsonKey(name: 'price_per_piece')  String? pricePerPiece, @JsonKey(name: 'calculated_weight')  String? calculatedWeight)?  $default,) {final _that = this;
switch (_that) {
case _FormSchemaItem() when $default != null:
return $default(_that.itemId,_that.name,_that.pricePerPiece,_that.calculatedWeight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormSchemaItem implements FormSchemaItem {
  const _FormSchemaItem({@JsonKey(name: 'item_id') required this.itemId, required this.name, @JsonKey(name: 'price_per_piece') this.pricePerPiece, @JsonKey(name: 'calculated_weight') this.calculatedWeight});
  factory _FormSchemaItem.fromJson(Map<String, dynamic> json) => _$FormSchemaItemFromJson(json);

@override@JsonKey(name: 'item_id') final  String itemId;
@override final  String name;
@override@JsonKey(name: 'price_per_piece') final  String? pricePerPiece;
@override@JsonKey(name: 'calculated_weight') final  String? calculatedWeight;

/// Create a copy of FormSchemaItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormSchemaItemCopyWith<_FormSchemaItem> get copyWith => __$FormSchemaItemCopyWithImpl<_FormSchemaItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormSchemaItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormSchemaItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.pricePerPiece, pricePerPiece) || other.pricePerPiece == pricePerPiece)&&(identical(other.calculatedWeight, calculatedWeight) || other.calculatedWeight == calculatedWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,name,pricePerPiece,calculatedWeight);

@override
String toString() {
  return 'FormSchemaItem(itemId: $itemId, name: $name, pricePerPiece: $pricePerPiece, calculatedWeight: $calculatedWeight)';
}


}

/// @nodoc
abstract mixin class _$FormSchemaItemCopyWith<$Res> implements $FormSchemaItemCopyWith<$Res> {
  factory _$FormSchemaItemCopyWith(_FormSchemaItem value, $Res Function(_FormSchemaItem) _then) = __$FormSchemaItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_id') String itemId, String name,@JsonKey(name: 'price_per_piece') String? pricePerPiece,@JsonKey(name: 'calculated_weight') String? calculatedWeight
});




}
/// @nodoc
class __$FormSchemaItemCopyWithImpl<$Res>
    implements _$FormSchemaItemCopyWith<$Res> {
  __$FormSchemaItemCopyWithImpl(this._self, this._then);

  final _FormSchemaItem _self;
  final $Res Function(_FormSchemaItem) _then;

/// Create a copy of FormSchemaItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? name = null,Object? pricePerPiece = freezed,Object? calculatedWeight = freezed,}) {
  return _then(_FormSchemaItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pricePerPiece: freezed == pricePerPiece ? _self.pricePerPiece : pricePerPiece // ignore: cast_nullable_to_non_nullable
as String?,calculatedWeight: freezed == calculatedWeight ? _self.calculatedWeight : calculatedWeight // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
