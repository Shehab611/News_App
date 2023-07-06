import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/Cachehelper.dart';
import 'package:news/core/Dio.dart';
import 'package:news/cubit/theme_cubit.dart';
import 'HomeLayout.dart';
import 'cubit/news_cubit.dart';
bool? isLight;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init(url: 'https://newsapi.org/');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers:[
          BlocProvider(create: (context) => NewsCubit()..getBusinessData(),),
          BlocProvider(create: (context) => ThemeCubit(),),
        ],

        child: BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {},
          builder: (context, state) {
            ThemeCubit cubit = BlocProvider.of(context);
            isLight = CacheHelper.getData(key: 'light');
            if (isLight != null) if (isLight!) cubit.appmode = ThemeMode.light;
            return MaterialApp(
              home: const NewsHomeLayout(),
              theme: cubit.newsAppLighttheme(),
              darkTheme: cubit.newsAppDarktheme(),
              themeMode: cubit.appmode,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      );
  }
}


