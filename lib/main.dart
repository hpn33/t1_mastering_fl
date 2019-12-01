import 'package:flutter/material.dart';
import 'package:t1_mastering_fl/blocs/categories_bloc.dart';
import 'package:t1_mastering_fl/pages/home_page.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

import 'blocs/cart_bloc.dart';

void main() => runApp(BlocProvider<CartBloc>(
      child: MyApp(),
      bloc: CartBloc(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: CategoriesBloc(),
        child: HomePage(),
      ),
    );
  }
}
