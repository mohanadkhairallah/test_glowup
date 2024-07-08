import 'package:amjad/presentation/home_screen/widgets/home_appbar.dart';
import 'package:amjad/presentation/home_screen/widgets/offer_section.dart';
import 'package:amjad/presentation/home_screen/widgets/recommened_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/background_decoration.png'),
              RotatedBox(
                  quarterTurns: 2,
                  child:
                      Image.asset('assets/images/background_decoration.png')),
            ],
          ),
          Column(
            children: [
              HomeAppBar(),
              SizedBox(
                height: 16,
              ),
              OfferSection(),
              SizedBox(
                height: 16,
              ),
              RecommendedSection(),
            ],
          ),
        ],
      ),
    );
  }
}
