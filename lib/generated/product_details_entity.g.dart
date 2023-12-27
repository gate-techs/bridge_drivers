
import '../features/product_details/data/product_details_entity.dart';
import 'json/base/json_convert_content.dart';

ProductDetailsEntity $ProductDetailsEntityFromJson(Map<String, dynamic> json) {
  final ProductDetailsEntity productDetailsEntity = ProductDetailsEntity();
  final ProductDetailsData? data = jsonConvert.convert<ProductDetailsData>(
      json['data']);
  if (data != null) {
    productDetailsEntity.data = data;
  }
  return productDetailsEntity;
}

Map<String, dynamic> $ProductDetailsEntityToJson(ProductDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension ProductDetailsEntityExtension on ProductDetailsEntity {
  ProductDetailsEntity copyWith({
    ProductDetailsData? data,
  }) {
    return ProductDetailsEntity()
      ..data = data ?? this.data;
  }
}

ProductDetailsData $ProductDetailsDataFromJson(Map<String, dynamic> json) {
  final ProductDetailsData productDetailsData = ProductDetailsData();
  final ProductDetailsDataRow? row = jsonConvert.convert<ProductDetailsDataRow>(
      json['row']);
  if (row != null) {
    productDetailsData.row = row;
  }
  return productDetailsData;
}

Map<String, dynamic> $ProductDetailsDataToJson(ProductDetailsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['row'] = entity.row?.toJson();
  return data;
}

extension ProductDetailsDataExtension on ProductDetailsData {
  ProductDetailsData copyWith({
    ProductDetailsDataRow? row,
  }) {
    return ProductDetailsData()
      ..row = row ?? this.row;
  }
}

ProductDetailsDataRow $ProductDetailsDataRowFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRow productDetailsDataRow = ProductDetailsDataRow();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRow.id = id;
  }
  final ProductDetailsDataRowMedia? media = jsonConvert.convert<
      ProductDetailsDataRowMedia>(json['media']);
  if (media != null) {
    productDetailsDataRow.media = media;
  }
  final List<
      ProductDetailsDataRowGalleries>? galleries = (json['galleries'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ProductDetailsDataRowGalleries>(
          e) as ProductDetailsDataRowGalleries).toList();
  if (galleries != null) {
    productDetailsDataRow.galleries = galleries;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productDetailsDataRow.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    productDetailsDataRow.body = body;
  }
  final String? youtube = jsonConvert.convert<String>(json['youtube']);
  if (youtube != null) {
    productDetailsDataRow.youtube = youtube;
  }
  final String? priceType = jsonConvert.convert<String>(json['priceType']);
  if (priceType != null) {
    productDetailsDataRow.priceType = priceType;
  }
  final String? oldPrice = jsonConvert.convert<String>(json['oldPrice']);
  if (oldPrice != null) {
    productDetailsDataRow.oldPrice = oldPrice;
  }
  final String? vendorPrice = jsonConvert.convert<String>(json['vendorPrice']);
  if (vendorPrice != null) {
    productDetailsDataRow.vendorPrice = vendorPrice;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    productDetailsDataRow.price = price;
  }
  final String? qty = jsonConvert.convert<String>(json['qty']);
  if (qty != null) {
    productDetailsDataRow.qty = qty;
  }
  final bool? hasOffer = jsonConvert.convert<bool>(json['hasOffer']);
  if (hasOffer != null) {
    productDetailsDataRow.hasOffer = hasOffer;
  }
  final String? offerPercentage = jsonConvert.convert<String>(
      json['offerPercentage']);
  if (offerPercentage != null) {
    productDetailsDataRow.offerPercentage = offerPercentage;
  }
  final String? minQtyPerOrder = jsonConvert.convert<String>(
      json['minQtyPerOrder']);
  if (minQtyPerOrder != null) {
    productDetailsDataRow.minQtyPerOrder = minQtyPerOrder;
  }
  final String? availableQty = jsonConvert.convert<String>(
      json['availableQty']);
  if (availableQty != null) {
    productDetailsDataRow.availableQty = availableQty;
  }
  final bool? outOfStock = jsonConvert.convert<bool>(json['outOfStock']);
  if (outOfStock != null) {
    productDetailsDataRow.outOfStock = outOfStock;
  }
  final bool? inWishlist = jsonConvert.convert<bool>(json['inWishlist']);
  if (inWishlist != null) {
    productDetailsDataRow.inWishlist = inWishlist;
  }
  final bool? inShoppingCart = jsonConvert.convert<bool>(
      json['inShoppingCart']);
  if (inShoppingCart != null) {
    productDetailsDataRow.inShoppingCart = inShoppingCart;
  }
  final int? productRating = jsonConvert.convert<int>(json['productRating']);
  if (productRating != null) {
    productDetailsDataRow.productRating = productRating;
  }
  final ProductDetailsDataRowBrand? brand = jsonConvert.convert<
      ProductDetailsDataRowBrand>(json['brand']);
  if (brand != null) {
    productDetailsDataRow.brand = brand;
  }
  final ProductDetailsDataRowMainCategory? mainCategory = jsonConvert.convert<
      ProductDetailsDataRowMainCategory>(json['mainCategory']);
  if (mainCategory != null) {
    productDetailsDataRow.mainCategory = mainCategory;
  }
  final ProductDetailsDataRowSubCategory? subCategory = jsonConvert.convert<
      ProductDetailsDataRowSubCategory>(json['subCategory']);
  if (subCategory != null) {
    productDetailsDataRow.subCategory = subCategory;
  }
  final ProductDetailsDataRowSub2Category? sub2Category = jsonConvert.convert<
      ProductDetailsDataRowSub2Category>(json['sub2Category']);
  if (sub2Category != null) {
    productDetailsDataRow.sub2Category = sub2Category;
  }
  final ProductDetailsDataRowVendor? vendor = jsonConvert.convert<
      ProductDetailsDataRowVendor>(json['vendor']);
  if (vendor != null) {
    productDetailsDataRow.vendor = vendor;
  }
  final List<
      ProductDetailsDataRowAttributes>? attributes = (json['attributes'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ProductDetailsDataRowAttributes>(
          e) as ProductDetailsDataRowAttributes).toList();
  if (attributes != null) {
    productDetailsDataRow.attributes = attributes;
  }
  final List<
      ProductDetailsDataRowAttributesReadOnly>? attributesReadOnly = (json['attributesReadOnly'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ProductDetailsDataRowAttributesReadOnly>(
          e) as ProductDetailsDataRowAttributesReadOnly).toList();
  if (attributesReadOnly != null) {
    productDetailsDataRow.attributesReadOnly = attributesReadOnly;
  }
  return productDetailsDataRow;
}

Map<String, dynamic> $ProductDetailsDataRowToJson(
    ProductDetailsDataRow entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['media'] = entity.media?.toJson();
  data['galleries'] = entity.galleries?.map((v) => v.toJson()).toList();
  data['title'] = entity.title;
  data['body'] = entity.body;
  data['youtube'] = entity.youtube;
  data['priceType'] = entity.priceType;
  data['oldPrice'] = entity.oldPrice;
  data['vendorPrice'] = entity.vendorPrice;
  data['price'] = entity.price;
  data['qty'] = entity.qty;
  data['hasOffer'] = entity.hasOffer;
  data['offerPercentage'] = entity.offerPercentage;
  data['minQtyPerOrder'] = entity.minQtyPerOrder;
  data['availableQty'] = entity.availableQty;
  data['outOfStock'] = entity.outOfStock;
  data['inWishlist'] = entity.inWishlist;
  data['inShoppingCart'] = entity.inShoppingCart;
  data['productRating'] = entity.productRating;
  data['brand'] = entity.brand?.toJson();
  data['mainCategory'] = entity.mainCategory?.toJson();
  data['subCategory'] = entity.subCategory?.toJson();
  data['sub2Category'] = entity.sub2Category?.toJson();
  data['vendor'] = entity.vendor?.toJson();
  data['attributes'] = entity.attributes?.map((v) => v.toJson()).toList();
  data['attributesReadOnly'] =
      entity.attributesReadOnly?.map((v) => v.toJson()).toList();
  return data;
}

extension ProductDetailsDataRowExtension on ProductDetailsDataRow {
  ProductDetailsDataRow copyWith({
    int? id,
    ProductDetailsDataRowMedia? media,
    List<ProductDetailsDataRowGalleries>? galleries,
    String? title,
    String? body,
    String? youtube,
    String? priceType,
    String? oldPrice,
    String? vendorPrice,
    String? price,
    String? qty,
    bool? hasOffer,
    String? offerPercentage,
    String? minQtyPerOrder,
    String? availableQty,
    bool? outOfStock,
    bool? inWishlist,
    bool? inShoppingCart,
    int? productRating,
    ProductDetailsDataRowBrand? brand,
    ProductDetailsDataRowMainCategory? mainCategory,
    ProductDetailsDataRowSubCategory? subCategory,
    ProductDetailsDataRowSub2Category? sub2Category,
    ProductDetailsDataRowVendor? vendor,
    List<ProductDetailsDataRowAttributes>? attributes,
    List<ProductDetailsDataRowAttributesReadOnly>? attributesReadOnly,
  }) {
    return ProductDetailsDataRow()
      ..id = id ?? this.id
      ..media = media ?? this.media
      ..galleries = galleries ?? this.galleries
      ..title = title ?? this.title
      ..body = body ?? this.body
      ..youtube = youtube ?? this.youtube
      ..priceType = priceType ?? this.priceType
      ..oldPrice = oldPrice ?? this.oldPrice
      ..vendorPrice = vendorPrice ?? this.vendorPrice
      ..price = price ?? this.price
      ..qty = qty ?? this.qty
      ..hasOffer = hasOffer ?? this.hasOffer
      ..offerPercentage = offerPercentage ?? this.offerPercentage
      ..minQtyPerOrder = minQtyPerOrder ?? this.minQtyPerOrder
      ..availableQty = availableQty ?? this.availableQty
      ..outOfStock = outOfStock ?? this.outOfStock
      ..inWishlist = inWishlist ?? this.inWishlist
      ..inShoppingCart = inShoppingCart ?? this.inShoppingCart
      ..productRating = productRating ?? this.productRating
      ..brand = brand ?? this.brand
      ..mainCategory = mainCategory ?? this.mainCategory
      ..subCategory = subCategory ?? this.subCategory
      ..sub2Category = sub2Category ?? this.sub2Category
      ..vendor = vendor ?? this.vendor
      ..attributes = attributes ?? this.attributes
      ..attributesReadOnly = attributesReadOnly ?? this.attributesReadOnly;
  }
}

ProductDetailsDataRowMedia $ProductDetailsDataRowMediaFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowMedia productDetailsDataRowMedia = ProductDetailsDataRowMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    productDetailsDataRowMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    productDetailsDataRowMedia.url = url;
  }
  final ProductDetailsDataRowMediaResized? resized = jsonConvert.convert<
      ProductDetailsDataRowMediaResized>(json['resized']);
  if (resized != null) {
    productDetailsDataRowMedia.resized = resized;
  }
  return productDetailsDataRowMedia;
}

Map<String, dynamic> $ProductDetailsDataRowMediaToJson(
    ProductDetailsDataRowMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  data['resized'] = entity.resized?.toJson();
  return data;
}

extension ProductDetailsDataRowMediaExtension on ProductDetailsDataRowMedia {
  ProductDetailsDataRowMedia copyWith({
    String? type,
    String? url,
    ProductDetailsDataRowMediaResized? resized,
  }) {
    return ProductDetailsDataRowMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url
      ..resized = resized ?? this.resized;
  }
}

ProductDetailsDataRowMediaResized $ProductDetailsDataRowMediaResizedFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowMediaResized productDetailsDataRowMediaResized = ProductDetailsDataRowMediaResized();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    productDetailsDataRowMediaResized.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    productDetailsDataRowMediaResized.url = url;
  }
  return productDetailsDataRowMediaResized;
}

Map<String, dynamic> $ProductDetailsDataRowMediaResizedToJson(
    ProductDetailsDataRowMediaResized entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension ProductDetailsDataRowMediaResizedExtension on ProductDetailsDataRowMediaResized {
  ProductDetailsDataRowMediaResized copyWith({
    String? type,
    String? url,
  }) {
    return ProductDetailsDataRowMediaResized()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

ProductDetailsDataRowGalleries $ProductDetailsDataRowGalleriesFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowGalleries productDetailsDataRowGalleries = ProductDetailsDataRowGalleries();
  final ProductDetailsDataRowGalleriesMedia? media = jsonConvert.convert<
      ProductDetailsDataRowGalleriesMedia>(json['media']);
  if (media != null) {
    productDetailsDataRowGalleries.media = media;
  }
  return productDetailsDataRowGalleries;
}

Map<String, dynamic> $ProductDetailsDataRowGalleriesToJson(
    ProductDetailsDataRowGalleries entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['media'] = entity.media?.toJson();
  return data;
}

extension ProductDetailsDataRowGalleriesExtension on ProductDetailsDataRowGalleries {
  ProductDetailsDataRowGalleries copyWith({
    ProductDetailsDataRowGalleriesMedia? media,
  }) {
    return ProductDetailsDataRowGalleries()
      ..media = media ?? this.media;
  }
}

ProductDetailsDataRowGalleriesMedia $ProductDetailsDataRowGalleriesMediaFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowGalleriesMedia productDetailsDataRowGalleriesMedia = ProductDetailsDataRowGalleriesMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    productDetailsDataRowGalleriesMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    productDetailsDataRowGalleriesMedia.url = url;
  }
  final ProductDetailsDataRowGalleriesMediaResized? resized = jsonConvert
      .convert<ProductDetailsDataRowGalleriesMediaResized>(json['resized']);
  if (resized != null) {
    productDetailsDataRowGalleriesMedia.resized = resized;
  }
  return productDetailsDataRowGalleriesMedia;
}

Map<String, dynamic> $ProductDetailsDataRowGalleriesMediaToJson(
    ProductDetailsDataRowGalleriesMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  data['resized'] = entity.resized?.toJson();
  return data;
}

extension ProductDetailsDataRowGalleriesMediaExtension on ProductDetailsDataRowGalleriesMedia {
  ProductDetailsDataRowGalleriesMedia copyWith({
    String? type,
    String? url,
    ProductDetailsDataRowGalleriesMediaResized? resized,
  }) {
    return ProductDetailsDataRowGalleriesMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url
      ..resized = resized ?? this.resized;
  }
}

ProductDetailsDataRowGalleriesMediaResized $ProductDetailsDataRowGalleriesMediaResizedFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowGalleriesMediaResized productDetailsDataRowGalleriesMediaResized = ProductDetailsDataRowGalleriesMediaResized();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    productDetailsDataRowGalleriesMediaResized.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    productDetailsDataRowGalleriesMediaResized.url = url;
  }
  return productDetailsDataRowGalleriesMediaResized;
}

Map<String, dynamic> $ProductDetailsDataRowGalleriesMediaResizedToJson(
    ProductDetailsDataRowGalleriesMediaResized entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension ProductDetailsDataRowGalleriesMediaResizedExtension on ProductDetailsDataRowGalleriesMediaResized {
  ProductDetailsDataRowGalleriesMediaResized copyWith({
    String? type,
    String? url,
  }) {
    return ProductDetailsDataRowGalleriesMediaResized()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

ProductDetailsDataRowBrand $ProductDetailsDataRowBrandFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowBrand productDetailsDataRowBrand = ProductDetailsDataRowBrand();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRowBrand.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    productDetailsDataRowBrand.name = name;
  }
  final ProductDetailsDataRowBrandMedia? media = jsonConvert.convert<
      ProductDetailsDataRowBrandMedia>(json['media']);
  if (media != null) {
    productDetailsDataRowBrand.media = media;
  }
  return productDetailsDataRowBrand;
}

Map<String, dynamic> $ProductDetailsDataRowBrandToJson(
    ProductDetailsDataRowBrand entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['media'] = entity.media?.toJson();
  return data;
}

extension ProductDetailsDataRowBrandExtension on ProductDetailsDataRowBrand {
  ProductDetailsDataRowBrand copyWith({
    int? id,
    String? name,
    ProductDetailsDataRowBrandMedia? media,
  }) {
    return ProductDetailsDataRowBrand()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..media = media ?? this.media;
  }
}

ProductDetailsDataRowBrandMedia $ProductDetailsDataRowBrandMediaFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowBrandMedia productDetailsDataRowBrandMedia = ProductDetailsDataRowBrandMedia();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    productDetailsDataRowBrandMedia.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    productDetailsDataRowBrandMedia.url = url;
  }
  final ProductDetailsDataRowBrandMediaResized? resized = jsonConvert.convert<
      ProductDetailsDataRowBrandMediaResized>(json['resized']);
  if (resized != null) {
    productDetailsDataRowBrandMedia.resized = resized;
  }
  return productDetailsDataRowBrandMedia;
}

Map<String, dynamic> $ProductDetailsDataRowBrandMediaToJson(
    ProductDetailsDataRowBrandMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  data['resized'] = entity.resized?.toJson();
  return data;
}

extension ProductDetailsDataRowBrandMediaExtension on ProductDetailsDataRowBrandMedia {
  ProductDetailsDataRowBrandMedia copyWith({
    String? type,
    String? url,
    ProductDetailsDataRowBrandMediaResized? resized,
  }) {
    return ProductDetailsDataRowBrandMedia()
      ..type = type ?? this.type
      ..url = url ?? this.url
      ..resized = resized ?? this.resized;
  }
}

ProductDetailsDataRowBrandMediaResized $ProductDetailsDataRowBrandMediaResizedFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowBrandMediaResized productDetailsDataRowBrandMediaResized = ProductDetailsDataRowBrandMediaResized();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    productDetailsDataRowBrandMediaResized.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    productDetailsDataRowBrandMediaResized.url = url;
  }
  return productDetailsDataRowBrandMediaResized;
}

Map<String, dynamic> $ProductDetailsDataRowBrandMediaResizedToJson(
    ProductDetailsDataRowBrandMediaResized entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension ProductDetailsDataRowBrandMediaResizedExtension on ProductDetailsDataRowBrandMediaResized {
  ProductDetailsDataRowBrandMediaResized copyWith({
    String? type,
    String? url,
  }) {
    return ProductDetailsDataRowBrandMediaResized()
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}

ProductDetailsDataRowMainCategory $ProductDetailsDataRowMainCategoryFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowMainCategory productDetailsDataRowMainCategory = ProductDetailsDataRowMainCategory();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRowMainCategory.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    productDetailsDataRowMainCategory.name = name;
  }
  return productDetailsDataRowMainCategory;
}

Map<String, dynamic> $ProductDetailsDataRowMainCategoryToJson(
    ProductDetailsDataRowMainCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}

extension ProductDetailsDataRowMainCategoryExtension on ProductDetailsDataRowMainCategory {
  ProductDetailsDataRowMainCategory copyWith({
    int? id,
    String? name,
  }) {
    return ProductDetailsDataRowMainCategory()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }
}

ProductDetailsDataRowSubCategory $ProductDetailsDataRowSubCategoryFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowSubCategory productDetailsDataRowSubCategory = ProductDetailsDataRowSubCategory();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRowSubCategory.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    productDetailsDataRowSubCategory.name = name;
  }
  return productDetailsDataRowSubCategory;
}

Map<String, dynamic> $ProductDetailsDataRowSubCategoryToJson(
    ProductDetailsDataRowSubCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}

extension ProductDetailsDataRowSubCategoryExtension on ProductDetailsDataRowSubCategory {
  ProductDetailsDataRowSubCategory copyWith({
    int? id,
    String? name,
  }) {
    return ProductDetailsDataRowSubCategory()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }
}

ProductDetailsDataRowSub2Category $ProductDetailsDataRowSub2CategoryFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowSub2Category productDetailsDataRowSub2Category = ProductDetailsDataRowSub2Category();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRowSub2Category.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    productDetailsDataRowSub2Category.name = name;
  }
  return productDetailsDataRowSub2Category;
}

Map<String, dynamic> $ProductDetailsDataRowSub2CategoryToJson(
    ProductDetailsDataRowSub2Category entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}

extension ProductDetailsDataRowSub2CategoryExtension on ProductDetailsDataRowSub2Category {
  ProductDetailsDataRowSub2Category copyWith({
    int? id,
    String? name,
  }) {
    return ProductDetailsDataRowSub2Category()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }
}

ProductDetailsDataRowVendor $ProductDetailsDataRowVendorFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowVendor productDetailsDataRowVendor = ProductDetailsDataRowVendor();
  final bool? isRefundable = jsonConvert.convert<bool>(json['isRefundable']);
  if (isRefundable != null) {
    productDetailsDataRowVendor.isRefundable = isRefundable;
  }
  final String? policy = jsonConvert.convert<String>(json['policy']);
  if (policy != null) {
    productDetailsDataRowVendor.policy = policy;
  }
  return productDetailsDataRowVendor;
}

Map<String, dynamic> $ProductDetailsDataRowVendorToJson(
    ProductDetailsDataRowVendor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isRefundable'] = entity.isRefundable;
  data['policy'] = entity.policy;
  return data;
}

extension ProductDetailsDataRowVendorExtension on ProductDetailsDataRowVendor {
  ProductDetailsDataRowVendor copyWith({
    bool? isRefundable,
    String? policy,
  }) {
    return ProductDetailsDataRowVendor()
      ..isRefundable = isRefundable ?? this.isRefundable
      ..policy = policy ?? this.policy;
  }
}

ProductDetailsDataRowAttributes $ProductDetailsDataRowAttributesFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowAttributes productDetailsDataRowAttributes = ProductDetailsDataRowAttributes();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRowAttributes.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productDetailsDataRowAttributes.title = title;
  }
  final List<
      ProductDetailsDataRowAttributesChilds>? childs = (json['childs'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ProductDetailsDataRowAttributesChilds>(
          e) as ProductDetailsDataRowAttributesChilds).toList();
  if (childs != null) {
    productDetailsDataRowAttributes.childs = childs;
  }
  return productDetailsDataRowAttributes;
}

Map<String, dynamic> $ProductDetailsDataRowAttributesToJson(
    ProductDetailsDataRowAttributes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['childs'] = entity.childs?.map((v) => v.toJson()).toList();
  return data;
}

extension ProductDetailsDataRowAttributesExtension on ProductDetailsDataRowAttributes {
  ProductDetailsDataRowAttributes copyWith({
    int? id,
    String? title,
    List<ProductDetailsDataRowAttributesChilds>? childs,
  }) {
    return ProductDetailsDataRowAttributes()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..childs = childs ?? this.childs;
  }
}

ProductDetailsDataRowAttributesChilds $ProductDetailsDataRowAttributesChildsFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowAttributesChilds productDetailsDataRowAttributesChilds = ProductDetailsDataRowAttributesChilds();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRowAttributesChilds.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productDetailsDataRowAttributesChilds.title = title;
  }
  final String? oldPrice = jsonConvert.convert<String>(json['oldPrice']);
  if (oldPrice != null) {
    productDetailsDataRowAttributesChilds.oldPrice = oldPrice;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    productDetailsDataRowAttributesChilds.price = price;
  }
  final String? qty = jsonConvert.convert<String>(json['qty']);
  if (qty != null) {
    productDetailsDataRowAttributesChilds.qty = qty;
  }
  final String? minQtyPerOrder = jsonConvert.convert<String>(
      json['minQtyPerOrder']);
  if (minQtyPerOrder != null) {
    productDetailsDataRowAttributesChilds.minQtyPerOrder = minQtyPerOrder;
  }
  final String? availableQty = jsonConvert.convert<String>(
      json['availableQty']);
  if (availableQty != null) {
    productDetailsDataRowAttributesChilds.availableQty = availableQty;
  }
  final bool? outOfStock = jsonConvert.convert<bool>(json['outOfStock']);
  if (outOfStock != null) {
    productDetailsDataRowAttributesChilds.outOfStock = outOfStock;
  }
  return productDetailsDataRowAttributesChilds;
}

Map<String, dynamic> $ProductDetailsDataRowAttributesChildsToJson(
    ProductDetailsDataRowAttributesChilds entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['oldPrice'] = entity.oldPrice;
  data['price'] = entity.price;
  data['qty'] = entity.qty;
  data['minQtyPerOrder'] = entity.minQtyPerOrder;
  data['availableQty'] = entity.availableQty;
  data['outOfStock'] = entity.outOfStock;
  return data;
}

extension ProductDetailsDataRowAttributesChildsExtension on ProductDetailsDataRowAttributesChilds {
  ProductDetailsDataRowAttributesChilds copyWith({
    int? id,
    String? title,
    String? oldPrice,
    String? price,
    String? qty,
    String? minQtyPerOrder,
    String? availableQty,
    bool? outOfStock,
  }) {
    return ProductDetailsDataRowAttributesChilds()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..oldPrice = oldPrice ?? this.oldPrice
      ..price = price ?? this.price
      ..qty = qty ?? this.qty
      ..minQtyPerOrder = minQtyPerOrder ?? this.minQtyPerOrder
      ..availableQty = availableQty ?? this.availableQty
      ..outOfStock = outOfStock ?? this.outOfStock;
  }
}

ProductDetailsDataRowAttributesReadOnly $ProductDetailsDataRowAttributesReadOnlyFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowAttributesReadOnly productDetailsDataRowAttributesReadOnly = ProductDetailsDataRowAttributesReadOnly();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productDetailsDataRowAttributesReadOnly.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productDetailsDataRowAttributesReadOnly.title = title;
  }
  final List<
      ProductDetailsDataRowAttributesReadOnlyChilds>? childs = (json['childs'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          ProductDetailsDataRowAttributesReadOnlyChilds>(
          e) as ProductDetailsDataRowAttributesReadOnlyChilds).toList();
  if (childs != null) {
    productDetailsDataRowAttributesReadOnly.childs = childs;
  }
  return productDetailsDataRowAttributesReadOnly;
}

Map<String, dynamic> $ProductDetailsDataRowAttributesReadOnlyToJson(
    ProductDetailsDataRowAttributesReadOnly entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['childs'] = entity.childs?.map((v) => v.toJson()).toList();
  return data;
}

extension ProductDetailsDataRowAttributesReadOnlyExtension on ProductDetailsDataRowAttributesReadOnly {
  ProductDetailsDataRowAttributesReadOnly copyWith({
    int? id,
    String? title,
    List<ProductDetailsDataRowAttributesReadOnlyChilds>? childs,
  }) {
    return ProductDetailsDataRowAttributesReadOnly()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..childs = childs ?? this.childs;
  }
}

ProductDetailsDataRowAttributesReadOnlyChilds $ProductDetailsDataRowAttributesReadOnlyChildsFromJson(
    Map<String, dynamic> json) {
  final ProductDetailsDataRowAttributesReadOnlyChilds productDetailsDataRowAttributesReadOnlyChilds = ProductDetailsDataRowAttributesReadOnlyChilds();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productDetailsDataRowAttributesReadOnlyChilds.title = title;
  }
  return productDetailsDataRowAttributesReadOnlyChilds;
}

Map<String, dynamic> $ProductDetailsDataRowAttributesReadOnlyChildsToJson(
    ProductDetailsDataRowAttributesReadOnlyChilds entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  return data;
}

extension ProductDetailsDataRowAttributesReadOnlyChildsExtension on ProductDetailsDataRowAttributesReadOnlyChilds {
  ProductDetailsDataRowAttributesReadOnlyChilds copyWith({
    String? title,
  }) {
    return ProductDetailsDataRowAttributesReadOnlyChilds()
      ..title = title ?? this.title;
  }
}