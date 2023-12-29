import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/driver_details/data/driver_details_entity.dart';

DriverDetailsEntity $DriverDetailsEntityFromJson(Map<String, dynamic> json) {
  final DriverDetailsEntity driverDetailsEntity = DriverDetailsEntity();
  final DriverDetailsData? data = jsonConvert.convert<DriverDetailsData>(
      json['data']);
  if (data != null) {
    driverDetailsEntity.data = data;
  }
  return driverDetailsEntity;
}

Map<String, dynamic> $DriverDetailsEntityToJson(DriverDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension DriverDetailsEntityExtension on DriverDetailsEntity {
  DriverDetailsEntity copyWith({
    DriverDetailsData? data,
  }) {
    return DriverDetailsEntity()
      ..data = data ?? this.data;
  }
}

DriverDetailsData $DriverDetailsDataFromJson(Map<String, dynamic> json) {
  final DriverDetailsData driverDetailsData = DriverDetailsData();
  final List<DriverDetailsDataRows>? rows = (json['rows'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<DriverDetailsDataRows>(e) as DriverDetailsDataRows)
      .toList();
  if (rows != null) {
    driverDetailsData.rows = rows;
  }
  final DriverDetailsDataPaginate? paginate = jsonConvert.convert<
      DriverDetailsDataPaginate>(json['paginate']);
  if (paginate != null) {
    driverDetailsData.paginate = paginate;
  }
  return driverDetailsData;
}

Map<String, dynamic> $DriverDetailsDataToJson(DriverDetailsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rows'] = entity.rows?.map((v) => v.toJson()).toList();
  data['paginate'] = entity.paginate?.toJson();
  return data;
}

extension DriverDetailsDataExtension on DriverDetailsData {
  DriverDetailsData copyWith({
    List<DriverDetailsDataRows>? rows,
    DriverDetailsDataPaginate? paginate,
  }) {
    return DriverDetailsData()
      ..rows = rows ?? this.rows
      ..paginate = paginate ?? this.paginate;
  }
}

DriverDetailsDataRows $DriverDetailsDataRowsFromJson(
    Map<String, dynamic> json) {
  final DriverDetailsDataRows driverDetailsDataRows = DriverDetailsDataRows();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    driverDetailsDataRows.id = id;
  }
  final String? encryptId = jsonConvert.convert<String>(json['encryptId']);
  if (encryptId != null) {
    driverDetailsDataRows.encryptId = encryptId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    driverDetailsDataRows.orderNo = orderNo;
  }
  final DriverDetailsDataRowsCustomer? customer = jsonConvert.convert<
      DriverDetailsDataRowsCustomer>(json['customer']);
  if (customer != null) {
    driverDetailsDataRows.customer = customer;
  }
  final DriverDetailsDataRowsDriver? driver = jsonConvert.convert<
      DriverDetailsDataRowsDriver>(json['driver']);
  if (driver != null) {
    driverDetailsDataRows.driver = driver;
  }
  final String? totalGrandPrice = jsonConvert.convert<String>(
      json['totalGrandPrice']);
  if (totalGrandPrice != null) {
    driverDetailsDataRows.totalGrandPrice = totalGrandPrice;
  }
  final int? totalQtyInOrder = jsonConvert.convert<int>(
      json['totalQtyInOrder']);
  if (totalQtyInOrder != null) {
    driverDetailsDataRows.totalQtyInOrder = totalQtyInOrder;
  }
  final bool? paid = jsonConvert.convert<bool>(json['paid']);
  if (paid != null) {
    driverDetailsDataRows.paid = paid;
  }
  final bool? cancelled = jsonConvert.convert<bool>(json['cancelled']);
  if (cancelled != null) {
    driverDetailsDataRows.cancelled = cancelled;
  }
  final String? orderedDate = jsonConvert.convert<String>(json['orderedDate']);
  if (orderedDate != null) {
    driverDetailsDataRows.orderedDate = orderedDate;
  }
  final String? dispatchedDate = jsonConvert.convert<String>(
      json['dispatchedDate']);
  if (dispatchedDate != null) {
    driverDetailsDataRows.dispatchedDate = dispatchedDate;
  }
  final String? shippedDate = jsonConvert.convert<String>(json['shippedDate']);
  if (shippedDate != null) {
    driverDetailsDataRows.shippedDate = shippedDate;
  }
  final String? deliveredDate = jsonConvert.convert<String>(
      json['deliveredDate']);
  if (deliveredDate != null) {
    driverDetailsDataRows.deliveredDate = deliveredDate;
  }
  final String? orderStatus = jsonConvert.convert<String>(json['orderStatus']);
  if (orderStatus != null) {
    driverDetailsDataRows.orderStatus = orderStatus;
  }
  return driverDetailsDataRows;
}

Map<String, dynamic> $DriverDetailsDataRowsToJson(
    DriverDetailsDataRows entity) {
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

extension DriverDetailsDataRowsExtension on DriverDetailsDataRows {
  DriverDetailsDataRows copyWith({
    String? id,
    String? encryptId,
    String? orderNo,
    DriverDetailsDataRowsCustomer? customer,
    DriverDetailsDataRowsDriver? driver,
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
    return DriverDetailsDataRows()
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

DriverDetailsDataRowsCustomer $DriverDetailsDataRowsCustomerFromJson(
    Map<String, dynamic> json) {
  final DriverDetailsDataRowsCustomer driverDetailsDataRowsCustomer = DriverDetailsDataRowsCustomer();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    driverDetailsDataRowsCustomer.name = name;
  }
  return driverDetailsDataRowsCustomer;
}

Map<String, dynamic> $DriverDetailsDataRowsCustomerToJson(
    DriverDetailsDataRowsCustomer entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  return data;
}

extension DriverDetailsDataRowsCustomerExtension on DriverDetailsDataRowsCustomer {
  DriverDetailsDataRowsCustomer copyWith({
    String? name,
  }) {
    return DriverDetailsDataRowsCustomer()
      ..name = name ?? this.name;
  }
}

DriverDetailsDataRowsDriver $DriverDetailsDataRowsDriverFromJson(
    Map<String, dynamic> json) {
  final DriverDetailsDataRowsDriver driverDetailsDataRowsDriver = DriverDetailsDataRowsDriver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    driverDetailsDataRowsDriver.id = id;
  }
  final dynamic mobile = json['mobile'];
  if (mobile != null) {
    driverDetailsDataRowsDriver.mobile = mobile;
  }
  final dynamic name = json['name'];
  if (name != null) {
    driverDetailsDataRowsDriver.name = name;
  }
  return driverDetailsDataRowsDriver;
}

Map<String, dynamic> $DriverDetailsDataRowsDriverToJson(
    DriverDetailsDataRowsDriver entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['mobile'] = entity.mobile;
  data['name'] = entity.name;
  return data;
}

extension DriverDetailsDataRowsDriverExtension on DriverDetailsDataRowsDriver {
  DriverDetailsDataRowsDriver copyWith({
    String? id,
    dynamic mobile,
    dynamic name,
  }) {
    return DriverDetailsDataRowsDriver()
      ..id = id ?? this.id
      ..mobile = mobile ?? this.mobile
      ..name = name ?? this.name;
  }
}

DriverDetailsDataPaginate $DriverDetailsDataPaginateFromJson(
    Map<String, dynamic> json) {
  final DriverDetailsDataPaginate driverDetailsDataPaginate = DriverDetailsDataPaginate();
  final int? currentPage = jsonConvert.convert<int>(json['current_page']);
  if (currentPage != null) {
    driverDetailsDataPaginate.currentPage = currentPage;
  }
  final String? firstPageUrl = jsonConvert.convert<String>(
      json['first_page_url']);
  if (firstPageUrl != null) {
    driverDetailsDataPaginate.firstPageUrl = firstPageUrl;
  }
  final int? from = jsonConvert.convert<int>(json['from']);
  if (from != null) {
    driverDetailsDataPaginate.from = from;
  }
  final int? lastPage = jsonConvert.convert<int>(json['last_page']);
  if (lastPage != null) {
    driverDetailsDataPaginate.lastPage = lastPage;
  }
  final String? lastPageUrl = jsonConvert.convert<String>(
      json['last_page_url']);
  if (lastPageUrl != null) {
    driverDetailsDataPaginate.lastPageUrl = lastPageUrl;
  }
  final dynamic nextPageUrl = json['next_page_url'];
  if (nextPageUrl != null) {
    driverDetailsDataPaginate.nextPageUrl = nextPageUrl;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    driverDetailsDataPaginate.path = path;
  }
  final int? perPage = jsonConvert.convert<int>(json['per_page']);
  if (perPage != null) {
    driverDetailsDataPaginate.perPage = perPage;
  }
  final dynamic prevPageUrl = json['prev_page_url'];
  if (prevPageUrl != null) {
    driverDetailsDataPaginate.prevPageUrl = prevPageUrl;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    driverDetailsDataPaginate.to = to;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    driverDetailsDataPaginate.total = total;
  }
  return driverDetailsDataPaginate;
}

Map<String, dynamic> $DriverDetailsDataPaginateToJson(
    DriverDetailsDataPaginate entity) {
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

extension DriverDetailsDataPaginateExtension on DriverDetailsDataPaginate {
  DriverDetailsDataPaginate copyWith({
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
    return DriverDetailsDataPaginate()
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