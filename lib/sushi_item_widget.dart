// lib/sushi_item_widget.dart

import 'package:flutter/material.dart';
import 'package:sushi/constants.dart';
import 'models.dart';
import 'cart.dart';

class SushiItemWidget extends StatefulWidget {
  final SushiItem sushiItem;

  const SushiItemWidget({Key? key, required this.sushiItem}) : super(key: key);

  @override
  _SushiItemWidgetState createState() => _SushiItemWidgetState();
}

class _SushiItemWidgetState extends State<SushiItemWidget> {
  int quantity = 0;

  void addItemToCart() {
    Cart().addItem(widget.sushiItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          width: double.infinity,
          // Adjust width as needed
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kLightroseQuartzColor, Colors.white54],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.sushiItem.icon,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sushiItem.name,
                        style: TextStyle(
                          color: kPurpleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${widget.sushiItem.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: kRoseQuartzColor),
                    child: IconButton(
                      icon: Icon(Icons.remove, color: kPurpleColor),
                      onPressed: () {
                        setState(() {
                          if (quantity > 0) {
                            quantity--;
                            Cart().removeItem(widget.sushiItem);
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(color: kPurpleColor, fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: kRoseQuartzColor),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: kPurpleColor,
                      ),
                      onPressed: () {
                        addItemToCart();
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
