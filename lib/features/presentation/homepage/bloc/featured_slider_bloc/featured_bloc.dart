import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/core/di/service_locator.dart';
import 'package:forestvpn_test/features/Domain/entities/article.dart';
import 'package:forestvpn_test/features/domain/usecases/featuredpost.dart';

import 'featured_event.dart';
import 'featured_state.dart';

class FeaturedNewsBloc extends Bloc<FeaturedIdEvent, FeaturedState> {
  FeaturedNewsBloc() : super(InitialState()) {
    on<FeaturedIdEvent>(_featuredIdEvent);
  }

  FutureOr<void> _featuredIdEvent(
      FeaturedIdEvent event, Emitter<FeaturedState> emit) async {
    try {
      emit(LoadingState());
      List<Article> featuredNews =
          await serviceLocator<FeaturedArticleUseCase>().call();
      emit(GetFeaturedSuccessState(featuredNews));
    } catch (e) {
      //print(e.toString());
      emit(ErrorState("Something Not right, failed to load"));
    }
  }

}
