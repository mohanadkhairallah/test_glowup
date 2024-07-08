import 'package:flutter/material.dart';

Future dialogTransitionBuilder(BuildContext context, Widget child) {
 return showGeneralDialog(

    context: context,
    pageBuilder: (ctx, a1, a2) {
      return child;
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 1),
  );
}
