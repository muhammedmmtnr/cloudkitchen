import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [];
  bool _isLoading = false;

  List<MenuItem> get menuItems => _menuItems;
  bool get isLoading => _isLoading;

  Future<void> fetchMenuItems() async {
    _isLoading = true;
    notifyListeners();

    try {
      final QuerySnapshot querySnapshot = 
        await FirebaseFirestore.instance.collection('menu').get();
      
      _menuItems = querySnapshot.docs.map((doc) {
        return MenuItem.fromFirestore(
          doc.data() as Map<String, dynamic>
        );
      }).toList();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching menu items: $e');
      _isLoading = false;
      notifyListeners();
    }
  }
}
class MenuItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory MenuItem.fromFirestore(Map<String, dynamic> data) {
    return MenuItem(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
