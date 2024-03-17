import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:product_list/data/response/color_response.dart';
import 'package:product_list/data/response/product_response.dart';
import 'package:retrofit/http.dart';

import '../../core/constants/api_constants.dart';

part 'product_service.g.dart';

@RestApi()
abstract class ProductService {
  @factoryMethod
  factory ProductService(Dio dio) = _ProductService;

  @GET(ApiConstants.getProducts)
  Future<List<ProductResponse>> getProducts();

  @GET(ApiConstants.getColors)
  Future<List<ColorResponse>> getColors();
}
