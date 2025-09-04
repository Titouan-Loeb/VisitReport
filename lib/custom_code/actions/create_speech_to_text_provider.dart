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

import 'package:speech_to_text/speech_to_text.dart';

//typedef OnStatusFunction = void Function(String status);

Future createSpeechToTextProvider() async {
  // Add your function code here!
  SpeechToTextProvider.initialize();
}

class SpeechToTextProvider {
  static late SpeechToText _speechToText;
  static late SpeechStatusListener _onStatusCallback;

  static Future<void> initialize() async {
    _speechToText = SpeechToText();
    await _speechToText.initialize(onStatus: _onStatus);
  }

  static void setOnStatusCallback(SpeechStatusListener onStatus) {
    _onStatusCallback = onStatus;
  }

  static Future<void> _onStatus(String status) async {
    _onStatusCallback(status);
  }

  static SpeechToText getProvider() {
    return _speechToText;
  }
}
