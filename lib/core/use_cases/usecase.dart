import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure/failure.dart';

abstract class Usecase<T, Parm> {
  Future<Either<Failure, T>> call([Parm parm]);
}

class NoParm {}
