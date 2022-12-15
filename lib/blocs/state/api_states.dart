abstract class ApiStates {}

class ApiInitState extends ApiStates {}

class ApiLoadingState extends ApiStates {}

class ApiLoadedState extends ApiStates {}

class ApiErrorState extends ApiStates {
  String errorMsg;
  ApiErrorState(this.errorMsg);
}
