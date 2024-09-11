import 'package:advanced_course/data/mapper/mapper.dart';
import 'package:advanced_course/data/network/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../domain/model/model.dart';
import '../../domain/repository/repository.dart';
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
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          // return left
          return Left(Failure(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.UNKOWN));
        }
      }
      catch(error){
        return(Left(ErrorHandler.handle(error).failure));
      }
    }
       else {
      // return connection error
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION));
      //or it can be handeled like this : return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
      }


  }
