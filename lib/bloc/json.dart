import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class JsonBase {

  Future<dynamic> getJsonFromLocal(String name, {bool asset = false}) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      final file = File('$appDocPath/$name.imp');
      final exists = await file.exists();
      if (asset && !exists) {
        final body = await rootBundle.loadString('assets/jsons/$name.json');
        final jsonObject = jsonToObject(body);
        return jsonObject;
      }
      if (exists) {
        String contents = await file.readAsString();
        final jsonObject = jsonToObject(contents);
        return jsonObject;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Null> saveJsonToLocal(String name, String json) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      final file = File('$appDocPath/$name.imp');
      await file.writeAsString(json);
    } catch (e) {
      print(e);
    }
    return null;
  }

  dynamic jsonToObject(String source) {
    try {
      if (source != null) return json.decode(source);
    } catch (e) {
      print(e);
    }
    return null;
  }

  String mapToJson(Map source) {
    try {
      if (source != null) return json.encode(source);
    } catch (e) {
      print(e);
    }
    return null;
  }

  dynamic byteToObject(Uint8List source) {
    try {
      if (source != null) return json.decode(utf8.decode(source));
    } catch (e) {
      print(e);
    }
    return null;
  }
}
