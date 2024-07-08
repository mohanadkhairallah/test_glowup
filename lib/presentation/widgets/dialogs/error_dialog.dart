import 'package:flutter/material.dart';

import '../custom_button.dart';
import 'custom_dialog.dart';
import 'dialog_transition_builder.dart';

class ErrorDialog {
  static void openDialog(BuildContext context, String? message) {
    dialogTransitionBuilder(
        context,
        _ErrorDialogBody(
          message: message,
        ));
  }
}

class _ErrorDialogBody extends StatelessWidget {
  const _ErrorDialogBody({Key? key, this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 60,
            ),
            child: Text(
              (message == null || message!.isEmpty) ? "Error" : message!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              label: "Close",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
