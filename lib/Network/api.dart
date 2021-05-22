import 'dart:convert';

import "package:dio/dio.dart" ;
import 'package:http/http.dart' as http;
Future getModel({String symptoms} ) async {
  print('done') ;
  var url = Uri.parse('http://192.168.56.1:54804/predict?name=predict&symptoms= $symptoms');
  var urlRespond = await http.get(url);
  print('done');
  var jsonDecodeRespond = json.decode(urlRespond.body);
  print('done');
  print(jsonDecodeRespond);
  return jsonDecodeRespond;
}