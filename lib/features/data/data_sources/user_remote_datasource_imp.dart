import 'dart:convert';
import 'package:bloc_cca/core/error/exception.dart';
import 'package:bloc_cca/features/data/data_sources/user_remote_datasource.dart';
import 'package:bloc_cca/features/data/models/user_data_model.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSourceImp extends UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImp(this.client);

  @override
  Future<UserModel> getUserData(int id) async {
    final response = await client.get(
      Uri.parse(
        ("https://reqres.in/api/users/$id"),
      ),
    );
    Map<String, dynamic> responsedata = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      return UserModel.fromJson(responsedata["data"]);
    } else {
      throw ServerException("Something went wrong");
    }
  }
}
