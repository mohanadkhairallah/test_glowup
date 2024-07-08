import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    this.hintText,
    Key? key,
    this.controller,
    this.errorMessage,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 4),
    this.height = 60,
    this.icon,
    this.validator,
    this.isPassword = false,
    required this.label,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final String? errorMessage;
  final EdgeInsets? contentPadding;
  final double? height;
  final String? icon;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String label;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  String? validationErrorMessage;

  late TextEditingController textEditingController;
  bool viewPassword = false;

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  void validateField(String? value) {
    setState(() {
      validationErrorMessage = widget.validator!(value);
    });
  }

  Widget? passwordSuffix() {
    if (!widget.isPassword) return null;
    if (viewPassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            viewPassword = !viewPassword;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.remove_red_eye),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            viewPassword = !viewPassword;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.remove_red_eye),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Container(
              height: widget.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2, color: Colors.grey, offset: Offset(0, 2))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SizedBox(
                    //     height: 26,
                    //     width: 26,
                    //     child: Icon(Icons.remove_red_eye),
                    //   ),
                    // ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          obscureText: widget.isPassword && !viewPassword,
                          controller: widget.controller,
                          validator: (value) {
                            if (widget.validator == null) return null;
                            validateField(value);
                            return widget.validator!(value);
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFEEF6F6),
                            hintText: widget.hintText,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIcon: passwordSuffix(),
                            errorStyle: const TextStyle(
                              fontSize: 0,
                              height: 0.1,
                            ),
                            contentPadding: widget.contentPadding,
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28.0)),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28.0)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28.0)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (widget.errorMessage != null || validationErrorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0, right: 18, left: 18),
            child: Text(
              widget.errorMessage ?? validationErrorMessage ?? '',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
