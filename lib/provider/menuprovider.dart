import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<MenuItem> _menuItems = [];
  bool _isLoading = true;
  List<MenuItem> get menuItems => _menuItems;
  bool get isLoading => _isLoading;

 
  Future<void> fetchMenu() async {
    try { 
      QuerySnapshot snapshot = await _firestore.collection('menu').get();
      _menuItems = snapshot.docs
          .map((doc) => MenuItem.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print("Error fetching menu: $error");
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

  MenuItem(
     {
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
      description:data['description'] ?? '',
    );
  }
}
