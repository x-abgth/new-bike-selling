import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/data/repositories/authentication_repository.dart';
import 'package:ktm/data/repositories/new_bikes_data_repository.dart';
import 'package:ktm/logics/blocs/auth_bloc/auth_bloc.dart';
import 'package:ktm/logics/blocs/get_bikes_bloc/get_bikes_bloc.dart';
import 'presentation/widgets/bottom_nav_bar.dart';
import 'core/constants/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => AuthenticationRepository()),
        RepositoryProvider<NewBikesDataRepository>(
            create: (context) => NewBikesDataRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          BlocProvider<GetBikesBloc>(create: (context) => GetBikesBloc())
        ],
        child: MaterialApp(
          title: "KTM",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            canvasColor: Colors.black,
            primaryColor: kPrimary,
            primaryColorDark: kPrimaryDark,
            colorScheme: ThemeData().colorScheme.copyWith(secondary: kAccent),
            textTheme: ThemeData.dark().textTheme.copyWith(
                  bodyText2: TextStyle(
                    fontFamily: "Iceland",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
            iconTheme: IconThemeData(color: Colors.white),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontFamily: "Roboto",
                color: kPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              color: Colors.black,
              iconTheme: IconThemeData(color: kPrimary),
            ),
            scaffoldBackgroundColor: Colors.black,
          ),
          home: BottomNavBar(),
        ),
      ),
    );
  }
}
