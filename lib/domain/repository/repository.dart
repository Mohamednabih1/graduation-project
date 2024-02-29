import 'package:dartz/dartz.dart';
import 'package:gradproject/data/network/failure.dart';
import 'package:gradproject/data/network/requests.dart';

abstract class Repository {
  Future<Either<Failure, bool>> login(LoginRequest loginRequest);
}
