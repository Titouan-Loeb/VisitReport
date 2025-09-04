// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:mime_type/mime_type.dart';

Future<String?> saveFile(
  BuildContext context,
  FFUploadedFile pictureData,
) async {
  // Add your function code here!
  try {
    // Get the download directory path
    if (pictureData.name == null || pictureData.bytes == null) return null;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    // Generate a unique file name
    String fileName = pictureData.name!;
    String filePath = '$appDocPath/$fileName';
    print('AppDocPath: $appDocPath');
    print('FileName: $fileName');
    // Write the file
    File file = File(filePath);
    await file.writeAsBytes(pictureData.bytes!.toList(), flush: true);

    print('File downloaded to: $filePath');
    return filePath;
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("The file couln't be saved"),
    ));
  }
  return null;
}
