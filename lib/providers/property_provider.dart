import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:house_finder/models/property.dart';
import 'package:http/http.dart' as http;

class PropertyProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result =
        await http.get('http://bwa-cozy.herokuapp.com/recommended-spaces');

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Property> property =
          data.map((item) => Property.fromJson(item)).toList();
      return property;
    } else {
      return <Property>[];
    }
  }
}
