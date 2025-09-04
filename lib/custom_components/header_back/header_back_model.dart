import '/custom_components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_back_widget.dart' show HeaderBackWidget;
import 'package:flutter/material.dart';

class HeaderBackModel extends FlutterFlowModel<HeaderBackWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
  }
}
