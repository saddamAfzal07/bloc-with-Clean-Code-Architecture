import 'package:bloc_cca/features/presentation/cubit/user_profile_cubit.dart';
import 'package:bloc_cca/features/presentation/pages/homepage.dart';
import 'package:bloc_cca/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_cca/locator.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UserProfileBloc(getUserDataCase: sl()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const Home(),
      ),
    );
  }
}
