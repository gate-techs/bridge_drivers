import 'dart:convert';

class ProductDetailsResponse {
  final Data? data;

  ProductDetailsResponse({
    this.data,
  });

  factory ProductDetailsResponse.fromRawJson(String str) => ProductDetailsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) => ProductDetailsResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  final bool? status;
  final String? message;
  final ProductDetailsDataRows? rows;

  Data({
    this.status,
    this.message,
    this.rows,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    message: json["message"],
    rows: json["rows"] == null ? null : ProductDetailsDataRows.fromJson(json["rows"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "rows": rows?.toJson(),
  };
}

class ProductDetailsDataRows {
  final int? id;
  final String? image;
  final List<Galleries>? galleries;
  final int? categoryId;
  final String? categoryName;
  final int? brandId;
  final String? brandName;
  final String? title;
  final String? body;
  final String? discount;
  final int? qty;
  final String? originalPrice;
  final int? price;
  final Attributes? attributes;
  final int? avgRating;
  final List<dynamic>? relatedProduct;
  final List<dynamic>? ratings;
  final bool? isRating;
  final bool? isWishlist;
  final bool? isCart;

  ProductDetailsDataRows({
    this.id,
    this.image,
    this.galleries,
    this.categoryId,
    this.categoryName,
    this.brandId,
    this.brandName,
    this.title,
    this.body,
    this.discount,
    this.qty,
    this.originalPrice,
    this.price,
    this.attributes,
    this.avgRating,
    this.relatedProduct,
    this.ratings,
    this.isRating,
    this.isWishlist,
    this.isCart,
  });

  factory ProductDetailsDataRows.fromRawJson(String str) => ProductDetailsDataRows.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailsDataRows.fromJson(Map<String, dynamic> json) => ProductDetailsDataRows(
    id: json["id"],
    image: json["image"],
    galleries: json["galleries"] == null ? [] : List<Galleries>.from(json["galleries"]!.map((x) => Galleries.fromJson(x))),
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    brandId: json["brand_id"],
    brandName: json["brand_name"],
    title: json["title"],
    body: json["body"],
    discount: json["discount"],
    qty: json["qty"],
    originalPrice: json["original_price"],
    price: json["price"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
    avgRating: json["avgRating"],
    relatedProduct: json["relatedProduct"] == null ? [] : List<dynamic>.from(json["relatedProduct"]!.map((x) => x)),
    ratings: json["ratings"] == null ? [] : List<dynamic>.from(json["ratings"]!.map((x) => x)),
    isRating: json["isRating"],
    isWishlist: json["isWishlist"],
    isCart: json["isCart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "galleries": galleries == null ? [] : List<dynamic>.from(galleries!.map((x) => x.toJson())),
    "category_id": categoryId,
    "category_name": categoryName,
    "brand_id": brandId,
    "brand_name": brandName,
    "title": title,
    "body": body,
    "discount": discount,
    "qty": qty,
    "original_price": originalPrice,
    "price": price,
    "attributes": attributes?.toJson(),
    "avgRating": avgRating,
    "relatedProduct": relatedProduct == null ? [] : List<dynamic>.from(relatedProduct!.map((x) => x)),
    "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
    "isRating": isRating,
    "isWishlist": isWishlist,
    "isCart": isCart,
  };
}

class Attributes {
  final List<Color>? colors;
  final List<Size>? sizes;
  final List<dynamic>? specs;

  Attributes({
    this.colors,
    this.sizes,
    this.specs,
  });

  factory Attributes.fromRawJson(String str) => Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    colors: json["colors"] == null ? [] : List<Color>.from(json["colors"]!.map((x) => Color.fromJson(x))),
    sizes: json["sizes"] == null ? [] : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
    specs: json["specs"] == null ? [] : List<dynamic>.from(json["specs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x.toJson())),
    "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x.toJson())),
    "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
  };
}

class Color {
  final int? id;
  final String? attribute;
  final String? hex;

  Color({
    this.id,
    this.attribute,
    this.hex,
  });

  factory Color.fromRawJson(String str) => Color.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    id: json["id"],
    attribute: json["attribute"],
    hex: json["hex"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attribute": attribute,
    "hex": hex,
  };
}

class Size {
  final int? id;
  final String? attribute;
  final int? countChilds;
  final List<dynamic>? childs;

  Size({
    this.id,
    this.attribute,
    this.countChilds,
    this.childs,
  });

  factory Size.fromRawJson(String str) => Size.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    id: json["id"],
    attribute: json["attribute"],
    countChilds: json["countChilds"],
    childs: json["childs"] == null ? [] : List<dynamic>.from(json["childs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attribute": attribute,
    "countChilds": countChilds,
    "childs": childs == null ? [] : List<dynamic>.from(childs!.map((x) => x)),
  };
}

class Galleries {
  final String? image;

  Galleries({
    this.image,
  });

  factory Galleries.fromRawJson(String str) => Galleries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Galleries.fromJson(Map<String, dynamic> json) => Galleries(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}
