import 'package:e_commerce/provider/orders.dart';
import 'package:e_commerce/screens/orders/order_item.dart';
import 'package:e_commerce/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders_screen';

  @override
  Widget build(BuildContext context) {
//    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Your Oders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              //Error handling

              return Center(
                child: Text('Error occurred'),
              );
            } else {
              return Consumer<Orders>(
                builder: (context, orderData, child) => ListView.builder(
                  itemBuilder: (ctx, index) => SingleOrderItem(
                    order: orderData.orders[index],
                  ),
                  itemCount: orderData.orders.length,
                ),
              );
            }
          }
        },
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrder(),
      ),
    );
  }
}
