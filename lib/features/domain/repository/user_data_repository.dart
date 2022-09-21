import 'package:bloc_cca/core/error/failure/failure.dart';
import 'package:bloc_cca/features/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserDataRepository {
  Future<Either<Failure, UserEntity>> getUserData(int id);
}
