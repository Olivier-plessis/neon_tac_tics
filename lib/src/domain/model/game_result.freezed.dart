// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameResult()';
}


}

/// @nodoc
class $GameResultCopyWith<$Res>  {
$GameResultCopyWith(GameResult _, $Res Function(GameResult) __);
}


/// Adds pattern-matching-related methods to [GameResult].
extension GameResultPatterns on GameResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerWon value)?  playerWon,TResult Function( AiWon value)?  aiWon,TResult Function( Draw value)?  draw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerWon() when playerWon != null:
return playerWon(_that);case AiWon() when aiWon != null:
return aiWon(_that);case Draw() when draw != null:
return draw(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerWon value)  playerWon,required TResult Function( AiWon value)  aiWon,required TResult Function( Draw value)  draw,}){
final _that = this;
switch (_that) {
case PlayerWon():
return playerWon(_that);case AiWon():
return aiWon(_that);case Draw():
return draw(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerWon value)?  playerWon,TResult? Function( AiWon value)?  aiWon,TResult? Function( Draw value)?  draw,}){
final _that = this;
switch (_that) {
case PlayerWon() when playerWon != null:
return playerWon(_that);case AiWon() when aiWon != null:
return aiWon(_that);case Draw() when draw != null:
return draw(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Player winner,  List<int>? winningLine)?  playerWon,TResult Function( Player winner,  List<int>? winningLine)?  aiWon,TResult Function()?  draw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerWon() when playerWon != null:
return playerWon(_that.winner,_that.winningLine);case AiWon() when aiWon != null:
return aiWon(_that.winner,_that.winningLine);case Draw() when draw != null:
return draw();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Player winner,  List<int>? winningLine)  playerWon,required TResult Function( Player winner,  List<int>? winningLine)  aiWon,required TResult Function()  draw,}) {final _that = this;
switch (_that) {
case PlayerWon():
return playerWon(_that.winner,_that.winningLine);case AiWon():
return aiWon(_that.winner,_that.winningLine);case Draw():
return draw();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Player winner,  List<int>? winningLine)?  playerWon,TResult? Function( Player winner,  List<int>? winningLine)?  aiWon,TResult? Function()?  draw,}) {final _that = this;
switch (_that) {
case PlayerWon() when playerWon != null:
return playerWon(_that.winner,_that.winningLine);case AiWon() when aiWon != null:
return aiWon(_that.winner,_that.winningLine);case Draw() when draw != null:
return draw();case _:
  return null;

}
}

}

/// @nodoc


class PlayerWon extends GameResult {
  const PlayerWon({required this.winner, final  List<int>? winningLine}): _winningLine = winningLine,super._();
  

 final  Player winner;
 final  List<int>? _winningLine;
 List<int>? get winningLine {
  final value = _winningLine;
  if (value == null) return null;
  if (_winningLine is EqualUnmodifiableListView) return _winningLine;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerWonCopyWith<PlayerWon> get copyWith => _$PlayerWonCopyWithImpl<PlayerWon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerWon&&(identical(other.winner, winner) || other.winner == winner)&&const DeepCollectionEquality().equals(other._winningLine, _winningLine));
}


@override
int get hashCode => Object.hash(runtimeType,winner,const DeepCollectionEquality().hash(_winningLine));

@override
String toString() {
  return 'GameResult.playerWon(winner: $winner, winningLine: $winningLine)';
}


}

/// @nodoc
abstract mixin class $PlayerWonCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory $PlayerWonCopyWith(PlayerWon value, $Res Function(PlayerWon) _then) = _$PlayerWonCopyWithImpl;
@useResult
$Res call({
 Player winner, List<int>? winningLine
});




}
/// @nodoc
class _$PlayerWonCopyWithImpl<$Res>
    implements $PlayerWonCopyWith<$Res> {
  _$PlayerWonCopyWithImpl(this._self, this._then);

  final PlayerWon _self;
  final $Res Function(PlayerWon) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winner = null,Object? winningLine = freezed,}) {
  return _then(PlayerWon(
winner: null == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as Player,winningLine: freezed == winningLine ? _self._winningLine : winningLine // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc


class AiWon extends GameResult {
  const AiWon({required this.winner, final  List<int>? winningLine}): _winningLine = winningLine,super._();
  

 final  Player winner;
 final  List<int>? _winningLine;
 List<int>? get winningLine {
  final value = _winningLine;
  if (value == null) return null;
  if (_winningLine is EqualUnmodifiableListView) return _winningLine;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiWonCopyWith<AiWon> get copyWith => _$AiWonCopyWithImpl<AiWon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiWon&&(identical(other.winner, winner) || other.winner == winner)&&const DeepCollectionEquality().equals(other._winningLine, _winningLine));
}


@override
int get hashCode => Object.hash(runtimeType,winner,const DeepCollectionEquality().hash(_winningLine));

@override
String toString() {
  return 'GameResult.aiWon(winner: $winner, winningLine: $winningLine)';
}


}

/// @nodoc
abstract mixin class $AiWonCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory $AiWonCopyWith(AiWon value, $Res Function(AiWon) _then) = _$AiWonCopyWithImpl;
@useResult
$Res call({
 Player winner, List<int>? winningLine
});




}
/// @nodoc
class _$AiWonCopyWithImpl<$Res>
    implements $AiWonCopyWith<$Res> {
  _$AiWonCopyWithImpl(this._self, this._then);

  final AiWon _self;
  final $Res Function(AiWon) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winner = null,Object? winningLine = freezed,}) {
  return _then(AiWon(
winner: null == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as Player,winningLine: freezed == winningLine ? _self._winningLine : winningLine // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc


class Draw extends GameResult {
  const Draw(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Draw);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameResult.draw()';
}


}




// dart format on
