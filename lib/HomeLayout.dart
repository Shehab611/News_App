// ignore_for_file: file_names

import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/cubit/theme_cubit.dart';

class NewsHomeLayout extends StatelessWidget {
  const NewsHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
         
      },
      builder: (context, state) {
        NewsCubit cubit = BlocProvider.of(context);
           ThemeCubit themecubit = BlocProvider.of(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      themecubit.changetheme();
                    },
                    icon: const Icon(Icons.brightness_4_outlined))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: ((value) => cubit.changeIndex(value)),
            ));
      },
    );
  }
}
