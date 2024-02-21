import 'package:equatable/equatable.dart';

abstract class ReadArticleEvent extends Equatable {
  const ReadArticleEvent();

  @override
  List<Object> get props => [];
}

class ChangeStatus extends ReadArticleEvent {
  const ChangeStatus();

  @override
  List<Object> get props => [];
}
