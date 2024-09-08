import 'package:advanced_course/data/network/failure.dart';
import 'package:advanced_course/data/request/request.dart';
import 'package:advanced_course/data/responses/responses.dart';
import 'package:dartz/dartz.dart';

import 'model.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}
