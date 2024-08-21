import 'package:flutter/material.dart';
import 'package:sushi/constants.dart';
import 'package:sushi/oder_status_page.dart';

import 'cart.dart';
import 'models.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Cart cart = Cart();

  void updateCart(SushiItem sushiItem, int change) {
    setState(() {
      int newQuantity = cart.getItemQuantity(sushiItem) + change;

      if (newQuantity > 0) {
        cart.updateItemQuantity(sushiItem, newQuantity);
      } else if (newQuantity == 0) {
        cart.removeItem(sushiItem);
      }
    });
  }

  void _resetCart() {
    setState(() {
      cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: TextStyle(
              color: kPurpleColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: cart.items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No items in your cart',
                      style: TextStyle(
                        fontSize: 20,
                        color: kPurpleColor,
                        fontWeight: FontWeight.bold,
                      ),
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
            : ListView.builder(
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
                        leading: Image.asset(
                          cartItem.sushiItem.icon,
                          width: 40,
                          height: 40,
                        ),
                        title: Text(
                          cartItem.sushiItem.name,
                          style: TextStyle(color: kPurpleColor),
                        ),
                        subtitle: Text(
                          'Quantity: ${cartItem.quantity}',
                          style: TextStyle(color: kPurpleColor),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink(
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: kRoseQuartzColor),
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: kPurpleColor,
                                ),
                                onPressed: () {
                                  updateCart(cartItem.sushiItem, -1);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${cartItem.quantity}',
                              style:
                                  TextStyle(fontSize: 12, color: kPurpleColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Ink(
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: kRoseQuartzColor),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: kPurpleColor,
                                ),
                                onPressed: () {
                                  updateCart(cartItem.sushiItem, 1);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: cart.items.isEmpty
          ? SizedBox.shrink() // ไม่แสดงอะไรเมื่อไม่มีสินค้าในตะกร้า
          : BottomAppBar(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Total: \$${cart.total.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPurpleColor),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPurpleColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderStatusPage(cart: cart),
                          ),
                        ).then((_) {
                          _resetCart(); // Reset the cart after navigating
                        });
                      },
                      child: Text(
                        'check out'.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
