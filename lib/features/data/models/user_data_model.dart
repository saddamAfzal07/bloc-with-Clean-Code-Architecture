import 'package:bloc_cca/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    required String avatar,
  }) : super(
          id: id,
          email: email,
          firstName: firstName,
          avatar: avatar,
          lastName: lastName,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      avatar: json['avatar'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}
