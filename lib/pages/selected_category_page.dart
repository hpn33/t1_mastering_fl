import 'package:flutter/material.dart';
import 'package:t1_mastering_fl/blocs/products_bloc.dart';
import 'package:t1_mastering_fl/models/product.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class SelectedCategoryPage extends StatelessWidget {
  const SelectedCategoryPage({
    Key key,
    @required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final _productBloc = BlocProvider.of<ProductsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('selected category page'),
      ),
      body: StreamBuilder<List<Product>>(
          stream: _productBloc.outProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(snapshot.data[index].name),
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
