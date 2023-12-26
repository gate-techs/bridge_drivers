import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/main_screens/profile/data/app_pages_entity.dart';

AppPagesEntity $AppPagesEntityFromJson(Map<String, dynamic> json) {
  final AppPagesEntity appPagesEntity = AppPagesEntity();
  final AppPagesData? data = jsonConvert.convert<AppPagesData>(json['data']);
  if (data != null) {
    appPagesEntity.data = data;
  }
  return appPagesEntity;
}

Map<String, dynamic> $AppPagesEntityToJson(AppPagesEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension AppPagesEntityExtension on AppPagesEntity {
  AppPagesEntity copyWith({
    AppPagesData? data,
  }) {
    return AppPagesEntity()
      ..data = data ?? this.data;
  }
}

AppPagesData $AppPagesDataFromJson(Map<String, dynamic> json) {
  final AppPagesData appPagesData = AppPagesData();
  final List<AppPagesDataRows>? rows = (json['rows'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<AppPagesDataRows>(e) as AppPagesDataRows)
      .toList();
  if (rows != null) {
    appPagesData.rows = rows;
  }
  final AppPagesDataPaginate? paginate = jsonConvert.convert<
      AppPagesDataPaginate>(json['paginate']);
  if (paginate != null) {
    appPagesData.paginate = paginate;
  }
  final AppPagesDataPermissions? permissions = jsonConvert.convert<
      AppPagesDataPermissions>(json['permissions']);
  if (permissions != null) {
    appPagesData.permissions = permissions;
  }
  return appPagesData;
}

Map<String, dynamic> $AppPagesDataToJson(AppPagesData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rows'] = entity.rows?.map((v) => v.toJson()).toList();
  data['paginate'] = entity.paginate?.toJson();
  data['permissions'] = entity.permissions?.toJson();
  return data;
}

extension AppPagesDataExtension on AppPagesData {
  AppPagesData copyWith({
    List<AppPagesDataRows>? rows,
    AppPagesDataPaginate? paginate,
    AppPagesDataPermissions? permissions,
  }) {
    return AppPagesData()
      ..rows = rows ?? this.rows
      ..paginate = paginate ?? this.paginate
      ..permissions = permissions ?? this.permissions;
  }
}

AppPagesDataRows $AppPagesDataRowsFromJson(Map<String, dynamic> json) {
  final AppPagesDataRows appPagesDataRows = AppPagesDataRows();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    appPagesDataRows.id = id;
  }
  final String? encryptId = jsonConvert.convert<String>(json['encryptId']);
  if (encryptId != null) {
    appPagesDataRows.encryptId = encryptId;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    appPagesDataRows.image = image;
  }
  final AppPagesDataRowsUser? user = jsonConvert.convert<AppPagesDataRowsUser>(
      json['user']);
  if (user != null) {
    appPagesDataRows.user = user;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    appPagesDataRows.sort = sort;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    appPagesDataRows.status = status;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    appPagesDataRows.date = date;
  }
  final AppPagesDataRowsEn? en = jsonConvert.convert<AppPagesDataRowsEn>(
      json['en']);
  if (en != null) {
    appPagesDataRows.en = en;
  }
  final AppPagesDataRowsAr? ar = jsonConvert.convert<AppPagesDataRowsAr>(
      json['ar']);
  if (ar != null) {
    appPagesDataRows.ar = ar;
  }
  return appPagesDataRows;
}

Map<String, dynamic> $AppPagesDataRowsToJson(AppPagesDataRows entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['encryptId'] = entity.encryptId;
  data['image'] = entity.image;
  data['user'] = entity.user?.toJson();
  data['sort'] = entity.sort;
  data['status'] = entity.status;
  data['date'] = entity.date;
  data['en'] = entity.en?.toJson();
  data['ar'] = entity.ar?.toJson();
  return data;
}

extension AppPagesDataRowsExtension on AppPagesDataRows {
  AppPagesDataRows copyWith({
    int? id,
    String? encryptId,
    String? image,
    AppPagesDataRowsUser? user,
    int? sort,
    String? status,
    String? date,
    AppPagesDataRowsEn? en,
    AppPagesDataRowsAr? ar,
  }) {
    return AppPagesDataRows()
      ..id = id ?? this.id
      ..encryptId = encryptId ?? this.encryptId
      ..image = image ?? this.image
      ..user = user ?? this.user
      ..sort = sort ?? this.sort
      ..status = status ?? this.status
      ..date = date ?? this.date
      ..en = en ?? this.en
      ..ar = ar ?? this.ar;
  }
}

AppPagesDataRowsUser $AppPagesDataRowsUserFromJson(Map<String, dynamic> json) {
  final AppPagesDataRowsUser appPagesDataRowsUser = AppPagesDataRowsUser();
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    appPagesDataRowsUser.image = image;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    appPagesDataRowsUser.name = name;
  }
  return appPagesDataRowsUser;
}

Map<String, dynamic> $AppPagesDataRowsUserToJson(AppPagesDataRowsUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['image'] = entity.image;
  data['name'] = entity.name;
  return data;
}

extension AppPagesDataRowsUserExtension on AppPagesDataRowsUser {
  AppPagesDataRowsUser copyWith({
    String? image,
    String? name,
  }) {
    return AppPagesDataRowsUser()
      ..image = image ?? this.image
      ..name = name ?? this.name;
  }
}

AppPagesDataRowsEn $AppPagesDataRowsEnFromJson(Map<String, dynamic> json) {
  final AppPagesDataRowsEn appPagesDataRowsEn = AppPagesDataRowsEn();
  final String? tinyTitle = jsonConvert.convert<String>(json['tinyTitle']);
  if (tinyTitle != null) {
    appPagesDataRowsEn.tinyTitle = tinyTitle;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    appPagesDataRowsEn.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    appPagesDataRowsEn.body = body;
  }
  return appPagesDataRowsEn;
}

Map<String, dynamic> $AppPagesDataRowsEnToJson(AppPagesDataRowsEn entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tinyTitle'] = entity.tinyTitle;
  data['title'] = entity.title;
  data['body'] = entity.body;
  return data;
}

extension AppPagesDataRowsEnExtension on AppPagesDataRowsEn {
  AppPagesDataRowsEn copyWith({
    String? tinyTitle,
    String? title,
    String? body,
  }) {
    return AppPagesDataRowsEn()
      ..tinyTitle = tinyTitle ?? this.tinyTitle
      ..title = title ?? this.title
      ..body = body ?? this.body;
  }
}

AppPagesDataRowsAr $AppPagesDataRowsArFromJson(Map<String, dynamic> json) {
  final AppPagesDataRowsAr appPagesDataRowsAr = AppPagesDataRowsAr();
  final String? tinyTitle = jsonConvert.convert<String>(json['tinyTitle']);
  if (tinyTitle != null) {
    appPagesDataRowsAr.tinyTitle = tinyTitle;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    appPagesDataRowsAr.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    appPagesDataRowsAr.body = body;
  }
  return appPagesDataRowsAr;
}

Map<String, dynamic> $AppPagesDataRowsArToJson(AppPagesDataRowsAr entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tinyTitle'] = entity.tinyTitle;
  data['title'] = entity.title;
  data['body'] = entity.body;
  return data;
}

extension AppPagesDataRowsArExtension on AppPagesDataRowsAr {
  AppPagesDataRowsAr copyWith({
    String? tinyTitle,
    String? title,
    String? body,
  }) {
    return AppPagesDataRowsAr()
      ..tinyTitle = tinyTitle ?? this.tinyTitle
      ..title = title ?? this.title
      ..body = body ?? this.body;
  }
}

AppPagesDataPaginate $AppPagesDataPaginateFromJson(Map<String, dynamic> json) {
  final AppPagesDataPaginate appPagesDataPaginate = AppPagesDataPaginate();
  final int? currentPage = jsonConvert.convert<int>(json['current_page']);
  if (currentPage != null) {
    appPagesDataPaginate.currentPage = currentPage;
  }
  final String? firstPageUrl = jsonConvert.convert<String>(
      json['first_page_url']);
  if (firstPageUrl != null) {
    appPagesDataPaginate.firstPageUrl = firstPageUrl;
  }
  final int? from = jsonConvert.convert<int>(json['from']);
  if (from != null) {
    appPagesDataPaginate.from = from;
  }
  final int? lastPage = jsonConvert.convert<int>(json['last_page']);
  if (lastPage != null) {
    appPagesDataPaginate.lastPage = lastPage;
  }
  final String? lastPageUrl = jsonConvert.convert<String>(
      json['last_page_url']);
  if (lastPageUrl != null) {
    appPagesDataPaginate.lastPageUrl = lastPageUrl;
  }
  final dynamic nextPageUrl = json['next_page_url'];
  if (nextPageUrl != null) {
    appPagesDataPaginate.nextPageUrl = nextPageUrl;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    appPagesDataPaginate.path = path;
  }
  final int? perPage = jsonConvert.convert<int>(json['per_page']);
  if (perPage != null) {
    appPagesDataPaginate.perPage = perPage;
  }
  final dynamic prevPageUrl = json['prev_page_url'];
  if (prevPageUrl != null) {
    appPagesDataPaginate.prevPageUrl = prevPageUrl;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    appPagesDataPaginate.to = to;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    appPagesDataPaginate.total = total;
  }
  return appPagesDataPaginate;
}

Map<String, dynamic> $AppPagesDataPaginateToJson(AppPagesDataPaginate entity) {
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

extension AppPagesDataPaginateExtension on AppPagesDataPaginate {
  AppPagesDataPaginate copyWith({
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
    return AppPagesDataPaginate()
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

AppPagesDataPermissions $AppPagesDataPermissionsFromJson(
    Map<String, dynamic> json) {
  final AppPagesDataPermissions appPagesDataPermissions = AppPagesDataPermissions();
  final bool? read = jsonConvert.convert<bool>(json['read']);
  if (read != null) {
    appPagesDataPermissions.read = read;
  }
  final bool? create = jsonConvert.convert<bool>(json['create']);
  if (create != null) {
    appPagesDataPermissions.create = create;
  }
  final bool? update = jsonConvert.convert<bool>(json['update']);
  if (update != null) {
    appPagesDataPermissions.update = update;
  }
  final bool? delete = jsonConvert.convert<bool>(json['delete']);
  if (delete != null) {
    appPagesDataPermissions.delete = delete;
  }
  return appPagesDataPermissions;
}

Map<String, dynamic> $AppPagesDataPermissionsToJson(
    AppPagesDataPermissions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['read'] = entity.read;
  data['create'] = entity.create;
  data['update'] = entity.update;
  data['delete'] = entity.delete;
  return data;
}

extension AppPagesDataPermissionsExtension on AppPagesDataPermissions {
  AppPagesDataPermissions copyWith({
    bool? read,
    bool? create,
    bool? update,
    bool? delete,
  }) {
    return AppPagesDataPermissions()
      ..read = read ?? this.read
      ..create = create ?? this.create
      ..update = update ?? this.update
      ..delete = delete ?? this.delete;
  }
}