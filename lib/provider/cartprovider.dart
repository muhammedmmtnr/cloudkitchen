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
   void addToCart(CartItem menuItem) {
      print('DEBUG: Attempting to add item to cart: ${menuItem.name}');
    
    final index = _items.indexWhere((item) => item.id == menuItem.id);
    if (index >= 0) {
         print('DEBUG: Item already in cart, increasing quantity');
      _items[index].quantity++;
    } else {
       print('DEBUG: New item added to cart');
      _items.add(CartItem(
        id: menuItem.id,
        name: menuItem.name,
        description: menuItem.description,
        price: menuItem.price,
        imageUrl: menuItem.imageUrl,
        quantity: 1,
      ));
    }
     print('DEBUG: Current cart items count: ${_items.length}');
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