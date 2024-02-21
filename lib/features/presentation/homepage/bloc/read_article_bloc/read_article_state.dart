import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/features/domain/entities/article.dart';

class ReadArticleState extends Equatable {
  final bool readStatus;

  const ReadArticleState({this.readStatus = true});

  @override
  List<Object?> get props => [readStatus];

  ReadArticleState changeState() {
    return ReadArticleState(readStatus: !readStatus);
  }
}
