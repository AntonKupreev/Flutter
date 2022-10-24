import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((file) => file.toString());
  // .catchError((file) => 'file not found');
}

Future<String> fetchFileFromAssets2(String assetsPath) async {
  try {
    return await rootBundle.loadString(assetsPath);
  } catch (e) {
    return 'file not found ';
  }
}
