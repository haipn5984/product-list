// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductColor {
  final int id;
  final String name;
  ProductColor({
    required this.id,
    required this.name,
  });

  @override
  String toString() => 'ProductColor(id: $id, name: $name)';
}
