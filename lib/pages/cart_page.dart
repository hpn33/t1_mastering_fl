import 'package:flutter/material.dart';
import 'package:t1_mastering_fl/blocs/cart_bloc.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
      ),
      body: StreamBuilder(
        stream: _cartBloc.outProducts,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.data.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data.lenght,
              itemBuilder: (context, index) {
                final product = snapshot.data[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: Text(product.amount.toString()),
                );
              },
            );
          } else {
            return Center(
              child: Text('no item in the cart.'),
            );
          }
        },
      ),
    );
  }
}
