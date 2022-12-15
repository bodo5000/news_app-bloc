import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/state/theme_mode_states.dart';
import 'package:news_app/shared/helpers/shared_pref/shared_pref.dart';

class ThemeModeCubit extends Cubit<ThemeModeStates> {
  bool isDark = false;
  ThemeModeCubit() : super(ThemeModeInitState());

  void changeThemeMode() {
    if (isDark == false) {
      isDark = true;
    } else {
      isDark = false;
    }
    cacheThemeMode();
    emit(ChangeModeState());
  }

  void cacheThemeMode({bool? sharedCacher}) {
    if (sharedCacher != null) {
      isDark = sharedCacher;
    } else {
      isDark != isDark;
    }
    SharedHelper.setDarkModeData(key: 'isDark', value: isDark);
  }
}
