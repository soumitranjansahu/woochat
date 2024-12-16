import '/flutter_flow/flutter_flow_util.dart';
import 'showprofile_widget.dart' show ShowprofileWidget;
import 'package:flutter/material.dart';

class ShowprofileModel extends FlutterFlowModel<ShowprofileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
