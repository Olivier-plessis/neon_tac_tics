// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState()';
}


}

/// @nodoc
class $GameStateCopyWith<$Res>  {
$GameStateCopyWith(GameState _, $Res Function(GameState) __);
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Playing value)?  playing,TResult Function( AiThinking value)?  aiThinking,TResult Function( Finished value)?  finished,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Playing() when playing != null:
return playing(_that);case AiThinking() when aiThinking != null:
return aiThinking(_that);case Finished() when finished != null:
return finished(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Playing value)  playing,required TResult Function( AiThinking value)  aiThinking,required TResult Function( Finished value)  finished,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Playing():
return playing(_that);case AiThinking():
return aiThinking(_that);case Finished():
return finished(_that);case Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Playing value)?  playing,TResult? Function( AiThinking value)?  aiThinking,TResult? Function( Finished value)?  finished,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Playing() when playing != null:
return playing(_that);case AiThinking() when aiThinking != null:
return aiThinking(_that);case Finished() when finished != null:
return finished(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<Player?> board,  Player currentPlayer,  GameMode gameMode)?  playing,TResult Function( List<Player?> board,  GameMode gameMode)?  aiThinking,TResult Function( List<Player?> board,  GameResult result,  GameMode gameMode,  List<int>? winningLine)?  finished,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Playing() when playing != null:
return playing(_that.board,_that.currentPlayer,_that.gameMode);case AiThinking() when aiThinking != null:
return aiThinking(_that.board,_that.gameMode);case Finished() when finished != null:
return finished(_that.board,_that.result,_that.gameMode,_that.winningLine);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<Player?> board,  Player currentPlayer,  GameMode gameMode)  playing,required TResult Function( List<Player?> board,  GameMode gameMode)  aiThinking,required TResult Function( List<Player?> board,  GameResult result,  GameMode gameMode,  List<int>? winningLine)  finished,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Playing():
return playing(_that.board,_that.currentPlayer,_that.gameMode);case AiThinking():
return aiThinking(_that.board,_that.gameMode);case Finished():
return finished(_that.board,_that.result,_that.gameMode,_that.winningLine);case Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<Player?> board,  Player currentPlayer,  GameMode gameMode)?  playing,TResult? Function( List<Player?> board,  GameMode gameMode)?  aiThinking,TResult? Function( List<Player?> board,  GameResult result,  GameMode gameMode,  List<int>? winningLine)?  finished,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Playing() when playing != null:
return playing(_that.board,_that.currentPlayer,_that.gameMode);case AiThinking() when aiThinking != null:
return aiThinking(_that.board,_that.gameMode);case Finished() when finished != null:
return finished(_that.board,_that.result,_that.gameMode,_that.winningLine);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial extends GameState {
  const Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState.initial()';
}


}




/// @nodoc


class Playing extends GameState {
  const Playing({required final  List<Player?> board, required this.currentPlayer, required this.gameMode}): _board = board,super._();
  

 final  List<Player?> _board;
 List<Player?> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

 final  Player currentPlayer;
 final  GameMode gameMode;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayingCopyWith<Playing> get copyWith => _$PlayingCopyWithImpl<Playing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Playing&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.gameMode, gameMode) || other.gameMode == gameMode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_board),currentPlayer,gameMode);

@override
String toString() {
  return 'GameState.playing(board: $board, currentPlayer: $currentPlayer, gameMode: $gameMode)';
}


}

/// @nodoc
abstract mixin class $PlayingCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $PlayingCopyWith(Playing value, $Res Function(Playing) _then) = _$PlayingCopyWithImpl;
@useResult
$Res call({
 List<Player?> board, Player currentPlayer, GameMode gameMode
});




}
/// @nodoc
class _$PlayingCopyWithImpl<$Res>
    implements $PlayingCopyWith<$Res> {
  _$PlayingCopyWithImpl(this._self, this._then);

  final Playing _self;
  final $Res Function(Playing) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? board = null,Object? currentPlayer = null,Object? gameMode = null,}) {
  return _then(Playing(
board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<Player?>,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as Player,gameMode: null == gameMode ? _self.gameMode : gameMode // ignore: cast_nullable_to_non_nullable
as GameMode,
  ));
}


}

/// @nodoc


class AiThinking extends GameState {
  const AiThinking({required final  List<Player?> board, required this.gameMode}): _board = board,super._();
  

 final  List<Player?> _board;
 List<Player?> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

 final  GameMode gameMode;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiThinkingCopyWith<AiThinking> get copyWith => _$AiThinkingCopyWithImpl<AiThinking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiThinking&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.gameMode, gameMode) || other.gameMode == gameMode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_board),gameMode);

@override
String toString() {
  return 'GameState.aiThinking(board: $board, gameMode: $gameMode)';
}


}

/// @nodoc
abstract mixin class $AiThinkingCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $AiThinkingCopyWith(AiThinking value, $Res Function(AiThinking) _then) = _$AiThinkingCopyWithImpl;
@useResult
$Res call({
 List<Player?> board, GameMode gameMode
});




}
/// @nodoc
class _$AiThinkingCopyWithImpl<$Res>
    implements $AiThinkingCopyWith<$Res> {
  _$AiThinkingCopyWithImpl(this._self, this._then);

  final AiThinking _self;
  final $Res Function(AiThinking) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? board = null,Object? gameMode = null,}) {
  return _then(AiThinking(
board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<Player?>,gameMode: null == gameMode ? _self.gameMode : gameMode // ignore: cast_nullable_to_non_nullable
as GameMode,
  ));
}


}

/// @nodoc


class Finished extends GameState {
  const Finished({required final  List<Player?> board, required this.result, required this.gameMode, final  List<int>? winningLine}): _board = board,_winningLine = winningLine,super._();
  

 final  List<Player?> _board;
 List<Player?> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

 final  GameResult result;
 final  GameMode gameMode;
 final  List<int>? _winningLine;
 List<int>? get winningLine {
  final value = _winningLine;
  if (value == null) return null;
  if (_winningLine is EqualUnmodifiableListView) return _winningLine;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinishedCopyWith<Finished> get copyWith => _$FinishedCopyWithImpl<Finished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Finished&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.result, result) || other.result == result)&&(identical(other.gameMode, gameMode) || other.gameMode == gameMode)&&const DeepCollectionEquality().equals(other._winningLine, _winningLine));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_board),result,gameMode,const DeepCollectionEquality().hash(_winningLine));

@override
String toString() {
  return 'GameState.finished(board: $board, result: $result, gameMode: $gameMode, winningLine: $winningLine)';
}


}

/// @nodoc
abstract mixin class $FinishedCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $FinishedCopyWith(Finished value, $Res Function(Finished) _then) = _$FinishedCopyWithImpl;
@useResult
$Res call({
 List<Player?> board, GameResult result, GameMode gameMode, List<int>? winningLine
});


$GameResultCopyWith<$Res> get result;

}
/// @nodoc
class _$FinishedCopyWithImpl<$Res>
    implements $FinishedCopyWith<$Res> {
  _$FinishedCopyWithImpl(this._self, this._then);

  final Finished _self;
  final $Res Function(Finished) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? board = null,Object? result = null,Object? gameMode = null,Object? winningLine = freezed,}) {
  return _then(Finished(
board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<Player?>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult,gameMode: null == gameMode ? _self.gameMode : gameMode // ignore: cast_nullable_to_non_nullable
as GameMode,winningLine: freezed == winningLine ? _self._winningLine : winningLine // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res> get result {
  
  return $GameResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class Error extends GameState {
  const Error(this.message): super._();
  

 final  String message;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GameState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
