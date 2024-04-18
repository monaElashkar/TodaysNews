import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/bloc/serring_states.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitState());
  static SettingCubit get(context) {
    return BlocProvider.of(context);
  }
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;
  void changeLanguage(String langCode) {
    languageCode = langCode;
    print(languageCode);
    emit(ChangeLanguageState());
  }
  
  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    emit(state);
  }

}
