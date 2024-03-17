// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int id;
  String? errorDescription;
  String name;
  String sku;
  String image;
  int? color;

  Product({
    required this.id,
    this.errorDescription,
    required this.name,
    required this.sku,
    required this.image,
    this.color,
  });

  @override
  String toString() {
    return 'Product(id: $id, errorDescription: $errorDescription, name: $name, sku: $sku, image: $image, color: $color)';
  }
}
