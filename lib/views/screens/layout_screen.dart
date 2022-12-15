import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/layout_cubit.dart';
import 'package:news_app/blocs/cubit/theme_mode_cubit.dart';
import 'package:news_app/blocs/state/layout_states.dart';
import 'package:news_app/blocs/state/theme_mode_states.dart';
import 'package:news_app/shared/helpers/layout_cubit_helper/bottom_items_helper.dart';
import 'package:news_app/shared/helpers/layout_cubit_helper/screens_item_helper.dart';
import 'package:news_app/shared/widgets/icon_button.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
        actions: <Widget>[
          BlocBuilder<ThemeModeCubit, ThemeModeStates>(
            builder: (context, state) => reusableIconButton(
              icon: context.watch<ThemeModeCubit>().isDark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              onPressed: () {
                context.read<ThemeModeCubit>().changeThemeMode();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<LayOutCubit, LayOutStates>(
        builder: (context, state) => BottomNavigationBar(
          iconSize: 30.0,
          onTap: (int index) {
            context
                .read<LayOutCubit>()
                .getIndexOfSelectedButton(index, context);
          },
          unselectedItemColor: Colors.black45,
          currentIndex: DeclearBottomItems.currentIndex,
          items: DeclearBottomItems.bottomBarItems,
        ),
      ),
      body: DeclearScreensItems.screensShow.elementAt(
        DeclearBottomItems.currentIndex,
      ),
    );
  }
}
