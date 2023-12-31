import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/notifications/data/notifications_entity.dart';

NotificationsEntity $NotificationsEntityFromJson(Map<String, dynamic> json) {
  final NotificationsEntity notificationsEntity = NotificationsEntity();
  final NotificationsData? data = jsonConvert.convert<NotificationsData>(
      json['data']);
  if (data != null) {
    notificationsEntity.data = data;
  }
  return notificationsEntity;
}

Map<String, dynamic> $NotificationsEntityToJson(NotificationsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension NotificationsEntityExtension on NotificationsEntity {
  NotificationsEntity copyWith({
    NotificationsData? data,
  }) {
    return NotificationsEntity()
      ..data = data ?? this.data;
  }
}

NotificationsData $NotificationsDataFromJson(Map<String, dynamic> json) {
  final NotificationsData notificationsData = NotificationsData();
  final List<NotificationsDataRows>? rows = (json['rows'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<NotificationsDataRows>(e) as NotificationsDataRows)
      .toList();
  if (rows != null) {
    notificationsData.rows = rows;
  }
  final NotificationsDataPaginate? paginate = jsonConvert.convert<
      NotificationsDataPaginate>(json['paginate']);
  if (paginate != null) {
    notificationsData.paginate = paginate;
  }
  return notificationsData;
}

Map<String, dynamic> $NotificationsDataToJson(NotificationsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rows'] = entity.rows?.map((v) => v.toJson()).toList();
  data['paginate'] = entity.paginate?.toJson();
  return data;
}

extension NotificationsDataExtension on NotificationsData {
  NotificationsData copyWith({
    List<NotificationsDataRows>? rows,
    NotificationsDataPaginate? paginate,
  }) {
    return NotificationsData()
      ..rows = rows ?? this.rows
      ..paginate = paginate ?? this.paginate;
  }
}

NotificationsDataRows $NotificationsDataRowsFromJson(
    Map<String, dynamic> json) {
  final NotificationsDataRows notificationsDataRows = NotificationsDataRows();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationsDataRows.id = id;
  }
  final NotificationsDataRowsMedia? media = jsonConvert.convert<
      NotificationsDataRowsMedia>(json['media']);
  if (media != null) {
    notificationsDataRows.media = media;
  }
  final String? module = jsonConvert.convert<String>(json['module']);
  if (module != null) {
    notificationsDataRows.module = module;
  }
  final String? modelId = jsonConvert.convert<String>(json['modelId']);
  if (modelId != null) {
    notificationsDataRows.modelId = modelId;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    notificationsDataRows.title = title;
  }
  final dynamic body = json['body'];
  if (body != null) {
    notificationsDataRows.body = body;
  }
  final bool? seen = jsonConvert.convert<bool>(json['seen']);
  if (seen != null) {
    notificationsDataRows.seen = seen;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    notificationsDataRows.date = date;
  }
  final String? diffForHumans = jsonConvert.convert<String>(
      json['diffForHumans']);
  if (diffForHumans != null) {
    notificationsDataRows.diffForHumans = diffForHumans;
  }
  return notificationsDataRows;
}

Map<String, dynamic> $NotificationsDataRowsToJson(
    NotificationsDataRows entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['media'] = entity.media?.toJson();
  data['module'] = entity.module;
  data['modelId'] = entity.modelId;
  data['title'] = entity.title;
  data['body'] = entity.body;
  data['seen'] = entity.seen;
  data['date'] = entity.date;
  data['diffForHumans'] = entity.diffForHumans;
  return data;
}

extension NotificationsDataRowsExtension on NotificationsDataRows {
  NotificationsDataRows copyWith({
    int? id,
    NotificationsDataRowsMedia? media,
    String? module,
    String? modelId,
    String? title,
    dynamic body,
    bool? seen,
    String? date,
    String? diffForHumans,
  }) {
    return NotificationsDataRows()
      ..id = id ?? this.id
      ..media = media ?? this.media
      ..module = module ?? this.module
      ..modelId = modelId ?? this.modelId
      ..title = title ?? this.title
      ..body = body ?? this.body
      ..seen = seen ?? this.seen
      ..date = date ?? this.date
      ..diffForHumans = diffForHumans ?? this.diffForHumans;
  }
}

NotificationsDataRowsMedia $NotificationsDataRowsMediaFromJson(
    Map<String, dynamic> json) {
  final NotificationsDataRowsMedia notificationsDataRowsMedia = NotificationsDataRowsMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationsDataRowsMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    notificationsDataRowsMedia.url = url;
  }
  return notificationsDataRowsMedia;
}

Map<String, dynamic> $NotificationsDataRowsMediaToJson(
    NotificationsDataRowsMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension NotificationsDataRowsMediaExtension on NotificationsDataRowsMedia {
  NotificationsDataRowsMedia copyWith({
    String? type,
    String? url,
  }) {
    return NotificationsDataRowsMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

NotificationsDataPaginate $NotificationsDataPaginateFromJson(
    Map<String, dynamic> json) {
  final NotificationsDataPaginate notificationsDataPaginate = NotificationsDataPaginate();
  final int? currentPage = jsonConvert.convert<int>(json['current_page']);
  if (currentPage != null) {
    notificationsDataPaginate.currentPage = currentPage;
  }
  final String? firstPageUrl = jsonConvert.convert<String>(
      json['first_page_url']);
  if (firstPageUrl != null) {
    notificationsDataPaginate.firstPageUrl = firstPageUrl;
  }
  final int? from = jsonConvert.convert<int>(json['from']);
  if (from != null) {
    notificationsDataPaginate.from = from;
  }
  final int? lastPage = jsonConvert.convert<int>(json['last_page']);
  if (lastPage != null) {
    notificationsDataPaginate.lastPage = lastPage;
  }
  final String? lastPageUrl = jsonConvert.convert<String>(
      json['last_page_url']);
  if (lastPageUrl != null) {
    notificationsDataPaginate.lastPageUrl = lastPageUrl;
  }
  final dynamic nextPageUrl = json['next_page_url'];
  if (nextPageUrl != null) {
    notificationsDataPaginate.nextPageUrl = nextPageUrl;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    notificationsDataPaginate.path = path;
  }
  final int? perPage = jsonConvert.convert<int>(json['per_page']);
  if (perPage != null) {
    notificationsDataPaginate.perPage = perPage;
  }
  final dynamic prevPageUrl = json['prev_page_url'];
  if (prevPageUrl != null) {
    notificationsDataPaginate.prevPageUrl = prevPageUrl;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    notificationsDataPaginate.to = to;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    notificationsDataPaginate.total = total;
  }
  return notificationsDataPaginate;
}

Map<String, dynamic> $NotificationsDataPaginateToJson(
    NotificationsDataPaginate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['current_page'] = entity.currentPage;
  data['first_page_url'] = entity.firstPageUrl;
  data['from'] = entity.from;
  data['last_page'] = entity.lastPage;
  data['last_page_url'] = entity.lastPageUrl;
  data['next_page_url'] = entity.nextPageUrl;
  data['path'] = entity.path;
  data['per_page'] = entity.perPage;
  data['prev_page_url'] = entity.prevPageUrl;
  data['to'] = entity.to;
  data['total'] = entity.total;
  return data;
}

extension NotificationsDataPaginateExtension on NotificationsDataPaginate {
  NotificationsDataPaginate copyWith({
    int? currentPage,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) {
    return NotificationsDataPaginate()
      ..currentPage = currentPage ?? this.currentPage
      ..firstPageUrl = firstPageUrl ?? this.firstPageUrl
      ..from = from ?? this.from
      ..lastPage = lastPage ?? this.lastPage
      ..lastPageUrl = lastPageUrl ?? this.lastPageUrl
      ..nextPageUrl = nextPageUrl ?? this.nextPageUrl
      ..path = path ?? this.path
      ..perPage = perPage ?? this.perPage
      ..prevPageUrl = prevPageUrl ?? this.prevPageUrl
      ..to = to ?? this.to
      ..total = total ?? this.total;
  }
}