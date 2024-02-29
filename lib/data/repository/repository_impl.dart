import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/data/data_source/remote_data_source/remote_network_data_source.dart';
import 'package:gradproject/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gradproject/data/network/network_error_handler.dart';
import 'package:gradproject/data/network/requests.dart';
import 'package:gradproject/domain/repository/repository.dart';
import 'package:gradproject/domain/usecase/login_usecase.dart';
import 'package:gradproject/data/network/network_check.dart' as network_check;

class RepositoryImpl implements Repository {
  final RemoteNetworkDataSource _remoteNetworkDataSource;

  RepositoryImpl(this._remoteNetworkDataSource);

  @override
  Future<Either<Failure, bool>> login(LoginRequest loginRequest) async {
    try {
      securePrint("sending login request ...");
      final response = await _remoteNetworkDataSource.login(loginRequest);
      securePrint("request login done ...");
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(ApiInternalStatus.failure,
              response.statusMessage ?? ResponseMessage.none),
        );
      }
    } catch (error) {
      securePrint("error login in DIO: $error");
      return Left(NetworkErrorHandler.handle(error).failure);
    }
  }
}
