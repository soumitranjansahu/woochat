import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contcts_widget.dart' show ContctsWidget;
import 'package:flutter/material.dart';

class ContctsModel extends FlutterFlowModel<ContctsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<ChatsRecord>? mychats;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  ChatsRecord? createdchat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
