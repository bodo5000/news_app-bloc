import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/api_cubit.dart';
import 'package:news_app/blocs/cubit/layout_cubit.dart';
import 'package:news_app/shared/constants/screens_name.dart';
import 'package:news_app/shared/helpers/dio/dio_client_setup.dart';
import 'package:news_app/shared/helpers/routes/argument_class.dart';
import 'package:news_app/views/screens/layout_screen.dart';
import 'package:news_app/views/screens/more_information_screen.dart';

class AppRouter {
  AppRouter() {
    DioClientSetup.dioSetup();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreensName.Home_LayOut:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => LayOutCubit(),
              ),
              BlocProvider(
                create: (_) => ApiCubit()..getBusinessData(),
              ),
            ],
            child: const LayOutScreen(),
          ),
        );

      case ScreensName.MORE_INFO:
        final argumentsModel = settings.arguments as Arguments;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => ApiCubit(),
            child: MoreInfoScreen(
              topHeadLinesModel: argumentsModel.topHeadLinesModel,
              index: argumentsModel.index,
            ),
          ),
        );
    }
    return null;
  }
}
