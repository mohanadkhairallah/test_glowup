import 'package:amjad/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/offer_model.dart';

class OffersHomeDots extends StatefulWidget {
  const OffersHomeDots(
      {super.key, required this.pageController, required this.offers});
  final PageController pageController;
  final List<OfferModel> offers;

  @override
  State<OffersHomeDots> createState() => _OffersHomeDotsState();
}

class _OffersHomeDotsState extends State<OffersHomeDots> {
  @override
  void initState() {
    print(widget.pageController.page);
    widget.pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < widget.offers.length; i++)
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: (widget.pageController.page == null && i == 0)
                    ? 30
                    : (i == widget.pageController.page?.toInt())
                        ? 30
                        : 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (widget.pageController.page == null && i == 0)
                      ? ColorManager.primaryColor
                      : (i == widget.pageController.page?.toInt())
                          ? ColorManager.primaryColor
                          : Colors.grey,
                ),
              ),
            )
        ],
      ),
    );
  }
}
