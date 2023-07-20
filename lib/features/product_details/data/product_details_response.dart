class ProductDetailsResponse {
  ProductDetailsData? data;

  ProductDetailsResponse({this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ProductDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductDetailsData {
  bool? status;
  String? message;
  ProductDetailsDataRows? rows;

  ProductDetailsData({this.status, this.message, this.rows});

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    rows = json['rows'] != null ? ProductDetailsDataRows.fromJson(json['rows']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (rows != null) {
      data['rows'] = rows!.toJson();
    }
    return data;
  }
}

class ProductDetailsDataRows {
  int? id;
  String? image;
  List<Galleries>? galleries;
  int? categoryId;
  String? categoryName;
  String? title;
  String? body;
  String? discount;
  int? qty;
  String? originalPrice;
  double? price;
  Attributes? attributes;
  int? avgRating;
  // List<Null>? relatedProduct;
  List<Ratings>? ratings;
  bool? isRating;
  bool? isWishlist;
  bool? isCart;

  ProductDetailsDataRows(
      {this.id,
      this.image,
      this.galleries,
      this.categoryId,
      this.categoryName,
      this.title,
      this.body,
      this.discount,
      this.qty,
      this.originalPrice,
      this.price,
      this.attributes,
      this.avgRating,
      // this.relatedProduct,
      this.ratings,
      this.isRating,
      this.isWishlist,
      this.isCart});

  ProductDetailsDataRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    if (json['galleries'] != null) {
      galleries = <Galleries>[];
      json['galleries'].forEach((v) {
        galleries!.add(Galleries.fromJson(v));
      });
    }
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    title = json['title'];
    body = json['body'];
    discount = json['discount'];
    qty = json['qty'];
    originalPrice = json['original_price'];
    price = json['price'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    avgRating = json['avgRating'];
    // if (json['relatedProduct'] != null) {
    //   relatedProduct = <Null>[];
    //   json['relatedProduct'].forEach((v) {
    //     relatedProduct!.add(Null.fromJson(v));
    //   });
    // }
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
    isRating = json['isRating'];
    isWishlist = json['isWishlist'];
    isCart = json['isCart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    if (galleries != null) {
      data['galleries'] = galleries!.map((v) => v.toJson()).toList();
    }
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['title'] = title;
    data['body'] = body;
    data['discount'] = discount;
    data['qty'] = qty;
    data['original_price'] = originalPrice;
    data['price'] = price;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    data['avgRating'] = avgRating;
    // if (relatedProduct != null) {
    //   data['relatedProduct'] = relatedProduct!.map((v) => v.toJson()).toList();
    // }
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['isRating'] = isRating;
    data['isWishlist'] = isWishlist;
    data['isCart'] = isCart;
    return data;
  }
}

class Galleries {
  String? image;

  Galleries({this.image});

  Galleries.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}

class Attributes {
  List<ColorsAttributes>? colors;
  List<Sizes>? sizes;
  List<Brand>? brand;

  Attributes({this.colors, this.sizes, this.brand});

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json['colors'] != null) {
      colors = <ColorsAttributes>[];
      json['colors'].forEach((v) {
        colors!.add(ColorsAttributes.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
    if (json['brand'] != null) {
      brand = <Brand>[];
      json['brand'].forEach((v) {
        brand!.add(Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorsAttributes {
  int? id;
  String? attribute;
  String? hex;

  ColorsAttributes({this.id, this.attribute, this.hex});

  ColorsAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attribute = json['attribute'];
    hex = json['hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attribute'] = attribute;
    data['hex'] = hex;
    return data;
  }
}

class Sizes {
  int? id;
  String? attribute;

  Sizes({this.id, this.attribute});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attribute = json['attribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attribute'] = attribute;
    return data;
  }
}

class Ratings {
  int? id;
  String? avatar;
  String? name;
  int? rating;
  String? review;
  String? dateForHumans;

  Ratings(
      {this.id,
      this.avatar,
      this.name,
      this.rating,
      this.review,
      this.dateForHumans});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    rating = json['rating'];
    review = json['review'];
    dateForHumans = json['dateForHumans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avatar'] = avatar;
    data['name'] = name;
    data['rating'] = rating;
    data['review'] = review;
    data['dateForHumans'] = dateForHumans;
    return data;
  }
}

class Brand {
  int? id;
  String? attribute;

  Brand({this.id, this.attribute});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attribute = json['attribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attribute'] = attribute;
    return data;
  }
}
