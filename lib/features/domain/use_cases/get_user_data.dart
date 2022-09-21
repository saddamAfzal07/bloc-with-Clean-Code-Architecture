import 'package:bloc_cca/core/error/failure/failure.dart';
import 'package:bloc_cca/features/domain/entities/user_entity.dart';
import 'package:bloc_cca/features/domain/repository/user_data_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserDataCase {
  final UserDataRepository repository;

  GetUserDataCase({required this.repository});

  Future<Either<Failure, UserEntity>> execute({required int id}) async {
    return repository.getUserData(id);
  }
}
