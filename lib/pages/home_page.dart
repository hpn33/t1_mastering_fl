import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t1_mastering_fl/api/db_api.dart';
import 'package:t1_mastering_fl/blocs/categories_bloc.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class HomePage extends StatelessWidget {
  final dbApi = DbApi();

  @override
  Widget build(BuildContext context) {

    final _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);


    return Scaffold(
      appBar: AppBar(title: Text('E-commerce')),
      body: ListView.builder(
          itemCount: dbApi.getCategories().length,
          itemBuilder: (context, index) {
            return Text(dbApi.getCategories()[index].name,
                style: TextStyle(fontSize: 24));
          }),
    );
  }
}
