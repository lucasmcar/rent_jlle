import 'dart:convert';
import 'package:flutter/services.dart';

class LabelsUtil {
  Future<Map<String, dynamic>> getLabelFromJson(String jsonFile) async {
    final response = await  rootBundle.loadString(jsonFile);
    final decoded = jsonDecode(response);
    return decoded;
  }
}
