import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text('E-commerce'),
          actions: <Widget>[
            CartButton(),
          ],
        ),
        body: StreamBuilder<List<Category>>(
          stream: _categoriesBloc.outCategories,
          builder: (context, categories) {
            if (categories.hasData) {
              final categorys = categories.data;
              return ListView.builder(
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    final category = categorys[index];
                    return ListTile(
                      onTap: () =>
                          navigateToSelectedCategory(context, category),
                      title: Text(
                        category.name,
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  });
            }
            return SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_forward),
        ));
  }

  navigateToSelectedCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider<ProductsBloc>(
          child: SelectedCategoryPage(),
          bloc: ProductsBloc(category),
        ),
      ),
    );
  }
}
