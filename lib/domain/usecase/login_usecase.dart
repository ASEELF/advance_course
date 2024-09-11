import 'package:advanced_course/app/functions.dart';
import 'package:advanced_course/data/network/failure.dart';
import 'package:advanced_course/domain/model/model.dart';
import 'package:advanced_course/domain/repository/repository.dart';
import 'package:advanced_course/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/request/request.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,Authentication>{

  Repository? _repository;
  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input ) async {
DeviceInfo deviceInfo=await getDeviceDetails();

    
    return await _repository!.login(
        LoginRequest(
            input.email,
            input.password,
            deviceInfo.identifier,
            deviceInfo.name));
  }



}

class LoginUseCaseInput{
  String email;
  String password;
  LoginUseCaseInput(this.email,this.password);
}