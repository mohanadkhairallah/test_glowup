import 'package:amjad/presentation/auth_screens/widgets/custom_input_field.dart';
import 'package:amjad/presentation/home_screen/home_screen.dart';
import 'package:amjad/presentation/resources/color_manager.dart';
import 'package:amjad/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/auth_bloc/authentication_event.dart';
import '../../bloc/auth_bloc/authentication_state.dart';
import '../../bloc/auth_bloc/authertication_bloc.dart';
import '../resources/assets_manager.dart';
import '../widgets/dialogs/error_dialog.dart';
import '../widgets/dialogs/loading_dialog.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userNameController =
      TextEditingController(text: '+963948858333');
  final TextEditingController passwordController =
      TextEditingController(text: 'password');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthState>(
      listener: (context, state) {
        if (state is Loading) {
          LoadingDialog().openDialog(context, message: 'Singing In ...');
        } else {
          LoadingDialog().closeDialog(context);
        }
        if (state is Error) {
          ErrorDialog.openDialog(context, state.error);
        }
        if (state is Success) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen()));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/background_decoration.png'),
                  RotatedBox(
                      quarterTurns: 2,
                      child: Image.asset(
                          'assets/images/background_decoration.png')),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: SvgPicture.asset(
                                ImageManager.logo,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Welcome back!\nlog in using your email account to continue us',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomInputField(
                                hintText: 'Enter your  number',
                                label: "Mobile",
                                controller: userNameController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'This field is Required';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              CustomInputField(
                                hintText: 'Enter your password',
                                label: "Password",
                                controller: passwordController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'This field is Required';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Forget Password ?'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CustomButton(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => HomeScreen()));

                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context
                                        .read<AuthenticationBloc>()
                                        .add(Login(
                                          username: userNameController.text,
                                          password: passwordController.text,
                                        ));
                                  }
                                },
                                label: "Sign In"),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Guest',
                              style: TextStyle(
                                  color: ColorManager.darkOrange,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
