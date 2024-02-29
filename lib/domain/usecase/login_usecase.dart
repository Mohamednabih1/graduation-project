import 'package:dartz/dartz.dart';
import 'package:gradproject/data/network/failure.dart';
import 'package:gradproject/data/network/requests.dart';
import 'package:gradproject/domain/repository/repository.dart';
import 'package:gradproject/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginRequest, bool> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(LoginRequest input) async {
    return await _repository.login(input);
  }
}
