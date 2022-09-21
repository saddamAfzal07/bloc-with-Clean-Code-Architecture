import 'package:bloc_cca/core/error/exception.dart';
import 'package:bloc_cca/core/error/failure/failure.dart';
import 'package:bloc_cca/features/data/data_sources/user_remote_datasource.dart';
import 'package:bloc_cca/features/domain/entities/user_entity.dart';
import 'package:bloc_cca/features/domain/repository/user_data_repository.dart';
import 'package:dartz/dartz.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final UserRemoteDataSource apiRemoteDataSource;

  UserDataRepositoryImpl(this.apiRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUserData(int id) async {
    try {
      final userDataApi = await apiRemoteDataSource.getUserData(id);
      return Right(userDataApi);
    } on ServerException {
      return const Left(ServerFailure(message: 'something went wrong'));
    }
  }
}
