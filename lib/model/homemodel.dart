
class MenuItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  MenuItem(
   {

    required this.id, 
    required this.name, 
    required this.imageUrl, 
    required this.price,
    this.description = '', 
    
  });

  
}
