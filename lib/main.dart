import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news/screens/bloc/setting_cubit.dart';
import 'package:news/shared/styles/my_theme.dart';
import 'layout/home_screen.dart';
import 'layout/splash_screen.dart';
import 'observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(MultiBlocProvider(

      providers: [
        BlocProvider(create: ((context) =>  SettingCubit())
        ),
      ],
      child: EasyLocalization(
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          child: const NewsApp())));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(SettingCubit.get(context).languageCode),
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: SettingCubit.get(context).themeMode,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
    );
  }
}
