import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/core/di/service_locator.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/latestnews_slider_bloc/latestnews_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/latestnews_slider_bloc/latestnews_event.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/latestnews_slider_bloc/latestnews_state.dart';
import 'package:forestvpn_test/features/presentation/homepage/news_details.dart';
import 'package:get_time_ago/get_time_ago.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<LatestNewsBloc>()..add(LatestEventId()),
      child: const LatestNewsSlider(),
    );
  }
}

class LatestNewsSlider extends StatelessWidget {
  const LatestNewsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LatestNewsBloc, LatestNewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorState) {
            return Center(
              child: Text(state.message.toString()),
            );
          }
          if (state is SuccessState) {
            return SingleChildScrollView(
              child: SizedBox(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.latestNews.length,
                    itemBuilder: (context, index) {
                      return _newsWidget(
                          title: state.latestNews[index].title,
                          imageUrl: state.latestNews[index].imageUrl,
                          dayPublished: state.latestNews[index].publicationDate,
                          context: context,
                          toNewsDetails: NewsDetails(
                            article: state.latestNews[index],
                          ));
                    }),
              ),
            );
          }
          return const SizedBox();
        });
  }
}

Widget _newsWidget(
    {required String title,
    imageUrl,
    required dayPublished,
    required toNewsDetails,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => toNewsDetails));
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 9,
                offset: const Offset(0, 5))
          ],
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imageUrl)),
                borderRadius: BorderRadius.circular(18)),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              Text(GetTimeAgo.parse(dayPublished)),
            ],
          ),
        ],
      ),
    ),
  );
}
