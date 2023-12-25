import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/main/data/badge_count_entity.dart';

BadgeCountEntity $BadgeCountEntityFromJson(Map<String, dynamic> json) {
  final BadgeCountEntity badgeCountEntity = BadgeCountEntity();
  final BadgeCountData? data = jsonConvert.convert<BadgeCountData>(
      json['data']);
  if (data != null) {
    badgeCountEntity.data = data;
  }
  return badgeCountEntity;
}

Map<String, dynamic> $BadgeCountEntityToJson(BadgeCountEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension BadgeCountEntityExtension on BadgeCountEntity {
  BadgeCountEntity copyWith({
    BadgeCountData? data,
  }) {
    return BadgeCountEntity()
      ..data = data ?? this.data;
  }
}

BadgeCountData $BadgeCountDataFromJson(Map<String, dynamic> json) {
  final BadgeCountData badgeCountData = BadgeCountData();
  final int? badgeCount = jsonConvert.convert<int>(json['badgeCount']);
  if (badgeCount != null) {
    badgeCountData.badgeCount = badgeCount;
  }
  return badgeCountData;
}

Map<String, dynamic> $BadgeCountDataToJson(BadgeCountData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['badgeCount'] = entity.badgeCount;
  return data;
}

extension BadgeCountDataExtension on BadgeCountData {
  BadgeCountData copyWith({
    int? badgeCount,
  }) {
    return BadgeCountData()
      ..badgeCount = badgeCount ?? this.badgeCount;
  }
}