// lib/cart.dart

import 'models.dart';

class Cart {
  static final Cart _singleton = Cart._internal();
  factory Cart() {
    return _singleton;
  }
  Cart._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(SushiItem sushiItem) {
    for (var item in _items) {
      if (item.sushiItem.name == sushiItem.name) {
        item.quantity++;
        return;
      }
    }
    _items.add(CartItem(sushiItem: sushiItem));
  }

  void clear() {
    _items.clear();
  }

  void removeItem(SushiItem sushiItem) {
    _items.removeWhere((item) => item.sushiItem.name == sushiItem.name);
  }

  void updateItemQuantity(SushiItem sushiItem, int newQuantity) {
    for (var item in _items) {
      if (item.sushiItem.name == sushiItem.name) {
        item.quantity = newQuantity;
        if (item.quantity <= 0) {
          _items.remove(item);
        }
        break;
      }
    }
  }

  int getItemQuantity(SushiItem sushiItem) {
    for (var item in _items) {
      if (item.sushiItem.name == sushiItem.name) {
        return item.quantity;
      }
    }
    return 0;
  }

  double get total {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }
}
