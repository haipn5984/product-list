import 'package:product_list/domain/model/color_model.dart';
import 'package:product_list/domain/model/product_model.dart';

import '../../data/result/result.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts();

  Future<Result<List<ProductColor>>> getColors();
}
