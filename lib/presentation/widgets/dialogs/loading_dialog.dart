import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import 'dialog_transition_builder.dart';

class LoadingDialog {
  static final LoadingDialog _loadingDialog = LoadingDialog._internal();

  factory LoadingDialog() {
    return _loadingDialog;
  }

  LoadingDialog._internal();

  bool _isShown = false;

  void closeDialog(BuildContext context) {
    if (_isShown) {
      Navigator.of(context).pop();
      _isShown = false;
    }
  }

  void openDialog(BuildContext context, {String? message}) {
    _isShown = true;
    dialogTransitionBuilder(
        context,
        _LoadingDialogBody(
          message: message,
        )).whenComplete(() => _isShown = false);
  }
}

class _LoadingDialogBody extends StatelessWidget {
  const _LoadingDialogBody({Key? key, this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            color: ColorManager.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitThreeInOut(
                itemBuilder: (_, int index) {
                  return SvgPicture.asset(
                    ImageManager.logo,
                    height: 60,
                    width: 60,
                    color: Colors.white,
                  );
                },
              ),
              Text(
                message ?? "Processing...",
                style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none, ////set decoration to .none
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
