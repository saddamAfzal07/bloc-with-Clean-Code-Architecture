import 'package:bloc_cca/features/data/models/user_data_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserData(int id);
}
