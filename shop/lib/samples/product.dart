
class Product  {
   String id;
   String title;
   String description;
   double price;
   String imageUrl;
   bool isFavorite = false;

  Product({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.description,
    required this.price,
  });



}
