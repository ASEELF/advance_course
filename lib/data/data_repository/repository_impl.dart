import 'package:advanced_course/data/mapper/mapper.dart';
import 'package:dartz/dartz.dart';

import '../../domain/model.dart';
import '../../domain/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../request/request.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // here  is safe to call the API
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0)
          {
        return Right(response.toDomain());
      } else {
        // return left
        return Left(Failure(
            409, response.message ?? "we have biz error logic from API side"));
      }
    } else {
      // return connection error
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}