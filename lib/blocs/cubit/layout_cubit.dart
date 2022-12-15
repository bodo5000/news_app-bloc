import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/api_cubit.dart';
import 'package:news_app/blocs/state/layout_states.dart';
import 'package:news_app/shared/helpers/layout_cubit_helper/bottom_items_helper.dart';

class LayOutCubit extends Cubit<LayOutStates> {
  LayOutCubit() : super(LayOutInitState());

  void getIndexOfSelectedButton(int index, BuildContext context) {
    DeclearBottomItems.currentIndex = index;

    if (index == 0) {
      context.read<ApiCubit>().getBusinessData();
    }
    if (index == 1) {
      context.read<ApiCubit>().getSportsData();
    }
    if (index == 2) {
      context.read<ApiCubit>().getSciencesData();
    }
    if (index == 3) {
      context.read<ApiCubit>().getGeneralData();
    }

    emit(LayOutChangeBottomBarState());
  }
}
