import 'package:equatable/equatable.dart';

abstract class LatestEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LatestEventId extends LatestEvent {}
