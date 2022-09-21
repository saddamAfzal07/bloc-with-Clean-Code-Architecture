import 'package:bloc_cca/features/domain/use_cases/get_user_data.dart';
import 'package:bloc_cca/features/presentation/cubit/user_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBloc extends Cubit<UserProfileState> {
  final GetUserDataCase getUserDataCase;
  UserProfileBloc({required this.getUserDataCase})
      : super(UserProfileInitial());
  profile() async {
    emit(UserProfileLoading());
    final failureOrUserInfo = await getUserDataCase.execute(id: 2);
    failureOrUserInfo.fold(
      (l) => emit(UserProfileError(msg: l.toString())),
      (r) => emit(UserProfileSuccess(model: r)),
    );
  }
}
