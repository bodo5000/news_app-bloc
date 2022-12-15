import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/theme_mode_cubit.dart';
import 'package:news_app/blocs/state/theme_mode_states.dart';
import 'package:news_app/shared/helpers/routes/app_router.dart';
import 'package:news_app/shared/helpers/shared_pref/shared_pref.dart';
import 'package:news_app/shared/themes/dark_theme.dart';
import 'package:news_app/shared/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.setupShared();
  bool? isDark = SharedHelper.getDarkModeData(key: 'isDark');

  runApp(
    BlocProvider(
      create: ((context) => ThemeModeCubit()
        ..cacheThemeMode(
          sharedCacher: isDark,
        )),
      child: MyApp(
        isDark: isDark,
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool? isDark;
  const MyApp({
    Key? key,
    required this.appRouter,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeModeStates>(
      builder: (context, state) => MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<ThemeModeCubit>().isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
