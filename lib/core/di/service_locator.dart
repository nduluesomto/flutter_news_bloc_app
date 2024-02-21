import 'package:forestvpn_test/features/Domain/repositories/abstract_news_repository.dart';
import 'package:forestvpn_test/features/Domain/repositories/mock_news_repository.dart';
import 'package:forestvpn_test/features/domain/usecases/featuredpost.dart';
import 'package:forestvpn_test/features/domain/usecases/latestpost.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/featured_slider_bloc/featured_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/latestnews_slider_bloc/latestnews_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/read_article_bloc/read_article_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerFactory<FeaturedNewsBloc>(() => FeaturedNewsBloc());
  serviceLocator.registerFactory<LatestNewsBloc>(() => LatestNewsBloc());
  serviceLocator.registerFactory<ReadArticleBloc>(() => ReadArticleBloc());
  serviceLocator.registerLazySingleton<AbstractNewsRepository>(
      () => MockNewsRepository());
  serviceLocator.registerLazySingleton<FeaturedArticleUseCase>(
      () => FeaturedArticleUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<LatestPostUseCase>(
      () => LatestPostUseCase(serviceLocator()));
}
