import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/read_article_bloc/read_article_event.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/read_article_bloc/read_article_state.dart';

class ReadArticleBloc extends Bloc<ReadArticleEvent, ReadArticleState> {
  ReadArticleBloc() : super(const ReadArticleState()) {
    on<ChangeStatus>(_changeReadStatus);
  }

  void _changeReadStatus(ChangeStatus event, Emitter<ReadArticleState> emit) {
    emit(state.changeState());
    if (state.readStatus == true) {
    } else {}
  }
}
