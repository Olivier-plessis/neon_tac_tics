import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<String> logs,
    @Default(false) bool showInput,
    @Default(false) bool showDifficulty,
    @Default(false) bool accessGranted,
    @Default(AIDifficulty.medium) AIDifficulty selectedDifficulty,
  }) = _HomeState;
}
