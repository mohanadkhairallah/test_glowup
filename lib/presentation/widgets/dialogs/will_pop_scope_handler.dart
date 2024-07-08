import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../data/local_resource/data_store.dart';
import '../../auth_screens/login_screen.dart';
import '../custom_button.dart';
import 'custom_dialog.dart';
import 'dialog_transition_builder.dart';

class WillPopScopeHandler {
  static Future<bool> handle(BuildContext context) async {
    dialogTransitionBuilder(context, const ExitAppDialog());
    return false;
  }
}

class ExitAppDialog extends StatelessWidget {
  const ExitAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      icon: Icons.exit_to_app_rounded,
      content: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 60,
            ),
            child: Text(
              "Exit App, Are you sure ?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: "Stay",
                        contentPadding: const EdgeInsets.all(0),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CustomButton(
                        label: "Exit",
                        contentPadding: const EdgeInsets.all(0),
                        onTap: () {
                          SystemNavigator.pop();
                        },
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  label: "SignOut",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  onTap: () {
                    DataStore.instance.deleteToken();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
