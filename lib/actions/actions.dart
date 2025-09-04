import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future clearFields(BuildContext context) async {
  FFAppState().deleteNotes();
  FFAppState().notes = '';

  FFAppState().deleteNewNotes();
  FFAppState().newNotes = '';

  FFAppState().deleteAddressString();
  FFAppState().addressString = '';

  FFAppState().deleteClient();
  FFAppState().client = '';

  FFAppState().deleteImageFilepaths();
  FFAppState().imageFilepaths = [];

  FFAppState().deleteAudioPaths();
  FFAppState().audioPaths = [];

  FFAppState().update(() {});
}
