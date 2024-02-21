import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/featured_slider_bloc/featured_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/latestnews_slider_bloc/latestnews_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/read_article_bloc/read_article_bloc.dart';

class AppBlocProviders {
  static get allAppBlocProviders => [
    BlocProvider(create: (context) => FeaturedNewsBloc()),
    BlocProvider(create: (context) => LatestNewsBloc()),
    BlocProvider(create: (context) => ReadArticleBloc()),
  ];
}