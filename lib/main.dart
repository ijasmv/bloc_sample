import 'package:bloc_sample/application/downloads/downloads_bloc.dart';
import 'package:bloc_sample/application/search/search_bloc.dart';
import 'package:bloc_sample/domain/core/di/injectable.dart';
import 'package:bloc_sample/presentation/downloads/download_screen.dart';
import 'package:bloc_sample/smaple_counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(
          create: (ctx) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DownloadsScreen(),
      ),
    );
  }
}
