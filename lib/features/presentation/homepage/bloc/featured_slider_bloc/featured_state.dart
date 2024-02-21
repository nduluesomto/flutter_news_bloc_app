import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/features/Domain/entities/article.dart';

abstract class FeaturedState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends FeaturedState {}

class LoadingState extends FeaturedState {}

class GetFeaturedSuccessState extends FeaturedState {
  final List<Article> featuredNews;

  GetFeaturedSuccessState(this.featuredNews);

  @override
  List<Object> get props => [featuredNews];
}

class ErrorState extends FeaturedState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
