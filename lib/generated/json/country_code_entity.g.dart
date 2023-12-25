import 'package:kishk_driver/generated/json/base/json_convert_content.dart';
import 'package:kishk_driver/country_code/data/country_code_entity.dart';

CountryCodeEntity $CountryCodeEntityFromJson(Map<String, dynamic> json) {
  final CountryCodeEntity countryCodeEntity = CountryCodeEntity();
  final CountryCodeData? data = jsonConvert.convert<CountryCodeData>(
      json['data']);
  if (data != null) {
    countryCodeEntity.data = data;
  }
  return countryCodeEntity;
}

Map<String, dynamic> $CountryCodeEntityToJson(CountryCodeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  return data;
}

extension CountryCodeEntityExtension on CountryCodeEntity {
  CountryCodeEntity copyWith({
    CountryCodeData? data,
  }) {
    return CountryCodeEntity()
      ..data = data ?? this.data;
  }
}

CountryCodeData $CountryCodeDataFromJson(Map<String, dynamic> json) {
  final CountryCodeData countryCodeData = CountryCodeData();
  final List<CountryCodeDataRows>? rows = (json['rows'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<CountryCodeDataRows>(e) as CountryCodeDataRows)
      .toList();
  if (rows != null) {
    countryCodeData.rows = rows;
  }
  return countryCodeData;
}

Map<String, dynamic> $CountryCodeDataToJson(CountryCodeData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rows'] = entity.rows?.map((v) => v.toJson()).toList();
  return data;
}

extension CountryCodeDataExtension on CountryCodeData {
  CountryCodeData copyWith({
    List<CountryCodeDataRows>? rows,
  }) {
    return CountryCodeData()
      ..rows = rows ?? this.rows;
  }
}

CountryCodeDataRows $CountryCodeDataRowsFromJson(Map<String, dynamic> json) {
  final CountryCodeDataRows countryCodeDataRows = CountryCodeDataRows();
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    countryCodeDataRows.code = code;
  }
  final String? isoCode = jsonConvert.convert<String>(json['iso_code']);
  if (isoCode != null) {
    countryCodeDataRows.isoCode = isoCode;
  }
  return countryCodeDataRows;
}

Map<String, dynamic> $CountryCodeDataRowsToJson(CountryCodeDataRows entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['iso_code'] = entity.isoCode;
  return data;
}

extension CountryCodeDataRowsExtension on CountryCodeDataRows {
  CountryCodeDataRows copyWith({
    String? code,
    String? isoCode,
  }) {
    return CountryCodeDataRows()
      ..code = code ?? this.code
      ..isoCode = isoCode ?? this.isoCode;
  }
}