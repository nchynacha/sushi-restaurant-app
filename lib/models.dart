// lib/models.dart

class SushiItem {
  final String name;

  final double price;
  final String icon;

  SushiItem({
    required this.name,
    required this.price,
    this.icon = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'icon': icon,
    };
  }

  factory SushiItem.fromMap(Map<String, dynamic> map) {
    return SushiItem(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      icon: map['icon'] ?? '',
    );
  }
}

class CartItem {
  final SushiItem sushiItem;
  int quantity;

  CartItem({
    required this.sushiItem,
    this.quantity = 1,
  });

  double get totalPrice => sushiItem.price * quantity;
}
