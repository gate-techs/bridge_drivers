
import '../features/order_details_screen/data/order_details_entity.dart';
import 'json/base/json_convert_content.dart';

OrderDetailsEntity $OrderDetailsEntityFromJson(Map<String, dynamic> json) {
  final OrderDetailsEntity orderDetailsEntity = OrderDetailsEntity();
  final OrderDetailsData? data = jsonConvert.convert<OrderDetailsData>(
      json['data']);
  if (data != null) {
    orderDetailsEntity.data = data;
  }
  return orderDetailsEntity;
}

Map<String, dynamic> $OrderDetailsEntityToJson(OrderDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension OrderDetailsEntityExtension on OrderDetailsEntity {
  OrderDetailsEntity copyWith({
    OrderDetailsData? data,
  }) {
    return OrderDetailsEntity()
      ..data = data ?? this.data;
  }
}

OrderDetailsData $OrderDetailsDataFromJson(Map<String, dynamic> json) {
  final OrderDetailsData orderDetailsData = OrderDetailsData();
  final OrderDetailsDataRow? row = jsonConvert.convert<OrderDetailsDataRow>(
      json['row']);
  if (row != null) {
    orderDetailsData.row = row;
  }
  return orderDetailsData;
}

Map<String, dynamic> $OrderDetailsDataToJson(OrderDetailsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['row'] = entity.row?.toJson();
  return data;
}

extension OrderDetailsDataExtension on OrderDetailsData {
  OrderDetailsData copyWith({
    OrderDetailsDataRow? row,
  }) {
    return OrderDetailsData()
      ..row = row ?? this.row;
  }
}

OrderDetailsDataRow $OrderDetailsDataRowFromJson(Map<String, dynamic> json) {
  final OrderDetailsDataRow orderDetailsDataRow = OrderDetailsDataRow();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDetailsDataRow.id = id;
  }
  final String? encryptId = jsonConvert.convert<String>(json['encryptId']);
  if (encryptId != null) {
    orderDetailsDataRow.encryptId = encryptId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    orderDetailsDataRow.orderNo = orderNo;
  }
  final OrderDetailsDataRowUser? user = jsonConvert.convert<
      OrderDetailsDataRowUser>(json['user']);
  if (user != null) {
    orderDetailsDataRow.user = user;
  }
  final OrderDetailsDataRowDelivery? delivery = jsonConvert.convert<
      OrderDetailsDataRowDelivery>(json['delivery']);
  if (delivery != null) {
    orderDetailsDataRow.delivery = delivery;
  }
  final OrderDetailsDataRowPayment? payment = jsonConvert.convert<
      OrderDetailsDataRowPayment>(json['payment']);
  if (payment != null) {
    orderDetailsDataRow.payment = payment;
  }
  final List<OrderDetailsDataRowVendors>? vendors = (json['vendors'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<OrderDetailsDataRowVendors>(
          e) as OrderDetailsDataRowVendors).toList();
  if (vendors != null) {
    orderDetailsDataRow.vendors = vendors;
  }
  final List<OrderDetailsDataRowProducts>? products = (json['products'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<OrderDetailsDataRowProducts>(
          e) as OrderDetailsDataRowProducts).toList();
  if (products != null) {
    orderDetailsDataRow.products = products;
  }
  final String? subTotal = jsonConvert.convert<String>(json['subTotal']);
  if (subTotal != null) {
    orderDetailsDataRow.subTotal = subTotal;
  }
  final String? discount = jsonConvert.convert<String>(json['discount']);
  if (discount != null) {
    orderDetailsDataRow.discount = discount;
  }
  final String? deliveryFees = jsonConvert.convert<String>(
      json['deliveryFees']);
  if (deliveryFees != null) {
    orderDetailsDataRow.deliveryFees = deliveryFees;
  }
  final String? tax = jsonConvert.convert<String>(json['tax']);
  if (tax != null) {
    orderDetailsDataRow.tax = tax;
  }
  final String? couponValue = jsonConvert.convert<String>(json['couponValue']);
  if (couponValue != null) {
    orderDetailsDataRow.couponValue = couponValue;
  }
  final String? grandTotal = jsonConvert.convert<String>(json['grandTotal']);
  if (grandTotal != null) {
    orderDetailsDataRow.grandTotal = grandTotal;
  }
  final dynamic userNote = json['userNote'];
  if (userNote != null) {
    orderDetailsDataRow.userNote = userNote;
  }
  final String? orderStatus = jsonConvert.convert<String>(json['orderStatus']);
  if (orderStatus != null) {
    orderDetailsDataRow.orderStatus = orderStatus;
  }
  final String? orderedDate = jsonConvert.convert<String>(json['orderedDate']);
  if (orderedDate != null) {
    orderDetailsDataRow.orderedDate = orderedDate;
  }
  final String? dispatchedDate = jsonConvert.convert<String>(
      json['dispatchedDate']);
  if (dispatchedDate != null) {
    orderDetailsDataRow.dispatchedDate = dispatchedDate;
  }
  final String? shippedDate = jsonConvert.convert<String>(json['shippedDate']);
  if (shippedDate != null) {
    orderDetailsDataRow.shippedDate = shippedDate;
  }
  final String? deliveredDate = jsonConvert.convert<String>(
      json['deliveredDate']);
  if (deliveredDate != null) {
    orderDetailsDataRow.deliveredDate = deliveredDate;
  }
  return orderDetailsDataRow;
}

Map<String, dynamic> $OrderDetailsDataRowToJson(OrderDetailsDataRow entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['encryptId'] = entity.encryptId;
  data['orderNo'] = entity.orderNo;
  data['user'] = entity.user?.toJson();
  data['delivery'] = entity.delivery?.toJson();
  data['payment'] = entity.payment?.toJson();
  data['vendors'] = entity.vendors?.map((v) => v.toJson()).toList();
  data['products'] = entity.products?.map((v) => v.toJson()).toList();
  data['subTotal'] = entity.subTotal;
  data['discount'] = entity.discount;
  data['deliveryFees'] = entity.deliveryFees;
  data['tax'] = entity.tax;
  data['couponValue'] = entity.couponValue;
  data['grandTotal'] = entity.grandTotal;
  data['userNote'] = entity.userNote;
  data['orderStatus'] = entity.orderStatus;
  data['orderedDate'] = entity.orderedDate;
  data['dispatchedDate'] = entity.dispatchedDate;
  data['shippedDate'] = entity.shippedDate;
  data['deliveredDate'] = entity.deliveredDate;
  return data;
}

extension OrderDetailsDataRowExtension on OrderDetailsDataRow {
  OrderDetailsDataRow copyWith({
    int? id,
    String? encryptId,
    String? orderNo,
    OrderDetailsDataRowUser? user,
    OrderDetailsDataRowDelivery? delivery,
    OrderDetailsDataRowPayment? payment,
    List<OrderDetailsDataRowVendors>? vendors,
    List<OrderDetailsDataRowProducts>? products,
    String? subTotal,
    String? discount,
    String? deliveryFees,
    String? tax,
    String? couponValue,
    String? grandTotal,
    dynamic userNote,
    String? orderStatus,
    String? orderedDate,
    String? dispatchedDate,
    String? shippedDate,
    String? deliveredDate,
  }) {
    return OrderDetailsDataRow()
      ..id = id ?? this.id
      ..encryptId = encryptId ?? this.encryptId
      ..orderNo = orderNo ?? this.orderNo
      ..user = user ?? this.user
      ..delivery = delivery ?? this.delivery
      ..payment = payment ?? this.payment
      ..vendors = vendors ?? this.vendors
      ..products = products ?? this.products
      ..subTotal = subTotal ?? this.subTotal
      ..discount = discount ?? this.discount
      ..deliveryFees = deliveryFees ?? this.deliveryFees
      ..tax = tax ?? this.tax
      ..couponValue = couponValue ?? this.couponValue
      ..grandTotal = grandTotal ?? this.grandTotal
      ..userNote = userNote ?? this.userNote
      ..orderStatus = orderStatus ?? this.orderStatus
      ..orderedDate = orderedDate ?? this.orderedDate
      ..dispatchedDate = dispatchedDate ?? this.dispatchedDate
      ..shippedDate = shippedDate ?? this.shippedDate
      ..deliveredDate = deliveredDate ?? this.deliveredDate;
  }
}

OrderDetailsDataRowUser $OrderDetailsDataRowUserFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowUser orderDetailsDataRowUser = OrderDetailsDataRowUser();
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    orderDetailsDataRowUser.image = image;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderDetailsDataRowUser.name = name;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    orderDetailsDataRowUser.mobile = mobile;
  }
  final String? province = jsonConvert.convert<String>(json['province']);
  if (province != null) {
    orderDetailsDataRowUser.province = province;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    orderDetailsDataRowUser.city = city;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    orderDetailsDataRowUser.address = address;
  }
  return orderDetailsDataRowUser;
}

Map<String, dynamic> $OrderDetailsDataRowUserToJson(
    OrderDetailsDataRowUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['image'] = entity.image;
  data['name'] = entity.name;
  data['mobile'] = entity.mobile;
  data['province'] = entity.province;
  data['city'] = entity.city;
  data['address'] = entity.address;
  return data;
}

extension OrderDetailsDataRowUserExtension on OrderDetailsDataRowUser {
  OrderDetailsDataRowUser copyWith({
    String? image,
    String? name,
    String? mobile,
    String? province,
    String? city,
    String? address,
  }) {
    return OrderDetailsDataRowUser()
      ..image = image ?? this.image
      ..name = name ?? this.name
      ..mobile = mobile ?? this.mobile
      ..province = province ?? this.province
      ..city = city ?? this.city
      ..address = address ?? this.address;
  }
}

OrderDetailsDataRowDelivery $OrderDetailsDataRowDeliveryFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowDelivery orderDetailsDataRowDelivery = OrderDetailsDataRowDelivery();
  final String? id = jsonConvert.convert<String>(json['id']);
  final String? name = jsonConvert.convert<String>(json['name']);
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (id != null) {
    orderDetailsDataRowDelivery.id = id;
  }
  if (name != null) {
    orderDetailsDataRowDelivery.name = name;
  }
  if (mobile != null) {
    orderDetailsDataRowDelivery.mobile = mobile;
  }
  return orderDetailsDataRowDelivery;
}

Map<String, dynamic> $OrderDetailsDataRowDeliveryToJson(
    OrderDetailsDataRowDelivery entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['mobile'] = entity.mobile;
  return data;
}

extension OrderDetailsDataRowDeliveryExtension on OrderDetailsDataRowDelivery {
  OrderDetailsDataRowDelivery copyWith({
    String? id,
    String? name,
    String? mobile,
  }) {
    return OrderDetailsDataRowDelivery()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..mobile = mobile ?? this.mobile;
  }
}

OrderDetailsDataRowPayment $OrderDetailsDataRowPaymentFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowPayment orderDetailsDataRowPayment = OrderDetailsDataRowPayment();
  final String? paymentMethod = jsonConvert.convert<String>(
      json['paymentMethod']);
  if (paymentMethod != null) {
    orderDetailsDataRowPayment.paymentMethod = paymentMethod;
  }
  final String? paymentId = jsonConvert.convert<String>(json['paymentId']);
  if (paymentId != null) {
    orderDetailsDataRowPayment.paymentId = paymentId;
  }
  final String? paymentTransactionId = jsonConvert.convert<String>(
      json['paymentTransactionId']);
  if (paymentTransactionId != null) {
    orderDetailsDataRowPayment.paymentTransactionId = paymentTransactionId;
  }
  final String? paymentOrderId = jsonConvert.convert<String>(
      json['paymentOrderId']);
  if (paymentOrderId != null) {
    orderDetailsDataRowPayment.paymentOrderId = paymentOrderId;
  }
  final String? paymentStatus = jsonConvert.convert<String>(
      json['paymentStatus']);
  if (paymentStatus != null) {
    orderDetailsDataRowPayment.paymentStatus = paymentStatus;
  }
  final String? paymentTime = jsonConvert.convert<String>(json['paymentTime']);
  if (paymentTime != null) {
    orderDetailsDataRowPayment.paymentTime = paymentTime;
  }
  return orderDetailsDataRowPayment;
}

Map<String, dynamic> $OrderDetailsDataRowPaymentToJson(
    OrderDetailsDataRowPayment entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['paymentMethod'] = entity.paymentMethod;
  data['paymentId'] = entity.paymentId;
  data['paymentTransactionId'] = entity.paymentTransactionId;
  data['paymentOrderId'] = entity.paymentOrderId;
  data['paymentStatus'] = entity.paymentStatus;
  data['paymentTime'] = entity.paymentTime;
  return data;
}

extension OrderDetailsDataRowPaymentExtension on OrderDetailsDataRowPayment {
  OrderDetailsDataRowPayment copyWith({
    String? paymentMethod,
    String? paymentId,
    String? paymentTransactionId,
    String? paymentOrderId,
    String? paymentStatus,
    String? paymentTime,
  }) {
    return OrderDetailsDataRowPayment()
      ..paymentMethod = paymentMethod ?? this.paymentMethod
      ..paymentId = paymentId ?? this.paymentId
      ..paymentTransactionId = paymentTransactionId ?? this.paymentTransactionId
      ..paymentOrderId = paymentOrderId ?? this.paymentOrderId
      ..paymentStatus = paymentStatus ?? this.paymentStatus
      ..paymentTime = paymentTime ?? this.paymentTime;
  }
}

OrderDetailsDataRowVendors $OrderDetailsDataRowVendorsFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowVendors orderDetailsDataRowVendors = OrderDetailsDataRowVendors();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDetailsDataRowVendors.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderDetailsDataRowVendors.name = name;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    orderDetailsDataRowVendors.mobile = mobile;
  }
  final String? province = jsonConvert.convert<String>(json['province']);
  if (province != null) {
    orderDetailsDataRowVendors.province = province;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    orderDetailsDataRowVendors.city = city;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    orderDetailsDataRowVendors.location = location;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    orderDetailsDataRowVendors.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    orderDetailsDataRowVendors.body = body;
  }
  return orderDetailsDataRowVendors;
}

Map<String, dynamic> $OrderDetailsDataRowVendorsToJson(
    OrderDetailsDataRowVendors entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['mobile'] = entity.mobile;
  data['province'] = entity.province;
  data['city'] = entity.city;
  data['location'] = entity.location;
  data['title'] = entity.title;
  data['body'] = entity.body;
  return data;
}

extension OrderDetailsDataRowVendorsExtension on OrderDetailsDataRowVendors {
  OrderDetailsDataRowVendors copyWith({
    int? id,
    String? name,
    String? mobile,
    String? province,
    String? city,
    String? location,
    String? title,
    String? body,
  }) {
    return OrderDetailsDataRowVendors()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..mobile = mobile ?? this.mobile
      ..province = province ?? this.province
      ..city = city ?? this.city
      ..location = location ?? this.location
      ..title = title ?? this.title
      ..body = body ?? this.body;
  }
}

OrderDetailsDataRowProducts $OrderDetailsDataRowProductsFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowProducts orderDetailsDataRowProducts = OrderDetailsDataRowProducts();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDetailsDataRowProducts.id = id;
  }
  final String? encryptId = jsonConvert.convert<String>(json['encryptId']);
  if (encryptId != null) {
    orderDetailsDataRowProducts.encryptId = encryptId;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    orderDetailsDataRowProducts.image = image;
  }
  final OrderDetailsDataRowProductsMedia? media = jsonConvert.convert<
      OrderDetailsDataRowProductsMedia>(json['media']);
  if (media != null) {
    orderDetailsDataRowProducts.media = media;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    orderDetailsDataRowProducts.title = title;
  }
  final OrderDetailsDataRowProductsVendor? vendor = jsonConvert.convert<
      OrderDetailsDataRowProductsVendor>(json['vendor']);
  if (vendor != null) {
    orderDetailsDataRowProducts.vendor = vendor;
  }
  final OrderDetailsDataRowProductsBrand? brand = jsonConvert.convert<
      OrderDetailsDataRowProductsBrand>(json['brand']);
  if (brand != null) {
    orderDetailsDataRowProducts.brand = brand;
  }
  final String? unitPrice = jsonConvert.convert<String>(json['unitPrice']);
  if (unitPrice != null) {
    orderDetailsDataRowProducts.unitPrice = unitPrice;
  }
  final String? discountValue = jsonConvert.convert<String>(
      json['discountValue']);
  if (discountValue != null) {
    orderDetailsDataRowProducts.discountValue = discountValue;
  }
  final String? qty = jsonConvert.convert<String>(json['qty']);
  if (qty != null) {
    orderDetailsDataRowProducts.qty = qty;
  }
  final String? oldTotalPrice = jsonConvert.convert<String>(
      json['oldTotalPrice']);
  if (oldTotalPrice != null) {
    orderDetailsDataRowProducts.oldTotalPrice = oldTotalPrice;
  }
  final String? totalPrice = jsonConvert.convert<String>(json['totalPrice']);
  if (totalPrice != null) {
    orderDetailsDataRowProducts.totalPrice = totalPrice;
  }
  final String? vendorStatus = jsonConvert.convert<String>(
      json['vendorStatus']);
  if (vendorStatus != null) {
    orderDetailsDataRowProducts.vendorStatus = vendorStatus;
  }
  final String? deliveryStatus = jsonConvert.convert<String>(
      json['deliveryStatus']);
  if (deliveryStatus != null) {
    orderDetailsDataRowProducts.deliveryStatus = deliveryStatus;
  }
  final bool? isDispatched = jsonConvert.convert<bool>(json['isDispatched']);
  if (isDispatched != null) {
    orderDetailsDataRowProducts.isDispatched = isDispatched;
  }
  final bool? isShipped = jsonConvert.convert<bool>(json['isShipped']);
  if (isShipped != null) {
    orderDetailsDataRowProducts.isShipped = isShipped;
  }
  final bool? isDelivered = jsonConvert.convert<bool>(json['isDelivered']);
  if (isDelivered != null) {
    orderDetailsDataRowProducts.isDelivered = isDelivered;
  }
  final List<
      OrderDetailsDataRowProductsSelectedAttributes>? selectedAttributes = (json['selectedAttributes'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          OrderDetailsDataRowProductsSelectedAttributes>(
          e) as OrderDetailsDataRowProductsSelectedAttributes).toList();
  if (selectedAttributes != null) {
    orderDetailsDataRowProducts.selectedAttributes = selectedAttributes;
  }
  return orderDetailsDataRowProducts;
}

Map<String, dynamic> $OrderDetailsDataRowProductsToJson(
    OrderDetailsDataRowProducts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['encryptId'] = entity.encryptId;
  data['image'] = entity.image;
  data['media'] = entity.media?.toJson();
  data['title'] = entity.title;
  data['vendor'] = entity.vendor?.toJson();
  data['brand'] = entity.brand?.toJson();
  data['unitPrice'] = entity.unitPrice;
  data['discountValue'] = entity.discountValue;
  data['qty'] = entity.qty;
  data['oldTotalPrice'] = entity.oldTotalPrice;
  data['totalPrice'] = entity.totalPrice;
  data['vendorStatus'] = entity.vendorStatus;
  data['deliveryStatus'] = entity.deliveryStatus;
  data['isDispatched'] = entity.isDispatched;
  data['isShipped'] = entity.isShipped;
  data['isDelivered'] = entity.isDelivered;
  data['selectedAttributes'] =
      entity.selectedAttributes?.map((v) => v.toJson()).toList();
  return data;
}

extension OrderDetailsDataRowProductsExtension on OrderDetailsDataRowProducts {
  OrderDetailsDataRowProducts copyWith({
    int? id,
    String? encryptId,
    String? image,
    OrderDetailsDataRowProductsMedia? media,
    String? title,
    OrderDetailsDataRowProductsVendor? vendor,
    OrderDetailsDataRowProductsBrand? brand,
    String? unitPrice,
    String? discountValue,
    String? qty,
    String? oldTotalPrice,
    String? totalPrice,
    String? vendorStatus,
    String? deliveryStatus,
    bool? isDispatched,
    bool? isShipped,
    bool? isDelivered,
    List<OrderDetailsDataRowProductsSelectedAttributes>? selectedAttributes,
  }) {
    return OrderDetailsDataRowProducts()
      ..id = id ?? this.id
      ..encryptId = encryptId ?? this.encryptId
      ..image = image ?? this.image
      ..media = media ?? this.media
      ..title = title ?? this.title
      ..vendor = vendor ?? this.vendor
      ..brand = brand ?? this.brand
      ..unitPrice = unitPrice ?? this.unitPrice
      ..discountValue = discountValue ?? this.discountValue
      ..qty = qty ?? this.qty
      ..oldTotalPrice = oldTotalPrice ?? this.oldTotalPrice
      ..totalPrice = totalPrice ?? this.totalPrice
      ..vendorStatus = vendorStatus ?? this.vendorStatus
      ..deliveryStatus = deliveryStatus ?? this.deliveryStatus
      ..isDispatched = isDispatched ?? this.isDispatched
      ..isShipped = isShipped ?? this.isShipped
      ..isDelivered = isDelivered ?? this.isDelivered
      ..selectedAttributes = selectedAttributes ?? this.selectedAttributes;
  }
}

OrderDetailsDataRowProductsMedia $OrderDetailsDataRowProductsMediaFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowProductsMedia orderDetailsDataRowProductsMedia = OrderDetailsDataRowProductsMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    orderDetailsDataRowProductsMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    orderDetailsDataRowProductsMedia.url = url;
  }
  return orderDetailsDataRowProductsMedia;
}

Map<String, dynamic> $OrderDetailsDataRowProductsMediaToJson(
    OrderDetailsDataRowProductsMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension OrderDetailsDataRowProductsMediaExtension on OrderDetailsDataRowProductsMedia {
  OrderDetailsDataRowProductsMedia copyWith({
    String? type,
    String? url,
  }) {
    return OrderDetailsDataRowProductsMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

OrderDetailsDataRowProductsVendor $OrderDetailsDataRowProductsVendorFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowProductsVendor orderDetailsDataRowProductsVendor = OrderDetailsDataRowProductsVendor();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDetailsDataRowProductsVendor.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderDetailsDataRowProductsVendor.name = name;
  }
  return orderDetailsDataRowProductsVendor;
}

Map<String, dynamic> $OrderDetailsDataRowProductsVendorToJson(
    OrderDetailsDataRowProductsVendor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}

extension OrderDetailsDataRowProductsVendorExtension on OrderDetailsDataRowProductsVendor {
  OrderDetailsDataRowProductsVendor copyWith({
    int? id,
    String? name,
  }) {
    return OrderDetailsDataRowProductsVendor()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }
}

OrderDetailsDataRowProductsBrand $OrderDetailsDataRowProductsBrandFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowProductsBrand orderDetailsDataRowProductsBrand = OrderDetailsDataRowProductsBrand();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderDetailsDataRowProductsBrand.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderDetailsDataRowProductsBrand.name = name;
  }
  return orderDetailsDataRowProductsBrand;
}

Map<String, dynamic> $OrderDetailsDataRowProductsBrandToJson(
    OrderDetailsDataRowProductsBrand entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}

extension OrderDetailsDataRowProductsBrandExtension on OrderDetailsDataRowProductsBrand {
  OrderDetailsDataRowProductsBrand copyWith({
    int? id,
    String? name,
  }) {
    return OrderDetailsDataRowProductsBrand()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }
}

OrderDetailsDataRowProductsSelectedAttributes $OrderDetailsDataRowProductsSelectedAttributesFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowProductsSelectedAttributes orderDetailsDataRowProductsSelectedAttributes = OrderDetailsDataRowProductsSelectedAttributes();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderDetailsDataRowProductsSelectedAttributes.name = name;
  }
  final OrderDetailsDataRowProductsSelectedAttributesSelected? selected = jsonConvert
      .convert<OrderDetailsDataRowProductsSelectedAttributesSelected>(
      json['selected']);
  if (selected != null) {
    orderDetailsDataRowProductsSelectedAttributes.selected = selected;
  }
  return orderDetailsDataRowProductsSelectedAttributes;
}

Map<String, dynamic> $OrderDetailsDataRowProductsSelectedAttributesToJson(
    OrderDetailsDataRowProductsSelectedAttributes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['selected'] = entity.selected?.toJson();
  return data;
}

extension OrderDetailsDataRowProductsSelectedAttributesExtension on OrderDetailsDataRowProductsSelectedAttributes {
  OrderDetailsDataRowProductsSelectedAttributes copyWith({
    String? name,
    OrderDetailsDataRowProductsSelectedAttributesSelected? selected,
  }) {
    return OrderDetailsDataRowProductsSelectedAttributes()
      ..name = name ?? this.name
      ..selected = selected ?? this.selected;
  }
}

OrderDetailsDataRowProductsSelectedAttributesSelected $OrderDetailsDataRowProductsSelectedAttributesSelectedFromJson(
    Map<String, dynamic> json) {
  final OrderDetailsDataRowProductsSelectedAttributesSelected orderDetailsDataRowProductsSelectedAttributesSelected = OrderDetailsDataRowProductsSelectedAttributesSelected();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderDetailsDataRowProductsSelectedAttributesSelected.name = name;
  }
  return orderDetailsDataRowProductsSelectedAttributesSelected;
}

Map<String,
    dynamic> $OrderDetailsDataRowProductsSelectedAttributesSelectedToJson(
    OrderDetailsDataRowProductsSelectedAttributesSelected entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  return data;
}

extension OrderDetailsDataRowProductsSelectedAttributesSelectedExtension on OrderDetailsDataRowProductsSelectedAttributesSelected {
  OrderDetailsDataRowProductsSelectedAttributesSelected copyWith({
    String? name,
  }) {
    return OrderDetailsDataRowProductsSelectedAttributesSelected()
      ..name = name ?? this.name;
  }
}