// Example usage of SushiItemList within a StatelessWidget or StatefulWidget
import 'package:flutter/material.dart';
import 'models.dart';
import 'sushi_item_widget.dart';

class SushiItemList extends StatelessWidget {
  final List<SushiItem> sushiItems;

  const SushiItemList({Key? key, required this.sushiItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sushiItems.length,
      itemBuilder: (context, index) {
        return SushiItemWidget(sushiItem: sushiItems[index]);
      },
    );
  }
}
