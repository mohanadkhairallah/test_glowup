import 'package:amjad/bloc/offer_bloc/offer_bloc.dart';
import 'package:amjad/bloc/offer_bloc/offer_state.dart';
import 'package:amjad/presentation/home_screen/widgets/offers_home_dots.dart';
import 'package:amjad/presentation/resources/assets_manager.dart';
import 'package:amjad/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bloc/offer_bloc/offer_event.dart';
import 'offer_shimmer.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OfferBloc>(
      create: (context) => OfferBloc()..add(GetHomeOffers()),
      child: OfferSectionView(),
    );
  }
}

class OfferSectionView extends StatelessWidget {
  OfferSectionView({super.key});
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferBloc, OfferState>(
      builder: (context, state) {
        if (state is Loading) {
          return OfferShimmer();
        }
        if (state is Success) {
          return Container(
            height: 220,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Offers',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'See more',
                        style: TextStyle(
                            color: ColorManager.darkOrange,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      for (var offer in state.offers!)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: ColorManager.primaryColor,
                              )),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    ImageManager.dummyImage1,
                                    fit: BoxFit.cover,
                                    width: 500,
                                  ),
                                  Container(
                                    // height: 350.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        begin: FractionalOffset.centerLeft,
                                        end: FractionalOffset.centerRight,
                                        colors: [
                                          Colors.black.withOpacity(0.6),
                                          Colors.grey.withOpacity(0.0),
                                        ],
                                        stops: [0.0, 1.0],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              offer.title ?? "Title",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              offer.description ?? "desc",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  ImageManager.offerStar,
                                                  height: 60,
                                                  width: 60,
                                                ),
                                                Text(
                                                  'Off',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 4),
                                                child: Text(
                                                  'Details',
                                                  style: TextStyle(
                                                    color:
                                                        ColorManager.darkOrange,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                OffersHomeDots(
                  pageController: pageController,
                  offers: state.offers!,
                ),
              ],
            ),
          );
        }
        return Text('Error');
      },
    );
  }
}
