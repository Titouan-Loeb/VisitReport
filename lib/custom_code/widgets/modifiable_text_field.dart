// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ModifiableTextField extends StatefulWidget {
  const ModifiableTextField({
    super.key,
    this.width,
    this.height,
    required this.value,
    required this.setNoteValueCallback,
  });

  final double? width;
  final double? height;
  final String value;
  final Future Function(String text) setNoteValueCallback;

  @override
  State<ModifiableTextField> createState() => _ModifiableTextFieldState();
}

class _ModifiableTextFieldState extends State<ModifiableTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text field value when the widget is created
    _textEditingController.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: widget.setNoteValueCallback,
      autofocus: false,
      obscureText: false,
    );
  }
}
