import 'package:flutter/cupertino.dart';
import 'package:forestvpn_test/features/assets/constants.dart';

import 'featured_news_widget.dart';
import 'latest_news_widget.dart';

class HomePageWidgets extends StatelessWidget {
  const HomePageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: textMainColor,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            FeaturedNewsWidget(),
            SizedBox(height: 0),
            Text(
              'Latest news',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: textMainColor,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            LatestNewsWidget(),
          ],
        ),
      ),
    );
  }
}
