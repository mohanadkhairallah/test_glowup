import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 64, vertical: 16)});
  final Function() onTap;
  final String label;
  final EdgeInsets contentPadding;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(contentPadding),
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorManager.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            ),
            onPressed: () {
              onTap();
            },
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
