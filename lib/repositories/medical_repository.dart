import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/app_data.dart';

class MedicalRepository {
  Future<AppData> loadData() async {
    // Delay pentru a putea vedea starea Loading
    await Future.delayed(
      const Duration(seconds: 1),
    );

    final jsonString =
    await rootBundle.loadString(
      'assets/data/lab_v2.json',
    );

    final Map<String, dynamic> jsonData =
    jsonDecode(jsonString);

    return AppData.fromJson(jsonData);
  }
}