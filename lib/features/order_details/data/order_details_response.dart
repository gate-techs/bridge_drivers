class OrderDetailsResponse {
  OrderDetailsData? data;

  OrderDetailsResponse({this.data});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderDetailsData {
  OrderDetailsRow? row;

  OrderDetailsData({this.row});

  OrderDetailsData.fromJson(Map<String, dynamic> json) {
    row = json['row'] != null ? OrderDetailsRow.fromJson(json['row']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (row != null) {
      data['row'] = row!.toJson();
    }
    return data;
  }
}

class OrderDetailsRow {
  int? id;
  String? encryptId;
  String? invoiceNumber;
  String? name;
  String? email;
  String? mobile;
  String? address;
  List<OrderDetailsCarts>? carts;
  String? dateForHumans;
  String? timestamp;
  String? totalPrice;
  String? cancelled;
  String? paid;
  String? statusId;
  String? statusName;
  bool? loading;

  OrderDetailsRow(
      {this.id,
      this.encryptId,
      this.invoiceNumber,
      this.name,
      this.email,
      this.mobile,
      this.address,
      this.carts,
      this.dateForHumans,
      this.timestamp,
      this.totalPrice,
      this.cancelled,
      this.paid,
      this.statusId,
      this.statusName,
      this.loading});

  OrderDetailsRow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    encryptId = json['encrypt_id'];
    invoiceNumber = json['invoice_number'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    if (json['carts'] != null) {
      carts = <OrderDetailsCarts>[];
      json['carts'].forEach((v) {
        carts!.add(OrderDetailsCarts.fromJson(v));
      });
    }
    dateForHumans = json['dateForHumans'];
    timestamp = json['timestamp'];
    totalPrice = json['total_price'];
    cancelled = json['cancelled'];
    paid = json['paid'];
    statusId = json['status_id'];
    statusName = json['status_name'];
    loading = json['loading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['encrypt_id'] = encryptId;
    data['invoice_number'] = invoiceNumber;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    data['dateForHumans'] = dateForHumans;
    data['timestamp'] = timestamp;
    data['total_price'] = totalPrice;
    data['cancelled'] = cancelled;
    data['paid'] = paid;
    data['status_id'] = statusId;
    data['status_name'] = statusName;
    data['loading'] = loading;
    return data;
  }
}

class OrderDetailsCarts {
  int? id;
  int? productId;
  String? image;
  String? name;
  String? email;
  String? mobile;
  String? title;
  String? qty;
  dynamic discount;
  dynamic shopName;
  String? categoryName;
  String? ownerApproved;
  dynamic oldPrice;
  String? price;
  String? attributes;
  bool? loading;

  OrderDetailsCarts(
      {this.id,
      this.productId,
      this.image,
      this.name,
      this.email,
      this.mobile,
      this.title,
      this.qty,
      this.discount,
      this.shopName,
      this.categoryName,
      this.ownerApproved,
      this.oldPrice,
      this.price,
      this.attributes,
      this.loading});

  OrderDetailsCarts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    title = json['title'];
    qty = json['qty'];
    discount = json['discount'];
    shopName = json['shop_name'];
    categoryName = json['category_name'];
    ownerApproved = json['owner_approved'];
    oldPrice = json['old_price'];
    price = json['price'];
    attributes = json['attributes'];
    loading = json['loading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product'] = productId;
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['title'] = title;
    data['qty'] = qty;
    data['discount'] = discount;
    data['shop_name'] = shopName;
    data['category_name'] = categoryName;
    data['owner_approved'] = ownerApproved;
    data['old_price'] = oldPrice;
    data['price'] = price;
    data['attributes'] = attributes;
    data['loading'] = loading;
    return data;
  }
}
