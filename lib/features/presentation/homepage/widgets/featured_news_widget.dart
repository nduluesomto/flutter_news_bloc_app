import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/core/di/service_locator.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/featured_slider_bloc/featured_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/featured_slider_bloc/featured_event.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/featured_slider_bloc/featured_state.dart';
import 'package:forestvpn_test/features/presentation/homepage/news_details.dart';

class FeaturedNewsWidget extends StatelessWidget {
  const FeaturedNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<FeaturedNewsBloc>()..add(FeaturedIdEvent()),
      child: const FeaturedNewsSlider(),
    );
  }
}

class FeaturedNewsSlider extends StatelessWidget {
  const FeaturedNewsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedNewsBloc, FeaturedState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ErrorState) {
          return Center(
            child: Text(state.message.toString()),
          );
        }
        if (state is GetFeaturedSuccessState) {
          return SizedBox(
              height: 290,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.featuredNews.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                            child: _featuredNewsSlider(
                          imageUrl: state.featuredNews[index].imageUrl,
                          title: state.featuredNews[index].title,
                          context: context,
                          toNewsDetails: NewsDetails(
                            article: state.featuredNews[index],
                          ),
                        )));
                  }));
        }
        return const SizedBox();
      },
    );
  }
}

Widget _featuredNewsSlider(
    {required imageUrl,
    required String title,
    required toNewsDetails,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => toNewsDetails)),
    child: Stack(
      children: [
        Container(
          height: 270,
          width: 380,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.7),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imageUrl)),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: const Offset(0, 3))
              ]),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              softWrap: true,
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
          ),
        ),
      ],
    ),
  );
}
