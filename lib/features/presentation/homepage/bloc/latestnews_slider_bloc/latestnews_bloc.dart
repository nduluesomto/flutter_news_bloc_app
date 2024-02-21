import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/core/di/service_locator.dart';
import 'package:forestvpn_test/features/Domain/entities/article.dart';
import 'package:forestvpn_test/features/domain/usecases/latestpost.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/latestnews_slider_bloc/latestnews_event.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/latestnews_slider_bloc/latestnews_state.dart';

class LatestNewsBloc extends Bloc<LatestEventId, LatestNewsState> {
  LatestNewsBloc() : super(InitialState()) {
    on<LatestEventId>(_latestEventId);
  }

  FutureOr<void> _latestEventId(
      LatestEventId event, Emitter<LatestNewsState> emit) async {
    try {
      emit(LoadingState());
      List<Article> latestNews = await serviceLocator<LatestPostUseCase>().call();
      emit(SuccessState(latestNews));
    } catch (e) {
      emit(ErrorState("Failed to load latestNews"));
    }
  }
}