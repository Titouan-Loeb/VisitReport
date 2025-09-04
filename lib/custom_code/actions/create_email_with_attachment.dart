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

import 'package:flutter_email_sender/flutter_email_sender.dart';

Future createEmailWithAttachment(
  BuildContext context,
  String? recipients,
  String? subject,
  String? body,
  List<String>? attachments,
) async {
  // Add your function code here!
  final Email email = Email(
    recipients: recipients == null ? [] : [recipients],
    subject: subject == null ? '' : subject,
    body: body == null ? '' : body,
    attachmentPaths: attachments == null ? [] : attachments,
    isHTML: false,
  );

  try {
    await FlutterEmailSender.send(email);
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.toString()),
      ),
    );
  }

  return;
}
