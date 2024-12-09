// lib/providers/cart_provider.dart
import 'package:cloud_kitchen/model/cartmodel.dart';
import 'package:flutter/foundation.dart';


class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Get total cart value
  double get totalAmount {
    return _items.fold(0, (total, item) => total + (item.price * item.quantity));
  }

  // Add item to cart
  void addToCart(CartItem item) {
    // Check if item already exists in cart
    for (var cartItem in _items) {
      if (cartItem.id == item.id) {
        cartItem.quantity++;
        notifyListeners();
        return;
      }
    }

    // If item doesn't exist, add to cart
    _items.add(item);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  // Increase item quantity
  void increaseQuantity(String itemId) {
    for (var item in _items) {
      if (item.id == itemId) {
        item.quantity++;
        notifyListeners();
        break;
      }
    }
  }

  // Decrease item quantity
  void decreaseQuantity(String itemId) {
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].id == itemId) {
        if (_items[i].quantity > 1) {
          _items[i].quantity--;
        } else {
          _items.removeAt(i);
        }
        notifyListeners();
        break;
      }
    }
  }

  // Clear entire cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}