// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:indonesia_address/indonesia_address.dart';

void main() {
  test('test loader', () async {
    WidgetsFlutterBinding.ensureInitialized();
    var provinces = await IndonesiaAddress.getProvinces();
    assert(provinces.isNotEmpty);
    assert(provinces.length == 34);
    provinces = await IndonesiaAddress.getProvinces(searchValue: 'jawa BARAT');
    assert(provinces.length == 1);
    var city = await IndonesiaAddress.getCitiesById(id: provinces.first.id);
    assert(city.length == 27);
    city = await IndonesiaAddress.getCitiesById(
      id: provinces.first.id,
      searchValue: 'cianjur',
    );
    assert(city.length == 1);
    var district = await IndonesiaAddress.getDistrictById(id: city.first.id);
    assert(district.length == 32);
    district = await IndonesiaAddress.getDistrictById(
      id: city.first.id,
      searchValue: 'CIPANAS',
    );
    assert(district.length == 1);
    var villages = await IndonesiaAddress.getVillageById(id: district.first.id);
    assert(villages.length == 7);
    villages = await IndonesiaAddress.getVillageById(
      id: district.first.id,
      searchValue: 'sindangjaya',
    );
    assert(villages.length == 1);
    debugPrint("ok");
  });
}
