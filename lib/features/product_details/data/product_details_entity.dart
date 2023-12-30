import 'package:kishk_driver/generated/json/base/json_field.dart';
import 'package:kishk_driver/generated/json/product_details_entity.g.dart';
import 'dart:convert';
export 'package:kishk_driver/generated/json/product_details_entity.g.dart';

@JsonSerializable()
class ProductDetailsEntity {
	ProductDetailsData? data;

	ProductDetailsEntity();

	factory ProductDetailsEntity.fromJson(Map<String, dynamic> json) => $ProductDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsData {
	ProductDetailsDataRow? row;

	ProductDetailsData();

	factory ProductDetailsData.fromJson(Map<String, dynamic> json) => $ProductDetailsDataFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRow {
	int? id;
	ProductDetailsDataRowMedia? media;
	List<ProductDetailsDataRowGalleries>? galleries;
	String? title;
	String? body;
	dynamic youtube;
	String? priceType;
	String? oldPrice;
	String? vendorPrice;
	String? price;
	String? qty;
	bool? hasOffer;
	String? offerPercentage;
	String? minQtyPerOrder;
	String? availableQty;
	bool? outOfStock;
	bool? inWishlist;
	bool? inShoppingCart;
	int? productRating;
	ProductDetailsDataRowBrand? brand;
	ProductDetailsDataRowMainCategory? mainCategory;
	ProductDetailsDataRowSubCategory? subCategory;
	ProductDetailsDataRowSub2Category? sub2Category;
	ProductDetailsDataRowVendor? vendor;
	List<ProductDetailsDataRowAttributes>? attributes;
	List<ProductDetailsDataRowAttributesReadOnly>? attributesReadOnly;

	ProductDetailsDataRow();

	factory ProductDetailsDataRow.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowMedia {
	String? type;
	String? url;
	ProductDetailsDataRowMediaResized? resized;

	ProductDetailsDataRowMedia();

	factory ProductDetailsDataRowMedia.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowMediaFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowMediaResized {
	String? type;
	String? url;

	ProductDetailsDataRowMediaResized();

	factory ProductDetailsDataRowMediaResized.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowMediaResizedFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowMediaResizedToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowGalleries {
	ProductDetailsDataRowGalleriesMedia? media;

	ProductDetailsDataRowGalleries();

	factory ProductDetailsDataRowGalleries.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowGalleriesFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowGalleriesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowGalleriesMedia {
	String? type;
	String? url;
	ProductDetailsDataRowGalleriesMediaResized? resized;

	ProductDetailsDataRowGalleriesMedia();

	factory ProductDetailsDataRowGalleriesMedia.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowGalleriesMediaFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowGalleriesMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowGalleriesMediaResized {
	String? type;
	String? url;

	ProductDetailsDataRowGalleriesMediaResized();

	factory ProductDetailsDataRowGalleriesMediaResized.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowGalleriesMediaResizedFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowGalleriesMediaResizedToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowBrand {
	int? id;
	String? name;
	ProductDetailsDataRowBrandMedia? media;

	ProductDetailsDataRowBrand();

	factory ProductDetailsDataRowBrand.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowBrandFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowBrandToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowBrandMedia {
	String? type;
	String? url;
	ProductDetailsDataRowBrandMediaResized? resized;

	ProductDetailsDataRowBrandMedia();

	factory ProductDetailsDataRowBrandMedia.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowBrandMediaFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowBrandMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowBrandMediaResized {
	String? type;
	String? url;

	ProductDetailsDataRowBrandMediaResized();

	factory ProductDetailsDataRowBrandMediaResized.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowBrandMediaResizedFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowBrandMediaResizedToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowMainCategory {
	int? id;
	String? name;

	ProductDetailsDataRowMainCategory();

	factory ProductDetailsDataRowMainCategory.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowMainCategoryFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowMainCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowSubCategory {
	int? id;
	String? name;

	ProductDetailsDataRowSubCategory();

	factory ProductDetailsDataRowSubCategory.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowSubCategoryFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowSubCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowSub2Category {
	int? id;
	String? name;

	ProductDetailsDataRowSub2Category();

	factory ProductDetailsDataRowSub2Category.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowSub2CategoryFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowSub2CategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowVendor {
	bool? isRefundable;
	String? policy;
	String? name;
	String? mobile;
	String? province;
	String? city;
	String? location;
	String? title;
	String? body;

	ProductDetailsDataRowVendor();

	factory ProductDetailsDataRowVendor.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowVendorFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowVendorToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowAttributes {
	int? id;
	String? title;
	List<ProductDetailsDataRowAttributesChilds>? childs;

	ProductDetailsDataRowAttributes();

	factory ProductDetailsDataRowAttributes.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowAttributesFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowAttributesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowAttributesChilds {
	int? id;
	String? title;
	dynamic oldPrice;
	dynamic price;
	dynamic qty;
	dynamic minQtyPerOrder;
	dynamic availableQty;
	bool? outOfStock;

	ProductDetailsDataRowAttributesChilds();

	factory ProductDetailsDataRowAttributesChilds.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowAttributesChildsFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowAttributesChildsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowAttributesReadOnly {
	int? id;
	String? title;
	List<ProductDetailsDataRowAttributesReadOnlyChilds>? childs;

	ProductDetailsDataRowAttributesReadOnly();

	factory ProductDetailsDataRowAttributesReadOnly.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowAttributesReadOnlyFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowAttributesReadOnlyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductDetailsDataRowAttributesReadOnlyChilds {
	int? id;
	String? title;
	dynamic oldPrice;
	dynamic price;
	dynamic qty;
	dynamic minQtyPerOrder;
	dynamic availableQty;
	bool? outOfStock;

	ProductDetailsDataRowAttributesReadOnlyChilds();

	factory ProductDetailsDataRowAttributesReadOnlyChilds.fromJson(Map<String, dynamic> json) => $ProductDetailsDataRowAttributesReadOnlyChildsFromJson(json);

	Map<String, dynamic> toJson() => $ProductDetailsDataRowAttributesReadOnlyChildsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}