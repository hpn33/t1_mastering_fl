import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t1_mastering_fl/api/db_api.dart';
import 'package:t1_mastering_fl/blocs/categories_bloc.dart';
import 'package:t1_mastering_fl/blocs/products_bloc.dart';
import 'package:t1_mastering_fl/models/Category.dart';
import 'package:t1_mastering_fl/pages/selected_category_page.dart';
import 'package:t1_mastering_fl/widgets/CartButton.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);

    return Scaffold(
        appBar: AppBar(title: Text('E-commerce'),
        actions: <Widget>[
          CartButton(),
        ],),
        body: StreamBuilder(
          stream: _categoriesBloc.outCategories,
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> categories) {
            if (categories.hasData) {
              return ListView.builder(
                  itemCount: categories.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              BlocProvider<ProductsBloc>(
                            child: SelectedCategoryPage(),
                            bloc: ProductsBloc(categories.data[index]),
                          ),
                        ),
                      ),
                      title: Text(
                        categories.data[index].name,
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  });
            }
            return SizedBox();
          },
        ));
  }
}
