import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/order_details_entity.g.dart';

@JsonSerializable()
class OrderDetailsEntity {
	OrderDetailsData? data;

	OrderDetailsEntity();

	factory OrderDetailsEntity.fromJson(Map<String, dynamic> json) => $OrderDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsEntityToJson(this);

	OrderDetailsEntity copyWith({OrderDetailsData? data}) {
		return OrderDetailsEntity()
			..data= data ?? this.data;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsData {
	OrderDetailsDataRow? row;

	OrderDetailsData();

	factory OrderDetailsData.fromJson(Map<String, dynamic> json) => $OrderDetailsDataFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataToJson(this);

	OrderDetailsData copyWith({OrderDetailsDataRow? row}) {
		return OrderDetailsData()
			..row= row ?? this.row;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRow {
	int? id;
	int? shoppingCartId;
	String? encryptId;
	String? orderNo;
	OrderDetailsDataRowUser? user;
	OrderDetailsDataRowDelivery? delivery;
	OrderDetailsDataRowPayment? payment;
	List<OrderDetailsDataRowVendors>? vendors;
	List<OrderDetailsDataRowProducts>? products;
	String? subTotal;
	String? discount;
	String? deliveryFees;
	String? tax;
	String? couponValue;
	String? grandTotal;
	String? userNote;
	String? orderStatus;
	String? orderedDate;
	String? dispatchedDate;
	String? shippedDate;
	String? deliveredDate;

	OrderDetailsDataRow();

	factory OrderDetailsDataRow.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowToJson(this);

	OrderDetailsDataRow copyWith({int? id,int? shoppingCartId, String? encryptId, String? orderNo, OrderDetailsDataRowUser? user, OrderDetailsDataRowDelivery? delivery, OrderDetailsDataRowPayment? payment, List<OrderDetailsDataRowVendors>? vendors, List<OrderDetailsDataRowProducts>? products, String? subTotal, String? discount, String? deliveryFees, String? tax, String? couponValue, String? grandTotal, dynamic userNote, String? orderStatus, String? orderedDate, String? dispatchedDate, String? shippedDate, String? deliveredDate}) {
		return OrderDetailsDataRow()
			..id= id ?? this.id
			..shoppingCartId= shoppingCartId ?? this.shoppingCartId
			..encryptId= encryptId ?? this.encryptId
			..orderNo= orderNo ?? this.orderNo
			..user= user ?? this.user
			..delivery= delivery ?? this.delivery
			..payment= payment ?? this.payment
			..vendors= vendors ?? this.vendors
			..products= products ?? this.products
			..subTotal= subTotal ?? this.subTotal
			..discount= discount ?? this.discount
			..deliveryFees= deliveryFees ?? this.deliveryFees
			..tax= tax ?? this.tax
			..couponValue= couponValue ?? this.couponValue
			..grandTotal= grandTotal ?? this.grandTotal
			..userNote= userNote ?? this.userNote
			..orderStatus= orderStatus ?? this.orderStatus
			..orderedDate= orderedDate ?? this.orderedDate
			..dispatchedDate= dispatchedDate ?? this.dispatchedDate
			..shippedDate= shippedDate ?? this.shippedDate
			..deliveredDate= deliveredDate ?? this.deliveredDate;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowUser {
	String? image;
	String? name;
	String? mobile;
	String? province;
	String? city;
	String? address;

	OrderDetailsDataRowUser();

	factory OrderDetailsDataRowUser.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowUserFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowUserToJson(this);

	OrderDetailsDataRowUser copyWith({String? image, String? name, String? mobile, String? province, String? city, String? address}) {
		return OrderDetailsDataRowUser()
			..image= image ?? this.image
			..name= name ?? this.name
			..mobile= mobile ?? this.mobile
			..province= province ?? this.province
			..city= city ?? this.city
			..address= address ?? this.address;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowDelivery {
	String? id;
	String? name;
	String? mobile;

	OrderDetailsDataRowDelivery();

	factory OrderDetailsDataRowDelivery.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowDeliveryFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowDeliveryToJson(this);

	OrderDetailsDataRowDelivery copyWith({String? id,String? name,String? mobile}) {
		return OrderDetailsDataRowDelivery()
			..id= name ?? this.id
			..name= name ?? this.name
			..mobile= name ?? this.mobile;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowPayment {
	String? paymentMethod;
	String? paymentId;
	String? paymentTransactionId;
	String? paymentOrderId;
	String? paymentStatus;
	String? paymentTime;

	OrderDetailsDataRowPayment();

	factory OrderDetailsDataRowPayment.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowPaymentFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowPaymentToJson(this);

	OrderDetailsDataRowPayment copyWith({String? paymentMethod, String? paymentId, String? paymentTransactionId, String? paymentOrderId, String? paymentStatus, String? paymentTime}) {
		return OrderDetailsDataRowPayment()
			..paymentMethod= paymentMethod ?? this.paymentMethod
			..paymentId= paymentId ?? this.paymentId
			..paymentTransactionId= paymentTransactionId ?? this.paymentTransactionId
			..paymentOrderId= paymentOrderId ?? this.paymentOrderId
			..paymentStatus= paymentStatus ?? this.paymentStatus
			..paymentTime= paymentTime ?? this.paymentTime;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowVendors {
	int? id;
	String? name;
	String? mobile;
	String? province;
	String? city;
	String? location;
	String? title;
	String? body;

	OrderDetailsDataRowVendors();

	factory OrderDetailsDataRowVendors.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowVendorsFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowVendorsToJson(this);

	OrderDetailsDataRowVendors copyWith({int? id, String? name, String? mobile, String? province, String? city, String? location, String? title, String? body}) {
		return OrderDetailsDataRowVendors()
			..id= id ?? this.id
			..name= name ?? this.name
			..mobile= mobile ?? this.mobile
			..province= province ?? this.province
			..city= city ?? this.city
			..location= location ?? this.location
			..title= title ?? this.title
			..body= body ?? this.body;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowProducts {
	int? id;
	int? shoppingCartId;
	String? encryptId;
	String? image;
	OrderDetailsDataRowProductsMedia? media;
	String? title;
	OrderDetailsDataRowProductsVendor? vendor;
	OrderDetailsDataRowProductsBrand? brand;
	String? unitPrice;
	String? discountValue;
	String? qty;
	String? oldTotalPrice;
	String? totalPrice;
	String? vendorStatus;
	String? deliveryStatus;
	bool? isDispatched;
	bool? isShipped;
	bool? isDelivered;
	List<OrderDetailsDataRowProductsSelectedAttributes>? selectedAttributes;

	OrderDetailsDataRowProducts();

	factory OrderDetailsDataRowProducts.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowProductsFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowProductsToJson(this);

	OrderDetailsDataRowProducts copyWith({int? id,int? shoppingCartId, String? encryptId, String? image, OrderDetailsDataRowProductsMedia? media, String? title, OrderDetailsDataRowProductsVendor? vendor, OrderDetailsDataRowProductsBrand? brand, String? unitPrice, String? discountValue, String? qty, String? oldTotalPrice, String? totalPrice, String? vendorStatus, String? deliveryStatus, bool? isDispatched, bool? isShipped, bool? isDelivered, List<OrderDetailsDataRowProductsSelectedAttributes>? selectedAttributes}) {
		return OrderDetailsDataRowProducts()
			..id= id ?? this.id
			..shoppingCartId= shoppingCartId ?? this.shoppingCartId
			..encryptId= encryptId ?? this.encryptId
			..image= image ?? this.image
			..media= media ?? this.media
			..title= title ?? this.title
			..vendor= vendor ?? this.vendor
			..brand= brand ?? this.brand
			..unitPrice= unitPrice ?? this.unitPrice
			..discountValue= discountValue ?? this.discountValue
			..qty= qty ?? this.qty
			..oldTotalPrice= oldTotalPrice ?? this.oldTotalPrice
			..totalPrice= totalPrice ?? this.totalPrice
			..vendorStatus= vendorStatus ?? this.vendorStatus
			..deliveryStatus= deliveryStatus ?? this.deliveryStatus
			..isDispatched= isDispatched ?? this.isDispatched
			..isShipped= isShipped ?? this.isShipped
			..isDelivered= isDelivered ?? this.isDelivered
			..selectedAttributes= selectedAttributes ?? this.selectedAttributes;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowProductsMedia {
	String? type;
	String? url;

	OrderDetailsDataRowProductsMedia();

	factory OrderDetailsDataRowProductsMedia.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowProductsMediaFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowProductsMediaToJson(this);

	OrderDetailsDataRowProductsMedia copyWith({String? type, String? url}) {
		return OrderDetailsDataRowProductsMedia()
			..type= type ?? this.type
			..url= url ?? this.url;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowProductsVendor {
	int? id;
	String? name;
	String? mobile;
	String? province;
	String? city;
	String? location;
	String? title;
	String? body;
	OrderDetailsDataRowProductsVendor();

	factory OrderDetailsDataRowProductsVendor.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowProductsVendorFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowProductsVendorToJson(this);

	OrderDetailsDataRowProductsVendor copyWith({int? id, String? name,	String? mobile,
	String? province,
	String? city,
	String? location,
	String? title,
	String? body}) {
		return OrderDetailsDataRowProductsVendor()
			..id= id ?? this.id
			..name= name ?? this.name
		..mobile = mobile ?? this.mobile
		..province = province ?? this.province
		..city = city ?? this.city
		..location = location ?? this.location
		..title = title ?? this.title
		..body = body ?? this.body;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowProductsBrand {
	int? id;
	String? name;

	OrderDetailsDataRowProductsBrand();

	factory OrderDetailsDataRowProductsBrand.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowProductsBrandFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowProductsBrandToJson(this);

	OrderDetailsDataRowProductsBrand copyWith({int? id, String? name}) {
		return OrderDetailsDataRowProductsBrand()
			..id= id ?? this.id
			..name= name ?? this.name;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowProductsSelectedAttributes {
	String? name;
	OrderDetailsDataRowProductsSelectedAttributesSelected? selected;

	OrderDetailsDataRowProductsSelectedAttributes();

	factory OrderDetailsDataRowProductsSelectedAttributes.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowProductsSelectedAttributesFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowProductsSelectedAttributesToJson(this);

	OrderDetailsDataRowProductsSelectedAttributes copyWith({String? name, OrderDetailsDataRowProductsSelectedAttributesSelected? selected}) {
		return OrderDetailsDataRowProductsSelectedAttributes()
			..name= name ?? this.name
			..selected= selected ?? this.selected;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderDetailsDataRowProductsSelectedAttributesSelected {
	String? name;

	OrderDetailsDataRowProductsSelectedAttributesSelected();

	factory OrderDetailsDataRowProductsSelectedAttributesSelected.fromJson(Map<String, dynamic> json) => $OrderDetailsDataRowProductsSelectedAttributesSelectedFromJson(json);

	Map<String, dynamic> toJson() => $OrderDetailsDataRowProductsSelectedAttributesSelectedToJson(this);

	OrderDetailsDataRowProductsSelectedAttributesSelected copyWith({String? name}) {
		return OrderDetailsDataRowProductsSelectedAttributesSelected()
			..name= name ?? this.name;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}