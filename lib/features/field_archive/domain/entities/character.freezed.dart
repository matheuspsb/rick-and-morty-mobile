// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterLocation {

 String get name; String get url;
/// Create a copy of CharacterLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterLocationCopyWith<CharacterLocation> get copyWith => _$CharacterLocationCopyWithImpl<CharacterLocation>(this as CharacterLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'CharacterLocation(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $CharacterLocationCopyWith<$Res>  {
  factory $CharacterLocationCopyWith(CharacterLocation value, $Res Function(CharacterLocation) _then) = _$CharacterLocationCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$CharacterLocationCopyWithImpl<$Res>
    implements $CharacterLocationCopyWith<$Res> {
  _$CharacterLocationCopyWithImpl(this._self, this._then);

  final CharacterLocation _self;
  final $Res Function(CharacterLocation) _then;

/// Create a copy of CharacterLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(CharacterLocation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterLocation].
extension CharacterLocationPatterns on CharacterLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterLocation value)  $default,){
final _that = this;
switch (_that) {
case _CharacterLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterLocation value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterLocation() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _CharacterLocation():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _CharacterLocation() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _CharacterLocation implements CharacterLocation {
  const _CharacterLocation({required this.name, required this.url});
  

@override final  String name;
@override final  String url;

/// Create a copy of CharacterLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterLocationCopyWith<_CharacterLocation> get copyWith => __$CharacterLocationCopyWithImpl<_CharacterLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'CharacterLocation(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$CharacterLocationCopyWith<$Res> implements $CharacterLocationCopyWith<$Res> {
  factory _$CharacterLocationCopyWith(_CharacterLocation value, $Res Function(_CharacterLocation) _then) = __$CharacterLocationCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$CharacterLocationCopyWithImpl<$Res>
    implements _$CharacterLocationCopyWith<$Res> {
  __$CharacterLocationCopyWithImpl(this._self, this._then);

  final _CharacterLocation _self;
  final $Res Function(_CharacterLocation) _then;

/// Create a copy of CharacterLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_CharacterLocation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Character {

 int get id; String get name; CharacterStatus get status; String get species; String get type; CharacterGender get gender; CharacterLocation get origin; CharacterLocation get location; String get image; List<String> get episodeUrls;
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterCopyWith<Character> get copyWith => _$CharacterCopyWithImpl<Character>(this as Character, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.episodeUrls, episodeUrls));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(episodeUrls));

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episodeUrls: $episodeUrls)';
}


}

/// @nodoc
abstract mixin class $CharacterCopyWith<$Res>  {
  factory $CharacterCopyWith(Character value, $Res Function(Character) _then) = _$CharacterCopyWithImpl;
@useResult
$Res call({
 int id, String name, CharacterStatus status, String species, String type, CharacterGender gender, CharacterLocation origin, CharacterLocation location, String image, List<String> episodeUrls
});


$CharacterLocationCopyWith<$Res> get origin;$CharacterLocationCopyWith<$Res> get location;

}
/// @nodoc
class _$CharacterCopyWithImpl<$Res>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._self, this._then);

  final Character _self;
  final $Res Function(Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? type = null,Object? gender = null,Object? origin = null,Object? location = null,Object? image = null,Object? episodeUrls = null,}) {
  return _then(Character(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterLocation,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterLocation,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,episodeUrls: null == episodeUrls ? _self.episodeUrls : episodeUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationCopyWith<$Res> get origin {
  
  return $CharacterLocationCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationCopyWith<$Res> get location {
  
  return $CharacterLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [Character].
extension CharacterPatterns on Character {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Character value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Character value)  $default,){
final _that = this;
switch (_that) {
case _Character():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Character value)?  $default,){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  CharacterStatus status,  String species,  String type,  CharacterGender gender,  CharacterLocation origin,  CharacterLocation location,  String image,  List<String> episodeUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episodeUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  CharacterStatus status,  String species,  String type,  CharacterGender gender,  CharacterLocation origin,  CharacterLocation location,  String image,  List<String> episodeUrls)  $default,) {final _that = this;
switch (_that) {
case _Character():
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episodeUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  CharacterStatus status,  String species,  String type,  CharacterGender gender,  CharacterLocation origin,  CharacterLocation location,  String image,  List<String> episodeUrls)?  $default,) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episodeUrls);case _:
  return null;

}
}

}

/// @nodoc


class _Character extends Character {
  const _Character({required this.id, required this.name, required this.status, required this.species, required this.type, required this.gender, required this.origin, required this.location, required this.image, required  List<String> episodeUrls}): _episodeUrls = episodeUrls,super._();
  

@override final  int id;
@override final  String name;
@override final  CharacterStatus status;
@override final  String species;
@override final  String type;
@override final  CharacterGender gender;
@override final  CharacterLocation origin;
@override final  CharacterLocation location;
@override final  String image;
 final  List<String> _episodeUrls;
@override List<String> get episodeUrls {
  if (_episodeUrls is EqualUnmodifiableListView) return _episodeUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodeUrls);
}


/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterCopyWith<_Character> get copyWith => __$CharacterCopyWithImpl<_Character>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._episodeUrls, _episodeUrls));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(_episodeUrls));

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episodeUrls: $episodeUrls)';
}


}

/// @nodoc
abstract mixin class _$CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(_Character value, $Res Function(_Character) _then) = __$CharacterCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, CharacterStatus status, String species, String type, CharacterGender gender, CharacterLocation origin, CharacterLocation location, String image, List<String> episodeUrls
});


@override $CharacterLocationCopyWith<$Res> get origin;@override $CharacterLocationCopyWith<$Res> get location;

}
/// @nodoc
class __$CharacterCopyWithImpl<$Res>
    implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(this._self, this._then);

  final _Character _self;
  final $Res Function(_Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? type = null,Object? gender = null,Object? origin = null,Object? location = null,Object? image = null,Object? episodeUrls = null,}) {
  return _then(_Character(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterLocation,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterLocation,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,episodeUrls: null == episodeUrls ? _self._episodeUrls : episodeUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationCopyWith<$Res> get origin {
  
  return $CharacterLocationCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationCopyWith<$Res> get location {
  
  return $CharacterLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
