import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t1_mastering_fl/api/db_api.dart';

class HomePage extends StatelessWidget {

  final dbApi = DbApi();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text('E-commerce')
        ),
      body: ListView.builder(
        itemCount: dbApi.getCategorys().length,
        itemBuilder: (context, index) {
          return Text(dbApi.getCategorys()[index].name);
        },
      )
    );
  }
}