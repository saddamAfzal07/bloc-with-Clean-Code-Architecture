import 'package:bloc_cca/features/domain/entities/user_entity.dart';

abstract class UserProfileState {
  const UserProfileState();
}

class UserProfileInitial extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileLoading extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileSuccess extends UserProfileState {
  final UserEntity model;

  const UserProfileSuccess({required this.model});

  @override
  List<Object> get props => [model];
}

class UserProfileError extends UserProfileState {
  final String msg;

  const UserProfileError({required this.msg});

  @override
  List<Object> get props => [msg];
}
