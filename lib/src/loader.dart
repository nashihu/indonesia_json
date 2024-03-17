import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:indonesia_address/src/address_model.dart';

class IndonesiaAddress {
  static Future<List<AddressModel>> _getListAddress(
      {required String jsonPath, String searchValue = ''}) async {
    final raw = await rootBundle.loadString(jsonPath);
    final jsn = jsonDecode(raw);
    final data = (jsn as List).map((e) => AddressModel.fromJson(e)).toList();
    if (searchValue.isEmpty) return data;
    return data.where((e) => _nameMatchBetween(e, searchValue)).toList();
  }

  static _nameMatchBetween(AddressModel e, String searchValue) =>
      e.name.toLowerCase().contains(searchValue.toLowerCase());

  static Future<List<AddressModel>> getProvinces(
      {String searchValue = ''}) async {
    return _getListAddress(
      jsonPath: 'assets/provinsi.json',
      searchValue: searchValue,
    );
  }

  static Future<List<AddressModel>> getCitiesById({
    required String id,
    String searchValue = '',
  }) async {
    return _getListAddress(
      jsonPath: 'assets/kabupaten/$id.json',
      searchValue: searchValue,
    );
  }

  static Future<List<AddressModel>> getDistrictById({
    required String id,
    String searchValue = '',
  }) async {
    return _getListAddress(
      jsonPath: 'assets/kecamatan/$id.json',
      searchValue: searchValue,
    );
  }

  static Future<List<AddressModel>> getVillageById({
    required String id,
    String searchValue = '',
  }) async {
    return _getListAddress(
      jsonPath: 'assets/kelurahan/$id.json',
      searchValue: searchValue,
    );
  }
}
