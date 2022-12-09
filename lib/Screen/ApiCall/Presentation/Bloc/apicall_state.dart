import 'package:demo_block/Screen/ApiCall/Domain/Entities/api_res_model.dart';
import 'package:equatable/equatable.dart';

abstract class ApiCallState extends Equatable {
  const ApiCallState();

  @override
  List<Object?> get props => [];
}

class InitialState extends ApiCallState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends ApiCallState {
  final ApiResModel apiResModel;
  final String? key;

  const SuccessState({required this.apiResModel, this.key});

  @override
  List<Object> get props => [];
}

class LoaderState extends ApiCallState {
  const LoaderState();

  @override
  List<Object> get props => [];
}

class ErrorState extends ApiCallState {
  final String? errorMessage;

  const ErrorState({this.errorMessage});

  @override
  List<Object> get props => [];
}

class EmptyState extends ApiCallState {
  const EmptyState();

  @override
  List<Object> get props => [];
}

class PageNotFoundState extends ApiCallState {
  const PageNotFoundState();

  @override
  List<Object> get props => [];
}
