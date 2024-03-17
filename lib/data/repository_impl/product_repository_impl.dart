import 'package:product_list/data/response/color_response.dart';
import 'package:product_list/data/response/product_response.dart';
import 'package:product_list/data/result/result.dart';
import 'package:product_list/data/service/product_service.dart';
import 'package:product_list/domain/model/color_model.dart';
import 'package:product_list/domain/model/product_model.dart';
import 'package:product_list/domain/repositoty/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _service;
  ProductRepositoryImpl(this._service);

  @override
  Future<Result<List<Product>>> getProducts() {
    return runCatchingAsync<List<ProductResponse>, List<Product>>(
      () => _service.getProducts(),
      (res) => res.map((e) => e.toModel()).toList(),
    );
  }

  @override
  Future<Result<List<ProductColor>>> getColors() {
    return runCatchingAsync<List<ColorResponse>, List<ProductColor>>(
      () => _service.getColors(),
      (res) => res.map((e) => e.toModel()).toList(),
    );
  }
}
