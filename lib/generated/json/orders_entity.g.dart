import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/features/main_screens/home/data/orders_entity.dart';

OrdersEntity $OrdersEntityFromJson(Map<String, dynamic> json) {
  final OrdersEntity ordersEntity = OrdersEntity();
  final OrdersData? data = jsonConvert.convert<OrdersData>(json['data']);
  if (data != null) {
    ordersEntity.data = data;
  }
  return ordersEntity;
}

Map<String, dynamic> $OrdersEntityToJson(OrdersEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension OrdersEntityExtension on OrdersEntity {
  OrdersEntity copyWith({
    OrdersData? data,
  }) {
    return OrdersEntity()
      ..data = data ?? this.data;
  }
}

OrdersData $OrdersDataFromJson(Map<String, dynamic> json) {
  final OrdersData ordersData = OrdersData();
  final List<OrdersDataRows>? rows = (json['rows'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<OrdersDataRows>(e) as OrdersDataRows)
      .toList();
  if (rows != null) {
    ordersData.rows = rows;
  }
  final OrdersDataPaginate? paginate = jsonConvert.convert<OrdersDataPaginate>(
      json['paginate']);
  if (paginate != null) {
    ordersData.paginate = paginate;
  }
  return ordersData;
}

Map<String, dynamic> $OrdersDataToJson(OrdersData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rows'] = entity.rows?.map((v) => v.toJson()).toList();
  data['paginate'] = entity.paginate?.toJson();
  return data;
}

extension OrdersDataExtension on OrdersData {
  OrdersData copyWith({
    List<OrdersDataRows>? rows,
    OrdersDataPaginate? paginate,
  }) {
    return OrdersData()
      ..rows = rows ?? this.rows
      ..paginate = paginate ?? this.paginate;
  }
}

OrdersDataRows $OrdersDataRowsFromJson(Map<String, dynamic> json) {
  final OrdersDataRows ordersDataRows = OrdersDataRows();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    ordersDataRows.id = id;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    ordersDataRows.orderNo = orderNo;
  }
  final OrdersDataRowsCustomer? customer = jsonConvert.convert<
      OrdersDataRowsCustomer>(json['customer']);
  if (customer != null) {
    ordersDataRows.customer = customer;
  }
  final OrdersDataRowsDriver? driver = jsonConvert.convert<
      OrdersDataRowsDriver>(json['driver']);
  if (driver != null) {
    ordersDataRows.driver = driver;
  }
  final String? totalGrandPrice = jsonConvert.convert<String>(
      json['totalGrandPrice']);
  if (totalGrandPrice != null) {
    ordersDataRows.totalGrandPrice = totalGrandPrice;
  }
  final bool? cancelled = jsonConvert.convert<bool>(json['cancelled']);
  if (cancelled != null) {
    ordersDataRows.cancelled = cancelled;
  }
  final String? orderedDate = jsonConvert.convert<String>(json['orderedDate']);
  if (orderedDate != null) {
    ordersDataRows.orderedDate = orderedDate;
  }
  final String? orderStatus = jsonConvert.convert<String>(json['orderStatus']);
  if (orderStatus != null) {
    ordersDataRows.orderStatus = orderStatus;
  }
  return ordersDataRows;
}

Map<String, dynamic> $OrdersDataRowsToJson(OrdersDataRows entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['orderNo'] = entity.orderNo;
  data['customer'] = entity.customer?.toJson();
  data['driver'] = entity.driver?.toJson();
  data['totalGrandPrice'] = entity.totalGrandPrice;
  data['cancelled'] = entity.cancelled;
  data['orderedDate'] = entity.orderedDate;
  data['orderStatus'] = entity.orderStatus;
  return data;
}

extension OrdersDataRowsExtension on OrdersDataRows {
  OrdersDataRows copyWith({
    int? id,
    String? orderNo,
    OrdersDataRowsCustomer? customer,
    OrdersDataRowsDriver? driver,
    String? totalGrandPrice,
    bool? cancelled,
    String? orderedDate,
    String? orderStatus,
  }) {
    return OrdersDataRows()
      ..id = id ?? this.id
      ..orderNo = orderNo ?? this.orderNo
      ..customer = customer ?? this.customer
      ..driver = driver ?? this.driver
      ..totalGrandPrice = totalGrandPrice ?? this.totalGrandPrice
      ..cancelled = cancelled ?? this.cancelled
      ..orderedDate = orderedDate ?? this.orderedDate
      ..orderStatus = orderStatus ?? this.orderStatus;
  }
}

OrdersDataRowsCustomer $OrdersDataRowsCustomerFromJson(
    Map<String, dynamic> json) {
  final OrdersDataRowsCustomer ordersDataRowsCustomer = OrdersDataRowsCustomer();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    ordersDataRowsCustomer.name = name;
  }
  return ordersDataRowsCustomer;
}

Map<String, dynamic> $OrdersDataRowsCustomerToJson(
    OrdersDataRowsCustomer entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  return data;
}

extension OrdersDataRowsCustomerExtension on OrdersDataRowsCustomer {
  OrdersDataRowsCustomer copyWith({
    String? name,
  }) {
    return OrdersDataRowsCustomer()
      ..name = name ?? this.name;
  }
}

OrdersDataRowsDriver $OrdersDataRowsDriverFromJson(Map<String, dynamic> json) {
  final OrdersDataRowsDriver ordersDataRowsDriver = OrdersDataRowsDriver();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    ordersDataRowsDriver.id = id;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    ordersDataRowsDriver.mobile = mobile;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    ordersDataRowsDriver.name = name;
  }
  return ordersDataRowsDriver;
}

Map<String, dynamic> $OrdersDataRowsDriverToJson(OrdersDataRowsDriver entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['mobile'] = entity.mobile;
  data['name'] = entity.name;
  return data;
}

extension OrdersDataRowsDriverExtension on OrdersDataRowsDriver {
  OrdersDataRowsDriver copyWith({
    String? id,
    String? mobile,
    String? name,
  }) {
    return OrdersDataRowsDriver()
      ..id = id ?? this.id
      ..mobile = mobile ?? this.mobile
      ..name = name ?? this.name;
  }
}

OrdersDataPaginate $OrdersDataPaginateFromJson(Map<String, dynamic> json) {
  final OrdersDataPaginate ordersDataPaginate = OrdersDataPaginate();
  final int? currentPage = jsonConvert.convert<int>(json['current_page']);
  if (currentPage != null) {
    ordersDataPaginate.currentPage = currentPage;
  }
  final String? firstPageUrl = jsonConvert.convert<String>(
      json['first_page_url']);
  if (firstPageUrl != null) {
    ordersDataPaginate.firstPageUrl = firstPageUrl;
  }
  final int? from = jsonConvert.convert<int>(json['from']);
  if (from != null) {
    ordersDataPaginate.from = from;
  }
  final int? lastPage = jsonConvert.convert<int>(json['last_page']);
  if (lastPage != null) {
    ordersDataPaginate.lastPage = lastPage;
  }
  final String? lastPageUrl = jsonConvert.convert<String>(
      json['last_page_url']);
  if (lastPageUrl != null) {
    ordersDataPaginate.lastPageUrl = lastPageUrl;
  }
  final dynamic nextPageUrl = json['next_page_url'];
  if (nextPageUrl != null) {
    ordersDataPaginate.nextPageUrl = nextPageUrl;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    ordersDataPaginate.path = path;
  }
  final String? perPage = jsonConvert.convert<String>(json['per_page']);
  if (perPage != null) {
    ordersDataPaginate.perPage = perPage;
  }
  final dynamic prevPageUrl = json['prev_page_url'];
  if (prevPageUrl != null) {
    ordersDataPaginate.prevPageUrl = prevPageUrl;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    ordersDataPaginate.to = to;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    ordersDataPaginate.total = total;
  }
  return ordersDataPaginate;
}

Map<String, dynamic> $OrdersDataPaginateToJson(OrdersDataPaginate entity) {
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

extension OrdersDataPaginateExtension on OrdersDataPaginate {
  OrdersDataPaginate copyWith({
    int? currentPage,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    dynamic nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) {
    return OrdersDataPaginate()
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