import 'package:amjad/presentation/auth_screens/login_screen.dart';
import 'package:amjad/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc/authertication_bloc.dart';
import 'data/local_resource/data_store.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Dome Care',
        home: DataStore.instance.hasToken ? const HomeScreen() : LoginScreen(),
      ),
    );
  }
}
