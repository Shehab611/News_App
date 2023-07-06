// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/components1.dart';
import 'package:news/cubit/news_cubit.dart';


class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) { 
          NewsCubit cubit=BlocProvider.of(context);
          List<dynamic>? list=cubit.science;
           return articleBuilder(list);});
  }
}