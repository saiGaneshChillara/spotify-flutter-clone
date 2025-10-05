import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/configs/theme/app_theme.dart';
import 'package:myapp/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:myapp/presentation/splash/pages/splash.dart';
import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:path_provider/path_provider.dart";
import "package:flutter_bloc/flutter_bloc.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = kIsWeb
      ? await HydratedStorage.build(
          storageDirectory: HydratedStorageDirectory.web,
        )
      : await HydratedStorage.build(
          storageDirectory: HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
        );
  HydratedBloc.storage = storage;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit(),),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
