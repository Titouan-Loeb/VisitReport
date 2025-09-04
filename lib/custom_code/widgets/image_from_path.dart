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

import 'dart:io';
import '../../custom_components/back_button/back_button_widget.dart';

class ImageFromPath extends StatefulWidget {
  const ImageFromPath({
    super.key,
    this.width,
    this.height,
    required this.path,
    required this.id,
  });

  final double? width;
  final double? height;
  final String path;
  final int id;

  @override
  State<ImageFromPath> createState() => _ImageFromPathState();
}

class _ImageFromPathState extends State<ImageFromPath> {
  @override
  Widget build(BuildContext context) {
    int id = widget.id;
    String tag = 'heroImage$id';
    return GestureDetector(
      child: Hero(
        tag: tag,
        child: Image.file(
          File(widget.path),
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ImageLargeScreen(path: widget.path, tag: tag);
        }));
      },
    );
  }
}

class ImageLargeScreen extends StatefulWidget {
  const ImageLargeScreen({
    super.key,
    required this.path,
    required this.tag,
  });

  final String path;
  final String tag;

  @override
  State<ImageLargeScreen> createState() => _ImageLargeScreenState();
}

class _ImageLargeScreenState extends State<ImageLargeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
          child: BackButtonWidget(),
        ),
        GestureDetector(
            child: Center(
              child: Hero(
                tag: widget.tag,
                child: Image.file(
                  File(widget.path),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}
