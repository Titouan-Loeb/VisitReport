import '/backend/api_requests/api_calls.dart';
import '/custom_components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'rapport_widget.dart' show RapportWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class RapportModel extends FlutterFlowModel<RapportWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? lastUploadedImage;

  String? lastFileName;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  // Stores action output result for [Backend Call - API (GetAddressFromGeolocation)] action in IconButton widget.
  ApiCallResponse? apiResult2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  bool isDataUploading_uploadData1hm = false;
  FFUploadedFile uploadedLocalFile_uploadData1hm =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - saveFile] action in IconButton widget.
  String? filename;
  AudioRecorder? audioRecorder;
  String? memoAudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController1?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    rowController2?.dispose();
    backButtonModel.dispose();
  }
}
