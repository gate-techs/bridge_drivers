import 'package:kishk_driver/generated/json/base/json_convert_content.dart';

import '../../features/main_screens/drivers/data/drivers_entity.dart';

DriversEntity $DriversEntityFromJson(Map<String, dynamic> json) {
  final DriversEntity driversEntity = DriversEntity();
  final DriversData? data = jsonConvert.convert<DriversData>(json['data']);
  if (data != null) {
    driversEntity.data = data;
  }
  return driversEntity;
}

Map<String, dynamic> $DriversEntityToJson(DriversEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension DriversEntityExtension on DriversEntity {
  DriversEntity copyWith({
    DriversData? data,
  }) {
    return DriversEntity()
      ..data = data ?? this.data;
  }
}

DriversData $DriversDataFromJson(Map<String, dynamic> json) {
  final DriversData driversData = DriversData();
  final List<DriversDataRows>? rows = (json['rows'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<DriversDataRows>(e) as DriversDataRows)
      .toList();
  if (rows != null) {
    driversData.rows = rows;
  }
  final DriversDataPaginate? paginate = jsonConvert.convert<
      DriversDataPaginate>(json['paginate']);
  if (paginate != null) {
    driversData.paginate = paginate;
  }
  return driversData;
}

Map<String, dynamic> $DriversDataToJson(DriversData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rows'] = entity.rows?.map((v) => v.toJson()).toList();
  data['paginate'] = entity.paginate?.toJson();
  return data;
}

extension DriversDataExtension on DriversData {
  DriversData copyWith({
    List<DriversDataRows>? rows,
    DriversDataPaginate? paginate,
  }) {
    return DriversData()
      ..rows = rows ?? this.rows
      ..paginate = paginate ?? this.paginate;
  }
}

DriversDataRows $DriversDataRowsFromJson(Map<String, dynamic> json) {
  final DriversDataRows driversDataRows = DriversDataRows();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    driversDataRows.id = id;
  }
  final DriversDataRowsMedia? media = jsonConvert.convert<DriversDataRowsMedia>(
      json['media']);
  if (media != null) {
    driversDataRows.media = media;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    driversDataRows.name = name;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    driversDataRows.mobile = mobile;
  }
  final int? totalOrders = jsonConvert.convert<int>(json['totalOrders']);
  if (totalOrders != null) {
    driversDataRows.totalOrders = totalOrders;
  }
  final List<DriversDataRowsOrders>? orders = (json['orders'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<DriversDataRowsOrders>(e) as DriversDataRowsOrders)
      .toList();
  if (orders != null) {
    driversDataRows.orders = orders;
  }
  return driversDataRows;
}

Map<String, dynamic> $DriversDataRowsToJson(DriversDataRows entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['media'] = entity.media?.toJson();
  data['name'] = entity.name;
  data['mobile'] = entity.mobile;
  data['totalOrders'] = entity.totalOrders;
  data['orders'] = entity.orders?.map((v) => v.toJson()).toList();
  return data;
}

extension DriversDataRowsExtension on DriversDataRows {
  DriversDataRows copyWith({
    int? id,
    DriversDataRowsMedia? media,
    String? name,
    String? mobile,
    int? totalOrders,
    List<DriversDataRowsOrders>? orders,
  }) {
    return DriversDataRows()
      ..id = id ?? this.id
      ..media = media ?? this.media
      ..name = name ?? this.name
      ..mobile = mobile ?? this.mobile
      ..totalOrders = totalOrders ?? this.totalOrders
      ..orders = orders ?? this.orders;
  }
}

DriversDataRowsMedia $DriversDataRowsMediaFromJson(Map<String, dynamic> json) {
  final DriversDataRowsMedia driversDataRowsMedia = DriversDataRowsMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    driversDataRowsMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    driversDataRowsMedia.url = url;
  }
  return driversDataRowsMedia;
}

Map<String, dynamic> $DriversDataRowsMediaToJson(DriversDataRowsMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension DriversDataRowsMediaExtension on DriversDataRowsMedia {
  DriversDataRowsMedia copyWith({
    String? type,
    String? url,
  }) {
    return DriversDataRowsMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

DriversDataRowsOrders $DriversDataRowsOrdersFromJson(
    Map<String, dynamic> json) {
  final DriversDataRowsOrders driversDataRowsOrders = DriversDataRowsOrders();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    driversDataRowsOrders.id = id;
  }
  final String? encryptId = jsonConvert.convert<String>(json['encryptId']);
  if (encryptId != null) {
    driversDataRowsOrders.encryptId = encryptId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    driversDataRowsOrders.orderNo = orderNo;
  }
  final DriversDataRowsOrdersCustomer? customer = jsonConvert.convert<
      DriversDataRowsOrdersCustomer>(json['customer']);
  if (customer != null) {
    driversDataRowsOrders.customer = customer;
  }
  final DriversDataRowsOrdersDriver? driver = jsonConvert.convert<
      DriversDataRowsOrdersDriver>(json['driver']);
  if (driver != null) {
    driversDataRowsOrders.driver = driver;
  }
  final String? totalGrandPrice = jsonConvert.convert<String>(
      json['totalGrandPrice']);
  if (totalGrandPrice != null) {
    driversDataRowsOrders.totalGrandPrice = totalGrandPrice;
  }
  final int? totalQtyInOrder = jsonConvert.convert<int>(
      json['totalQtyInOrder']);
  if (totalQtyInOrder != null) {
    driversDataRowsOrders.totalQtyInOrder = totalQtyInOrder;
  }
  final bool? paid = jsonConvert.convert<bool>(json['paid']);
  if (paid != null) {
    driversDataRowsOrders.paid = paid;
  }
  final bool? cancelled = jsonConvert.convert<bool>(json['cancelled']);
  if (cancelled != null) {
    driversDataRowsOrders.cancelled = cancelled;
  }
  final String? orderedDate = jsonConvert.convert<String>(json['orderedDate']);
  if (orderedDate != null) {
    driversDataRowsOrders.orderedDate = orderedDate;
  }
  final String? dispatchedDate = jsonConvert.convert<String>(
      json['dispatchedDate']);
  if (dispatchedDate != null) {
    driversDataRowsOrders.dispatchedDate = dispatchedDate;
  }
  final String? shippedDate = jsonConvert.convert<String>(json['shippedDate']);
  if (shippedDate != null) {
    driversDataRowsOrders.shippedDate = shippedDate;
  }
  final String? deliveredDate = jsonConvert.convert<String>(
      json['deliveredDate']);
  if (deliveredDate != null) {
    driversDataRowsOrders.deliveredDate = deliveredDate;
  }
  final String? orderStatus = jsonConvert.convert<String>(json['orderStatus']);
  if (orderStatus != null) {
    driversDataRowsOrders.orderStatus = orderStatus;
  }
  return driversDataRowsOrders;
}

Map<String, dynamic> $DriversDataRowsOrdersToJson(
    DriversDataRowsOrders entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['encryptId'] = entity.encryptId;
  data['orderNo'] = entity.orderNo;
  data['customer'] = entity.customer?.toJson();
  data['driver'] = entity.driver?.toJson();
  data['totalGrandPrice'] = entity.totalGrandPrice;
  data['totalQtyInOrder'] = entity.totalQtyInOrder;
  data['paid'] = entity.paid;
  data['cancelled'] = entity.cancelled;
  data['orderedDate'] = entity.orderedDate;
  data['dispatchedDate'] = entity.dispatchedDate;
  data['shippedDate'] = entity.shippedDate;
  data['deliveredDate'] = entity.deliveredDate;
  data['orderStatus'] = entity.orderStatus;
  return data;
}

extension DriversDataRowsOrdersExtension on DriversDataRowsOrders {
  DriversDataRowsOrders copyWith({
    int? id,
    String? encryptId,
    String? orderNo,
    DriversDataRowsOrdersCustomer? customer,
    DriversDataRowsOrdersDriver? driver,
    String? totalGrandPrice,
    int? totalQtyInOrder,
    bool? paid,
    bool? cancelled,
    String? orderedDate,
    String? dispatchedDate,
    String? shippedDate,
    String? deliveredDate,
    String? orderStatus,
  }) {
    return DriversDataRowsOrders()
      ..id = id ?? this.id
      ..encryptId = encryptId ?? this.encryptId
      ..orderNo = orderNo ?? this.orderNo
      ..customer = customer ?? this.customer
      ..driver = driver ?? this.driver
      ..totalGrandPrice = totalGrandPrice ?? this.totalGrandPrice
      ..totalQtyInOrder = totalQtyInOrder ?? this.totalQtyInOrder
      ..paid = paid ?? this.paid
      ..cancelled = cancelled ?? this.cancelled
      ..orderedDate = orderedDate ?? this.orderedDate
      ..dispatchedDate = dispatchedDate ?? this.dispatchedDate
      ..shippedDate = shippedDate ?? this.shippedDate
      ..deliveredDate = deliveredDate ?? this.deliveredDate
      ..orderStatus = orderStatus ?? this.orderStatus;
  }
}

DriversDataRowsOrdersCustomer $DriversDataRowsOrdersCustomerFromJson(
    Map<String, dynamic> json) {
  final DriversDataRowsOrdersCustomer driversDataRowsOrdersCustomer = DriversDataRowsOrdersCustomer();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    driversDataRowsOrdersCustomer.name = name;
  }
  return driversDataRowsOrdersCustomer;
}

Map<String, dynamic> $DriversDataRowsOrdersCustomerToJson(
    DriversDataRowsOrdersCustomer entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  return data;
}

extension DriversDataRowsOrdersCustomerExtension on DriversDataRowsOrdersCustomer {
  DriversDataRowsOrdersCustomer copyWith({
    String? name,
  }) {
    return DriversDataRowsOrdersCustomer()
      ..name = name ?? this.name;
  }
}

DriversDataRowsOrdersDriver $DriversDataRowsOrdersDriverFromJson(
    Map<String, dynamic> json) {
  final DriversDataRowsOrdersDriver driversDataRowsOrdersDriver = DriversDataRowsOrdersDriver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    driversDataRowsOrdersDriver.id = id;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    driversDataRowsOrdersDriver.mobile = mobile;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    driversDataRowsOrdersDriver.name = name;
  }
  return driversDataRowsOrdersDriver;
}

Map<String, dynamic> $DriversDataRowsOrdersDriverToJson(
    DriversDataRowsOrdersDriver entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['mobile'] = entity.mobile;
  data['name'] = entity.name;
  return data;
}

extension DriversDataRowsOrdersDriverExtension on DriversDataRowsOrdersDriver {
  DriversDataRowsOrdersDriver copyWith({
    String? id,
    String? mobile,
    String? name,
  }) {
    return DriversDataRowsOrdersDriver()
      ..id = id ?? this.id
      ..mobile = mobile ?? this.mobile
      ..name = name ?? this.name;
  }
}

DriversDataPaginate $DriversDataPaginateFromJson(Map<String, dynamic> json) {
  final DriversDataPaginate driversDataPaginate = DriversDataPaginate();
  final int? currentPage = jsonConvert.convert<int>(json['current_page']);
  if (currentPage != null) {
    driversDataPaginate.currentPage = currentPage;
  }
  final String? firstPageUrl = jsonConvert.convert<String>(
      json['first_page_url']);
  if (firstPageUrl != null) {
    driversDataPaginate.firstPageUrl = firstPageUrl;
  }
  final int? from = jsonConvert.convert<int>(json['from']);
  if (from != null) {
    driversDataPaginate.from = from;
  }
  final int? lastPage = jsonConvert.convert<int>(json['last_page']);
  if (lastPage != null) {
    driversDataPaginate.lastPage = lastPage;
  }
  final String? lastPageUrl = jsonConvert.convert<String>(
      json['last_page_url']);
  if (lastPageUrl != null) {
    driversDataPaginate.lastPageUrl = lastPageUrl;
  }
  final dynamic nextPageUrl = json['next_page_url'];
  if (nextPageUrl != null) {
    driversDataPaginate.nextPageUrl = nextPageUrl;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    driversDataPaginate.path = path;
  }
  final int? perPage = jsonConvert.convert<int>(json['per_page']);
  if (perPage != null) {
    driversDataPaginate.perPage = perPage;
  }
  final dynamic prevPageUrl = json['prev_page_url'];
  if (prevPageUrl != null) {
    driversDataPaginate.prevPageUrl = prevPageUrl;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    driversDataPaginate.to = to;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    driversDataPaginate.total = total;
  }
  return driversDataPaginate;
}

Map<String, dynamic> $DriversDataPaginateToJson(DriversDataPaginate entity) {
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

extension DriversDataPaginateExtension on DriversDataPaginate {
  DriversDataPaginate copyWith({
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
    return DriversDataPaginate()
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