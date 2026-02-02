import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';

part 'achievement.freezed.dart';

@freezed
abstract class Achievement with _$Achievement {
  const Achievement._();

  const factory Achievement({
    required AchievementType type,
    required bool unlocked,
    DateTime? unlockedAt,
  }) = _Achievement;

  String get title => type.title;
  String get description => type.description;
}
