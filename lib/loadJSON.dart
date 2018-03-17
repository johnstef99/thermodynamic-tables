import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'package:thermodynamic_local/temperature.dart';
import 'package:thermodynamic_local/pressure.dart';

List decoded;
Future<String> _loadCrosswordAsset(String filePath) async {
  return await rootBundle.loadString(filePath);
}
Future loadJSON() async {
  String temp = await _loadCrosswordAsset('files/temperature.json');
  Temperature.tempContext = JSON.decode(temp);
  String pres = await _loadCrosswordAsset('files/pressure.json');
  Pressure.presContext = JSON.decode(pres);
}
