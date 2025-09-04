import '/custom_components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'header_back_model.dart';
export 'header_back_model.dart';

class HeaderBackWidget extends StatefulWidget {
  const HeaderBackWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<HeaderBackWidget> createState() => _HeaderBackWidgetState();
}

class _HeaderBackWidgetState extends State<HeaderBackWidget> {
  late HeaderBackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderBackModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        wrapWithModel(
          model: _model.backButtonModel,
          updateCallback: () => safeSetState(() {}),
          child: BackButtonWidget(),
        ),
        Text(
          valueOrDefault<String>(
            widget.title,
            'Header',
          ),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                font: GoogleFonts.notoSansJp(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),
        ),
      ].divide(SizedBox(width: 16.0)),
    );
  }
}
