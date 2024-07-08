import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended',
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
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => SizedBox(
              width: 16,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, color: Colors.grey, offset: Offset(0, 2))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 42,
                              width: 42,
                              child: Image.asset(ImageManager.dummyProfileImage,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Raghad Cosmetics',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Damascus ,Al Shahbander',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Skin Care',
                            style: TextStyle(
                                color: ColorManager.darkOrange,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          ImageManager.dummyImage2,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite_border),
                          Text(
                            '1,116 Likes',
                            style: TextStyle(fontSize: 14),
                          ),
                          Spacer(),
                          Icon(Icons.star_border),
                          Text('4.5 (38 Review)'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'More Details',
                        style: TextStyle(color: ColorManager.darkOrange),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
