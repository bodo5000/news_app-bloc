import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/state/api_states.dart';
import 'package:news_app/models/api_model.dart';
import 'package:news_app/shared/constants/api_strings.dart';
import 'package:news_app/shared/helpers/dio/dio_get_data.dart';

class ApiCubit extends Cubit<ApiStates> {
  late TopHeadLinesModel topHeadLinesModel;

  ApiCubit() : super(ApiInitState());

  void getBusinessData() {
    DioGetData.requestData(categoryQuery: ApiStrings.BUSINESS_CATEGORY_QUERY)
        .then((response) {
      topHeadLinesModel = TopHeadLinesModel.fromJson(response.data);

      emit(ApiLoadedState());
    }).catchError((onError) {
      print(onError);
      emit(ApiErrorState(onError));
    });
  }

  void getSportsData() {
    DioGetData.requestData(categoryQuery: ApiStrings.SPORTS_CATEGORY_QUERY)
        .then((response) {
      topHeadLinesModel = TopHeadLinesModel.fromJson(response.data);

      emit(ApiLoadedState());
    }).catchError((onError) {
      print(onError);
      emit(ApiErrorState(onError));
    });
  }

  void getSciencesData() {
    DioGetData.requestData(categoryQuery: ApiStrings.SCIENCES_CATEGORY_QUERY)
        .then((response) {
      topHeadLinesModel = TopHeadLinesModel.fromJson(response.data);

      emit(ApiLoadedState());
    }).catchError((onError) {
      print(onError);
      emit(ApiErrorState(onError));
    });
  }

  void getGeneralData() {
    DioGetData.requestData(categoryQuery: ApiStrings.GENERAL_CATEGORY_QUERY)
        .then((response) {
      topHeadLinesModel = TopHeadLinesModel.fromJson(response.data);

      emit(ApiLoadedState());
    }).catchError((onError) {
      print(onError);
      emit(ApiErrorState(onError));
    });
  }
}
