import 'package:flutter/material.dart';
import 'package:sushi/constants.dart';
import 'cart.dart';

class OrderStatusPage extends StatelessWidget {
  final Cart cart;

  OrderStatusPage({required this.cart});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Order Status',
          style: TextStyle(
              color: kPurpleColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: cart.items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No order yet',
                      style: TextStyle(
                        fontSize: 20,
                        color: kPurpleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Browse our menu to add items to your cart',
                      style: TextStyle(
                        fontSize: 16,
                        color: kLightpurpleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Icon(
                      Icons.shopping_basket_rounded,
                      color: kLightpurpleColor,
                      size: 70,
                    )
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your order is being prepared...',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kLightpurpleColor),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Order Summary',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kPurpleColor),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final cartItem = cart.items[index];
                        return Card(
                          color: kLightroseQuartzColor,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.0),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [kLightroseQuartzColor, Colors.white54],
                              ),
                            ),
                            child: ListTile(
                              leading: Image.asset(cartItem.sushiItem.icon,
                                  width: 40, height: 40),
                              title: Text(
                                cartItem.sushiItem.name,
                                style: TextStyle(color: kPurpleColor),
                              ),
                              subtitle: Text(
                                'Quantity: ${cartItem.quantity}',
                                style: TextStyle(color: kLightpurpleColor),
                              ),
                              trailing: Text(
                                '\$${(cartItem.quantity * cartItem.sushiItem.price).toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: kPurpleColor, fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: cart.items.isEmpty
          ? SizedBox.shrink()
          : BottomAppBar(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount: \$${cart.total.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPurpleColor),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
