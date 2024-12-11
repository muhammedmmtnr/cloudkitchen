
class CartItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      quantity: map['quantity'] ?? 1,
    );
  }
}