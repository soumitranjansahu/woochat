import '/flutter_flow/flutter_flow_util.dart';
import 'otpverification_widget.dart' show OtpverificationWidget;
import 'package:flutter/material.dart';

class OtpverificationModel extends FlutterFlowModel<OtpverificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
