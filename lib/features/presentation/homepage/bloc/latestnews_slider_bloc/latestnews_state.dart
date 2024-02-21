import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/features/Domain/entities/article.dart';

abstract class LatestNewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends LatestNewsState {}

class LoadingState extends LatestNewsState {}

class SuccessState extends LatestNewsState {
  final List<Article> latestNews;

  SuccessState(this.latestNews);

  @override
  List<Object> get props => [latestNews];
}

class ErrorState extends LatestNewsState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
