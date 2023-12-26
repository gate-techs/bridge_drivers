class VehiclesCategoryBrandsResponse {
  List<VehiclesCategoryBrandsData>? data;
  String? message;
  int? status;

  VehiclesCategoryBrandsResponse({this.data, this.message, this.status});

  VehiclesCategoryBrandsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VehiclesCategoryBrandsData>[];
      json['data'].forEach((v) {
        data!.add(VehiclesCategoryBrandsData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class VehiclesCategoryBrandsData {
  int? id;
  String? name;
  int? categoryId;
  String? category;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? image;

  VehiclesCategoryBrandsData(
      {this.id,
        this.name,
        this.categoryId,
        this.category,
        this.nameAr,
        this.nameEn,
        this.createdAt,
        this.image});

  VehiclesCategoryBrandsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    category = json['category'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['created_at'] = createdAt;
    data['image'] = image;
    return data;
  }
}
