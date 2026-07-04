// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCreateRequest {

@JsonKey(name: 'google_email') String get googleEmail; UserRole get role;@JsonKey(name: 'display_name') String? get displayName; String? get phone;@JsonKey(name: 'hotel_id') String? get hotelId;
/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreateRequestCopyWith<UserCreateRequest> get copyWith => _$UserCreateRequestCopyWithImpl<UserCreateRequest>(this as UserCreateRequest, _$identity);

  /// Serializes this UserCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateRequest&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail)&&(identical(other.role, role) || other.role == role)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,googleEmail,role,displayName,phone,hotelId);

@override
String toString() {
  return 'UserCreateRequest(googleEmail: $googleEmail, role: $role, displayName: $displayName, phone: $phone, hotelId: $hotelId)';
}


}

/// @nodoc
abstract mixin class $UserCreateRequestCopyWith<$Res>  {
  factory $UserCreateRequestCopyWith(UserCreateRequest value, $Res Function(UserCreateRequest) _then) = _$UserCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'google_email') String googleEmail, UserRole role,@JsonKey(name: 'display_name') String? displayName, String? phone,@JsonKey(name: 'hotel_id') String? hotelId
});




}
/// @nodoc
class _$UserCreateRequestCopyWithImpl<$Res>
    implements $UserCreateRequestCopyWith<$Res> {
  _$UserCreateRequestCopyWithImpl(this._self, this._then);

  final UserCreateRequest _self;
  final $Res Function(UserCreateRequest) _then;

/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? googleEmail = null,Object? role = null,Object? displayName = freezed,Object? phone = freezed,Object? hotelId = freezed,}) {
  return _then(_self.copyWith(
googleEmail: null == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCreateRequest].
extension UserCreateRequestPatterns on UserCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'google_email')  String googleEmail,  UserRole role, @JsonKey(name: 'display_name')  String? displayName,  String? phone, @JsonKey(name: 'hotel_id')  String? hotelId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
return $default(_that.googleEmail,_that.role,_that.displayName,_that.phone,_that.hotelId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'google_email')  String googleEmail,  UserRole role, @JsonKey(name: 'display_name')  String? displayName,  String? phone, @JsonKey(name: 'hotel_id')  String? hotelId)  $default,) {final _that = this;
switch (_that) {
case _UserCreateRequest():
return $default(_that.googleEmail,_that.role,_that.displayName,_that.phone,_that.hotelId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'google_email')  String googleEmail,  UserRole role, @JsonKey(name: 'display_name')  String? displayName,  String? phone, @JsonKey(name: 'hotel_id')  String? hotelId)?  $default,) {final _that = this;
switch (_that) {
case _UserCreateRequest() when $default != null:
return $default(_that.googleEmail,_that.role,_that.displayName,_that.phone,_that.hotelId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCreateRequest implements UserCreateRequest {
  const _UserCreateRequest({@JsonKey(name: 'google_email') required this.googleEmail, required this.role, @JsonKey(name: 'display_name') this.displayName, this.phone, @JsonKey(name: 'hotel_id') this.hotelId});
  factory _UserCreateRequest.fromJson(Map<String, dynamic> json) => _$UserCreateRequestFromJson(json);

@override@JsonKey(name: 'google_email') final  String googleEmail;
@override final  UserRole role;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override final  String? phone;
@override@JsonKey(name: 'hotel_id') final  String? hotelId;

/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCreateRequestCopyWith<_UserCreateRequest> get copyWith => __$UserCreateRequestCopyWithImpl<_UserCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCreateRequest&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail)&&(identical(other.role, role) || other.role == role)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,googleEmail,role,displayName,phone,hotelId);

@override
String toString() {
  return 'UserCreateRequest(googleEmail: $googleEmail, role: $role, displayName: $displayName, phone: $phone, hotelId: $hotelId)';
}


}

/// @nodoc
abstract mixin class _$UserCreateRequestCopyWith<$Res> implements $UserCreateRequestCopyWith<$Res> {
  factory _$UserCreateRequestCopyWith(_UserCreateRequest value, $Res Function(_UserCreateRequest) _then) = __$UserCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'google_email') String googleEmail, UserRole role,@JsonKey(name: 'display_name') String? displayName, String? phone,@JsonKey(name: 'hotel_id') String? hotelId
});




}
/// @nodoc
class __$UserCreateRequestCopyWithImpl<$Res>
    implements _$UserCreateRequestCopyWith<$Res> {
  __$UserCreateRequestCopyWithImpl(this._self, this._then);

  final _UserCreateRequest _self;
  final $Res Function(_UserCreateRequest) _then;

/// Create a copy of UserCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? googleEmail = null,Object? role = null,Object? displayName = freezed,Object? phone = freezed,Object? hotelId = freezed,}) {
  return _then(_UserCreateRequest(
googleEmail: null == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserResponse {

 String get id;@JsonKey(name: 'google_email') String get googleEmail;@JsonKey(name: 'display_name') String? get displayName; UserRole get role; String? get phone;@JsonKey(name: 'hotel_id') String? get hotelId;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResponseCopyWith<UserResponse> get copyWith => _$UserResponseCopyWithImpl<UserResponse>(this as UserResponse, _$identity);

  /// Serializes this UserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,googleEmail,displayName,role,phone,hotelId,isActive,createdAt);

@override
String toString() {
  return 'UserResponse(id: $id, googleEmail: $googleEmail, displayName: $displayName, role: $role, phone: $phone, hotelId: $hotelId, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserResponseCopyWith<$Res>  {
  factory $UserResponseCopyWith(UserResponse value, $Res Function(UserResponse) _then) = _$UserResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'google_email') String googleEmail,@JsonKey(name: 'display_name') String? displayName, UserRole role, String? phone,@JsonKey(name: 'hotel_id') String? hotelId,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$UserResponseCopyWithImpl<$Res>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._self, this._then);

  final UserResponse _self;
  final $Res Function(UserResponse) _then;

/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? googleEmail = null,Object? displayName = freezed,Object? role = null,Object? phone = freezed,Object? hotelId = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,googleEmail: null == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserResponse].
extension UserResponsePatterns on UserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'google_email')  String googleEmail, @JsonKey(name: 'display_name')  String? displayName,  UserRole role,  String? phone, @JsonKey(name: 'hotel_id')  String? hotelId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
return $default(_that.id,_that.googleEmail,_that.displayName,_that.role,_that.phone,_that.hotelId,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'google_email')  String googleEmail, @JsonKey(name: 'display_name')  String? displayName,  UserRole role,  String? phone, @JsonKey(name: 'hotel_id')  String? hotelId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserResponse():
return $default(_that.id,_that.googleEmail,_that.displayName,_that.role,_that.phone,_that.hotelId,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'google_email')  String googleEmail, @JsonKey(name: 'display_name')  String? displayName,  UserRole role,  String? phone, @JsonKey(name: 'hotel_id')  String? hotelId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
return $default(_that.id,_that.googleEmail,_that.displayName,_that.role,_that.phone,_that.hotelId,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResponse implements UserResponse {
  const _UserResponse({required this.id, @JsonKey(name: 'google_email') required this.googleEmail, @JsonKey(name: 'display_name') this.displayName, required this.role, this.phone, @JsonKey(name: 'hotel_id') this.hotelId, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt});
  factory _UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'google_email') final  String googleEmail;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override final  UserRole role;
@override final  String? phone;
@override@JsonKey(name: 'hotel_id') final  String? hotelId;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResponseCopyWith<_UserResponse> get copyWith => __$UserResponseCopyWithImpl<_UserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,googleEmail,displayName,role,phone,hotelId,isActive,createdAt);

@override
String toString() {
  return 'UserResponse(id: $id, googleEmail: $googleEmail, displayName: $displayName, role: $role, phone: $phone, hotelId: $hotelId, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserResponseCopyWith<$Res> implements $UserResponseCopyWith<$Res> {
  factory _$UserResponseCopyWith(_UserResponse value, $Res Function(_UserResponse) _then) = __$UserResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'google_email') String googleEmail,@JsonKey(name: 'display_name') String? displayName, UserRole role, String? phone,@JsonKey(name: 'hotel_id') String? hotelId,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$UserResponseCopyWithImpl<$Res>
    implements _$UserResponseCopyWith<$Res> {
  __$UserResponseCopyWithImpl(this._self, this._then);

  final _UserResponse _self;
  final $Res Function(_UserResponse) _then;

/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? googleEmail = null,Object? displayName = freezed,Object? role = null,Object? phone = freezed,Object? hotelId = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_UserResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,googleEmail: null == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$UserUpdateRequest {

@JsonKey(name: 'display_name', includeIfNull: false) String? get displayName;@JsonKey(includeIfNull: false) String? get phone;@JsonKey(includeIfNull: false) UserRole? get role;@JsonKey(name: 'hotel_id', includeIfNull: false) String? get hotelId;@JsonKey(name: 'is_active', includeIfNull: false) bool? get isActive;
/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUpdateRequestCopyWith<UserUpdateRequest> get copyWith => _$UserUpdateRequestCopyWithImpl<UserUpdateRequest>(this as UserUpdateRequest, _$identity);

  /// Serializes this UserUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUpdateRequest&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,phone,role,hotelId,isActive);

@override
String toString() {
  return 'UserUpdateRequest(displayName: $displayName, phone: $phone, role: $role, hotelId: $hotelId, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $UserUpdateRequestCopyWith<$Res>  {
  factory $UserUpdateRequestCopyWith(UserUpdateRequest value, $Res Function(UserUpdateRequest) _then) = _$UserUpdateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'display_name', includeIfNull: false) String? displayName,@JsonKey(includeIfNull: false) String? phone,@JsonKey(includeIfNull: false) UserRole? role,@JsonKey(name: 'hotel_id', includeIfNull: false) String? hotelId,@JsonKey(name: 'is_active', includeIfNull: false) bool? isActive
});




}
/// @nodoc
class _$UserUpdateRequestCopyWithImpl<$Res>
    implements $UserUpdateRequestCopyWith<$Res> {
  _$UserUpdateRequestCopyWithImpl(this._self, this._then);

  final UserUpdateRequest _self;
  final $Res Function(UserUpdateRequest) _then;

/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = freezed,Object? phone = freezed,Object? role = freezed,Object? hotelId = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserUpdateRequest].
extension UserUpdateRequestPatterns on UserUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name', includeIfNull: false)  String? displayName, @JsonKey(includeIfNull: false)  String? phone, @JsonKey(includeIfNull: false)  UserRole? role, @JsonKey(name: 'hotel_id', includeIfNull: false)  String? hotelId, @JsonKey(name: 'is_active', includeIfNull: false)  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
return $default(_that.displayName,_that.phone,_that.role,_that.hotelId,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name', includeIfNull: false)  String? displayName, @JsonKey(includeIfNull: false)  String? phone, @JsonKey(includeIfNull: false)  UserRole? role, @JsonKey(name: 'hotel_id', includeIfNull: false)  String? hotelId, @JsonKey(name: 'is_active', includeIfNull: false)  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _UserUpdateRequest():
return $default(_that.displayName,_that.phone,_that.role,_that.hotelId,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'display_name', includeIfNull: false)  String? displayName, @JsonKey(includeIfNull: false)  String? phone, @JsonKey(includeIfNull: false)  UserRole? role, @JsonKey(name: 'hotel_id', includeIfNull: false)  String? hotelId, @JsonKey(name: 'is_active', includeIfNull: false)  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
return $default(_that.displayName,_that.phone,_that.role,_that.hotelId,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserUpdateRequest implements UserUpdateRequest {
  const _UserUpdateRequest({@JsonKey(name: 'display_name', includeIfNull: false) this.displayName, @JsonKey(includeIfNull: false) this.phone, @JsonKey(includeIfNull: false) this.role, @JsonKey(name: 'hotel_id', includeIfNull: false) this.hotelId, @JsonKey(name: 'is_active', includeIfNull: false) this.isActive});
  factory _UserUpdateRequest.fromJson(Map<String, dynamic> json) => _$UserUpdateRequestFromJson(json);

@override@JsonKey(name: 'display_name', includeIfNull: false) final  String? displayName;
@override@JsonKey(includeIfNull: false) final  String? phone;
@override@JsonKey(includeIfNull: false) final  UserRole? role;
@override@JsonKey(name: 'hotel_id', includeIfNull: false) final  String? hotelId;
@override@JsonKey(name: 'is_active', includeIfNull: false) final  bool? isActive;

/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserUpdateRequestCopyWith<_UserUpdateRequest> get copyWith => __$UserUpdateRequestCopyWithImpl<_UserUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserUpdateRequest&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,phone,role,hotelId,isActive);

@override
String toString() {
  return 'UserUpdateRequest(displayName: $displayName, phone: $phone, role: $role, hotelId: $hotelId, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$UserUpdateRequestCopyWith<$Res> implements $UserUpdateRequestCopyWith<$Res> {
  factory _$UserUpdateRequestCopyWith(_UserUpdateRequest value, $Res Function(_UserUpdateRequest) _then) = __$UserUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'display_name', includeIfNull: false) String? displayName,@JsonKey(includeIfNull: false) String? phone,@JsonKey(includeIfNull: false) UserRole? role,@JsonKey(name: 'hotel_id', includeIfNull: false) String? hotelId,@JsonKey(name: 'is_active', includeIfNull: false) bool? isActive
});




}
/// @nodoc
class __$UserUpdateRequestCopyWithImpl<$Res>
    implements _$UserUpdateRequestCopyWith<$Res> {
  __$UserUpdateRequestCopyWithImpl(this._self, this._then);

  final _UserUpdateRequest _self;
  final $Res Function(_UserUpdateRequest) _then;

/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = freezed,Object? phone = freezed,Object? role = freezed,Object? hotelId = freezed,Object? isActive = freezed,}) {
  return _then(_UserUpdateRequest(
displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$HotelCreateRequest {

 String get name; String? get address;@JsonKey(name: 'contact_number') String? get contactNumber;
/// Create a copy of HotelCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelCreateRequestCopyWith<HotelCreateRequest> get copyWith => _$HotelCreateRequestCopyWithImpl<HotelCreateRequest>(this as HotelCreateRequest, _$identity);

  /// Serializes this HotelCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,contactNumber);

@override
String toString() {
  return 'HotelCreateRequest(name: $name, address: $address, contactNumber: $contactNumber)';
}


}

/// @nodoc
abstract mixin class $HotelCreateRequestCopyWith<$Res>  {
  factory $HotelCreateRequestCopyWith(HotelCreateRequest value, $Res Function(HotelCreateRequest) _then) = _$HotelCreateRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? address,@JsonKey(name: 'contact_number') String? contactNumber
});




}
/// @nodoc
class _$HotelCreateRequestCopyWithImpl<$Res>
    implements $HotelCreateRequestCopyWith<$Res> {
  _$HotelCreateRequestCopyWithImpl(this._self, this._then);

  final HotelCreateRequest _self;
  final $Res Function(HotelCreateRequest) _then;

/// Create a copy of HotelCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = freezed,Object? contactNumber = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelCreateRequest].
extension HotelCreateRequestPatterns on HotelCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _HotelCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _HotelCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? address, @JsonKey(name: 'contact_number')  String? contactNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelCreateRequest() when $default != null:
return $default(_that.name,_that.address,_that.contactNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? address, @JsonKey(name: 'contact_number')  String? contactNumber)  $default,) {final _that = this;
switch (_that) {
case _HotelCreateRequest():
return $default(_that.name,_that.address,_that.contactNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? address, @JsonKey(name: 'contact_number')  String? contactNumber)?  $default,) {final _that = this;
switch (_that) {
case _HotelCreateRequest() when $default != null:
return $default(_that.name,_that.address,_that.contactNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelCreateRequest implements HotelCreateRequest {
  const _HotelCreateRequest({required this.name, this.address, @JsonKey(name: 'contact_number') this.contactNumber});
  factory _HotelCreateRequest.fromJson(Map<String, dynamic> json) => _$HotelCreateRequestFromJson(json);

@override final  String name;
@override final  String? address;
@override@JsonKey(name: 'contact_number') final  String? contactNumber;

/// Create a copy of HotelCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelCreateRequestCopyWith<_HotelCreateRequest> get copyWith => __$HotelCreateRequestCopyWithImpl<_HotelCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,contactNumber);

@override
String toString() {
  return 'HotelCreateRequest(name: $name, address: $address, contactNumber: $contactNumber)';
}


}

/// @nodoc
abstract mixin class _$HotelCreateRequestCopyWith<$Res> implements $HotelCreateRequestCopyWith<$Res> {
  factory _$HotelCreateRequestCopyWith(_HotelCreateRequest value, $Res Function(_HotelCreateRequest) _then) = __$HotelCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? address,@JsonKey(name: 'contact_number') String? contactNumber
});




}
/// @nodoc
class __$HotelCreateRequestCopyWithImpl<$Res>
    implements _$HotelCreateRequestCopyWith<$Res> {
  __$HotelCreateRequestCopyWithImpl(this._self, this._then);

  final _HotelCreateRequest _self;
  final $Res Function(_HotelCreateRequest) _then;

/// Create a copy of HotelCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = freezed,Object? contactNumber = freezed,}) {
  return _then(_HotelCreateRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HotelUpdateRequest {

@JsonKey(includeIfNull: false) String? get name;@JsonKey(includeIfNull: false) String? get address;@JsonKey(name: 'contact_number', includeIfNull: false) String? get contactNumber;
/// Create a copy of HotelUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelUpdateRequestCopyWith<HotelUpdateRequest> get copyWith => _$HotelUpdateRequestCopyWithImpl<HotelUpdateRequest>(this as HotelUpdateRequest, _$identity);

  /// Serializes this HotelUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelUpdateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,contactNumber);

@override
String toString() {
  return 'HotelUpdateRequest(name: $name, address: $address, contactNumber: $contactNumber)';
}


}

/// @nodoc
abstract mixin class $HotelUpdateRequestCopyWith<$Res>  {
  factory $HotelUpdateRequestCopyWith(HotelUpdateRequest value, $Res Function(HotelUpdateRequest) _then) = _$HotelUpdateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? address,@JsonKey(name: 'contact_number', includeIfNull: false) String? contactNumber
});




}
/// @nodoc
class _$HotelUpdateRequestCopyWithImpl<$Res>
    implements $HotelUpdateRequestCopyWith<$Res> {
  _$HotelUpdateRequestCopyWithImpl(this._self, this._then);

  final HotelUpdateRequest _self;
  final $Res Function(HotelUpdateRequest) _then;

/// Create a copy of HotelUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? address = freezed,Object? contactNumber = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelUpdateRequest].
extension HotelUpdateRequestPatterns on HotelUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _HotelUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _HotelUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? address, @JsonKey(name: 'contact_number', includeIfNull: false)  String? contactNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelUpdateRequest() when $default != null:
return $default(_that.name,_that.address,_that.contactNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? address, @JsonKey(name: 'contact_number', includeIfNull: false)  String? contactNumber)  $default,) {final _that = this;
switch (_that) {
case _HotelUpdateRequest():
return $default(_that.name,_that.address,_that.contactNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? address, @JsonKey(name: 'contact_number', includeIfNull: false)  String? contactNumber)?  $default,) {final _that = this;
switch (_that) {
case _HotelUpdateRequest() when $default != null:
return $default(_that.name,_that.address,_that.contactNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelUpdateRequest implements HotelUpdateRequest {
  const _HotelUpdateRequest({@JsonKey(includeIfNull: false) this.name, @JsonKey(includeIfNull: false) this.address, @JsonKey(name: 'contact_number', includeIfNull: false) this.contactNumber});
  factory _HotelUpdateRequest.fromJson(Map<String, dynamic> json) => _$HotelUpdateRequestFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? name;
@override@JsonKey(includeIfNull: false) final  String? address;
@override@JsonKey(name: 'contact_number', includeIfNull: false) final  String? contactNumber;

/// Create a copy of HotelUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelUpdateRequestCopyWith<_HotelUpdateRequest> get copyWith => __$HotelUpdateRequestCopyWithImpl<_HotelUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelUpdateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,contactNumber);

@override
String toString() {
  return 'HotelUpdateRequest(name: $name, address: $address, contactNumber: $contactNumber)';
}


}

/// @nodoc
abstract mixin class _$HotelUpdateRequestCopyWith<$Res> implements $HotelUpdateRequestCopyWith<$Res> {
  factory _$HotelUpdateRequestCopyWith(_HotelUpdateRequest value, $Res Function(_HotelUpdateRequest) _then) = __$HotelUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? address,@JsonKey(name: 'contact_number', includeIfNull: false) String? contactNumber
});




}
/// @nodoc
class __$HotelUpdateRequestCopyWithImpl<$Res>
    implements _$HotelUpdateRequestCopyWith<$Res> {
  __$HotelUpdateRequestCopyWithImpl(this._self, this._then);

  final _HotelUpdateRequest _self;
  final $Res Function(_HotelUpdateRequest) _then;

/// Create a copy of HotelUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? address = freezed,Object? contactNumber = freezed,}) {
  return _then(_HotelUpdateRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HotelResponse {

 String get id; String get name; String? get address;@JsonKey(name: 'contact_number') String? get contactNumber;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of HotelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelResponseCopyWith<HotelResponse> get copyWith => _$HotelResponseCopyWithImpl<HotelResponse>(this as HotelResponse, _$identity);

  /// Serializes this HotelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,contactNumber,createdAt);

@override
String toString() {
  return 'HotelResponse(id: $id, name: $name, address: $address, contactNumber: $contactNumber, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $HotelResponseCopyWith<$Res>  {
  factory $HotelResponseCopyWith(HotelResponse value, $Res Function(HotelResponse) _then) = _$HotelResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? address,@JsonKey(name: 'contact_number') String? contactNumber,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$HotelResponseCopyWithImpl<$Res>
    implements $HotelResponseCopyWith<$Res> {
  _$HotelResponseCopyWithImpl(this._self, this._then);

  final HotelResponse _self;
  final $Res Function(HotelResponse) _then;

/// Create a copy of HotelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = freezed,Object? contactNumber = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelResponse].
extension HotelResponsePatterns on HotelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelResponse value)  $default,){
final _that = this;
switch (_that) {
case _HotelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HotelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? address, @JsonKey(name: 'contact_number')  String? contactNumber, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelResponse() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.contactNumber,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? address, @JsonKey(name: 'contact_number')  String? contactNumber, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _HotelResponse():
return $default(_that.id,_that.name,_that.address,_that.contactNumber,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? address, @JsonKey(name: 'contact_number')  String? contactNumber, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _HotelResponse() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.contactNumber,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelResponse implements HotelResponse {
  const _HotelResponse({required this.id, required this.name, this.address, @JsonKey(name: 'contact_number') this.contactNumber, @JsonKey(name: 'created_at') required this.createdAt});
  factory _HotelResponse.fromJson(Map<String, dynamic> json) => _$HotelResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? address;
@override@JsonKey(name: 'contact_number') final  String? contactNumber;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of HotelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelResponseCopyWith<_HotelResponse> get copyWith => __$HotelResponseCopyWithImpl<_HotelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,contactNumber,createdAt);

@override
String toString() {
  return 'HotelResponse(id: $id, name: $name, address: $address, contactNumber: $contactNumber, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HotelResponseCopyWith<$Res> implements $HotelResponseCopyWith<$Res> {
  factory _$HotelResponseCopyWith(_HotelResponse value, $Res Function(_HotelResponse) _then) = __$HotelResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? address,@JsonKey(name: 'contact_number') String? contactNumber,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$HotelResponseCopyWithImpl<$Res>
    implements _$HotelResponseCopyWith<$Res> {
  __$HotelResponseCopyWithImpl(this._self, this._then);

  final _HotelResponse _self;
  final $Res Function(_HotelResponse) _then;

/// Create a copy of HotelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = freezed,Object? contactNumber = freezed,Object? createdAt = null,}) {
  return _then(_HotelResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$MappingCreateRequest {

@JsonKey(name: 'agent_id') String get agentId;@JsonKey(name: 'hotel_id') String get hotelId;
/// Create a copy of MappingCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MappingCreateRequestCopyWith<MappingCreateRequest> get copyWith => _$MappingCreateRequestCopyWithImpl<MappingCreateRequest>(this as MappingCreateRequest, _$identity);

  /// Serializes this MappingCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MappingCreateRequest&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,agentId,hotelId);

@override
String toString() {
  return 'MappingCreateRequest(agentId: $agentId, hotelId: $hotelId)';
}


}

/// @nodoc
abstract mixin class $MappingCreateRequestCopyWith<$Res>  {
  factory $MappingCreateRequestCopyWith(MappingCreateRequest value, $Res Function(MappingCreateRequest) _then) = _$MappingCreateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'agent_id') String agentId,@JsonKey(name: 'hotel_id') String hotelId
});




}
/// @nodoc
class _$MappingCreateRequestCopyWithImpl<$Res>
    implements $MappingCreateRequestCopyWith<$Res> {
  _$MappingCreateRequestCopyWithImpl(this._self, this._then);

  final MappingCreateRequest _self;
  final $Res Function(MappingCreateRequest) _then;

/// Create a copy of MappingCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? agentId = null,Object? hotelId = null,}) {
  return _then(_self.copyWith(
agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MappingCreateRequest].
extension MappingCreateRequestPatterns on MappingCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MappingCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MappingCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MappingCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _MappingCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MappingCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MappingCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'hotel_id')  String hotelId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MappingCreateRequest() when $default != null:
return $default(_that.agentId,_that.hotelId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'hotel_id')  String hotelId)  $default,) {final _that = this;
switch (_that) {
case _MappingCreateRequest():
return $default(_that.agentId,_that.hotelId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'hotel_id')  String hotelId)?  $default,) {final _that = this;
switch (_that) {
case _MappingCreateRequest() when $default != null:
return $default(_that.agentId,_that.hotelId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MappingCreateRequest implements MappingCreateRequest {
  const _MappingCreateRequest({@JsonKey(name: 'agent_id') required this.agentId, @JsonKey(name: 'hotel_id') required this.hotelId});
  factory _MappingCreateRequest.fromJson(Map<String, dynamic> json) => _$MappingCreateRequestFromJson(json);

@override@JsonKey(name: 'agent_id') final  String agentId;
@override@JsonKey(name: 'hotel_id') final  String hotelId;

/// Create a copy of MappingCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MappingCreateRequestCopyWith<_MappingCreateRequest> get copyWith => __$MappingCreateRequestCopyWithImpl<_MappingCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MappingCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MappingCreateRequest&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,agentId,hotelId);

@override
String toString() {
  return 'MappingCreateRequest(agentId: $agentId, hotelId: $hotelId)';
}


}

/// @nodoc
abstract mixin class _$MappingCreateRequestCopyWith<$Res> implements $MappingCreateRequestCopyWith<$Res> {
  factory _$MappingCreateRequestCopyWith(_MappingCreateRequest value, $Res Function(_MappingCreateRequest) _then) = __$MappingCreateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'agent_id') String agentId,@JsonKey(name: 'hotel_id') String hotelId
});




}
/// @nodoc
class __$MappingCreateRequestCopyWithImpl<$Res>
    implements _$MappingCreateRequestCopyWith<$Res> {
  __$MappingCreateRequestCopyWithImpl(this._self, this._then);

  final _MappingCreateRequest _self;
  final $Res Function(_MappingCreateRequest) _then;

/// Create a copy of MappingCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? agentId = null,Object? hotelId = null,}) {
  return _then(_MappingCreateRequest(
agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MappingResponse {

 String get id;@JsonKey(name: 'agent_id') String get agentId;@JsonKey(name: 'hotel_id') String get hotelId;@JsonKey(name: 'agent_email') String? get agentEmail;@JsonKey(name: 'agent_name') String? get agentName;@JsonKey(name: 'hotel_name') String? get hotelName;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of MappingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MappingResponseCopyWith<MappingResponse> get copyWith => _$MappingResponseCopyWithImpl<MappingResponse>(this as MappingResponse, _$identity);

  /// Serializes this MappingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MappingResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.agentEmail, agentEmail) || other.agentEmail == agentEmail)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,agentId,hotelId,agentEmail,agentName,hotelName,createdAt);

@override
String toString() {
  return 'MappingResponse(id: $id, agentId: $agentId, hotelId: $hotelId, agentEmail: $agentEmail, agentName: $agentName, hotelName: $hotelName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MappingResponseCopyWith<$Res>  {
  factory $MappingResponseCopyWith(MappingResponse value, $Res Function(MappingResponse) _then) = _$MappingResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'agent_id') String agentId,@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'agent_email') String? agentEmail,@JsonKey(name: 'agent_name') String? agentName,@JsonKey(name: 'hotel_name') String? hotelName,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$MappingResponseCopyWithImpl<$Res>
    implements $MappingResponseCopyWith<$Res> {
  _$MappingResponseCopyWithImpl(this._self, this._then);

  final MappingResponse _self;
  final $Res Function(MappingResponse) _then;

/// Create a copy of MappingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? agentId = null,Object? hotelId = null,Object? agentEmail = freezed,Object? agentName = freezed,Object? hotelName = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,agentEmail: freezed == agentEmail ? _self.agentEmail : agentEmail // ignore: cast_nullable_to_non_nullable
as String?,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MappingResponse].
extension MappingResponsePatterns on MappingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MappingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MappingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MappingResponse value)  $default,){
final _that = this;
switch (_that) {
case _MappingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MappingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MappingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'agent_email')  String? agentEmail, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'hotel_name')  String? hotelName, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MappingResponse() when $default != null:
return $default(_that.id,_that.agentId,_that.hotelId,_that.agentEmail,_that.agentName,_that.hotelName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'agent_email')  String? agentEmail, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'hotel_name')  String? hotelName, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MappingResponse():
return $default(_that.id,_that.agentId,_that.hotelId,_that.agentEmail,_that.agentName,_that.hotelName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'agent_id')  String agentId, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'agent_email')  String? agentEmail, @JsonKey(name: 'agent_name')  String? agentName, @JsonKey(name: 'hotel_name')  String? hotelName, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MappingResponse() when $default != null:
return $default(_that.id,_that.agentId,_that.hotelId,_that.agentEmail,_that.agentName,_that.hotelName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MappingResponse implements MappingResponse {
  const _MappingResponse({required this.id, @JsonKey(name: 'agent_id') required this.agentId, @JsonKey(name: 'hotel_id') required this.hotelId, @JsonKey(name: 'agent_email') this.agentEmail, @JsonKey(name: 'agent_name') this.agentName, @JsonKey(name: 'hotel_name') this.hotelName, @JsonKey(name: 'created_at') required this.createdAt});
  factory _MappingResponse.fromJson(Map<String, dynamic> json) => _$MappingResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'agent_id') final  String agentId;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override@JsonKey(name: 'agent_email') final  String? agentEmail;
@override@JsonKey(name: 'agent_name') final  String? agentName;
@override@JsonKey(name: 'hotel_name') final  String? hotelName;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of MappingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MappingResponseCopyWith<_MappingResponse> get copyWith => __$MappingResponseCopyWithImpl<_MappingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MappingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MappingResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.agentEmail, agentEmail) || other.agentEmail == agentEmail)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,agentId,hotelId,agentEmail,agentName,hotelName,createdAt);

@override
String toString() {
  return 'MappingResponse(id: $id, agentId: $agentId, hotelId: $hotelId, agentEmail: $agentEmail, agentName: $agentName, hotelName: $hotelName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MappingResponseCopyWith<$Res> implements $MappingResponseCopyWith<$Res> {
  factory _$MappingResponseCopyWith(_MappingResponse value, $Res Function(_MappingResponse) _then) = __$MappingResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'agent_id') String agentId,@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'agent_email') String? agentEmail,@JsonKey(name: 'agent_name') String? agentName,@JsonKey(name: 'hotel_name') String? hotelName,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$MappingResponseCopyWithImpl<$Res>
    implements _$MappingResponseCopyWith<$Res> {
  __$MappingResponseCopyWithImpl(this._self, this._then);

  final _MappingResponse _self;
  final $Res Function(_MappingResponse) _then;

/// Create a copy of MappingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? agentId = null,Object? hotelId = null,Object? agentEmail = freezed,Object? agentName = freezed,Object? hotelName = freezed,Object? createdAt = null,}) {
  return _then(_MappingResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as String,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,agentEmail: freezed == agentEmail ? _self.agentEmail : agentEmail // ignore: cast_nullable_to_non_nullable
as String?,agentName: freezed == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String?,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
