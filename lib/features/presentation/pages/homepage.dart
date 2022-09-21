import 'package:bloc_cca/features/data/models/user_data_model.dart';
import 'package:bloc_cca/features/presentation/cubit/user_profile_cubit.dart';
import 'package:bloc_cca/features/presentation/cubit/user_profile_state.dart';
import 'package:bloc_cca/features/presentation/widgets/user_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                if (state is UserProfileInitial) {
                  return const Text("Search User Profile");
                }
                if (state is UserProfileLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is UserProfileSuccess) {
                  UserModel model = state.model as UserModel;
                  return Column(
                    children: [
                      CircularProfileAvatar(
                        '',
                        borderColor: Colors.blue,
                        borderWidth: 2,
                        elevation: 2,
                        radius: 70,
                        child: CachedNetworkImage(
                          imageUrl: model.avatar,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              Image.asset("assets/images/user.png"),
                        ),
                      ),
                      UserInfoContainer(
                        icon: Icons.account_circle,
                        text: "${model.firstName} ${model.lastName}",
                      ),
                      UserInfoContainer(
                        icon: Icons.email,
                        text: model.email.toString(),
                      ),
                    ],
                  );
                }
                if (state is UserProfileError) {
                  return Text(state.msg);
                }
                return const Text("Something went wrong");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserProfileBloc>().profile();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
