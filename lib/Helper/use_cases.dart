import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future call(Params params);
  // Future<Either<Fail, Type>> call(Params params);
}

abstract class UseCaseNoReturn<Params> {
  call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
