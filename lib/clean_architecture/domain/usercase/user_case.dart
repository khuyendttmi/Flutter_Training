import 'package:dart_either/dart_either.dart';
import 'package:flutter_training/clean_architecture/shared/error/failure.dart';

// ignore: avoid_types_as_parameter_names
abstract class UserCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Params<T> {
  final T data;

  Params(this.data);
}

class NoParams {
  NoParams();
}
