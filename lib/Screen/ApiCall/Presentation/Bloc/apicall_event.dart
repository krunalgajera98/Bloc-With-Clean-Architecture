import 'package:equatable/equatable.dart';

abstract class ApiCallEvent extends Equatable {
  const ApiCallEvent();
  @override
  List<Object> get props => [];
}

class FetchApiEvent extends ApiCallEvent {}
