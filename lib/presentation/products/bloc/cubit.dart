import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:product_list/core/di/module.dart';
import 'package:product_list/core/exception/app_exception.dart';
import 'package:product_list/domain/model/color_model.dart';
import 'package:product_list/domain/model/product_model.dart';
import 'package:product_list/domain/repositoty/product_repository.dart';
import 'package:rxdart/subjects.dart';

class ProductCubit {
  final ProductRepository _repo = getIt();

  final BehaviorSubject<List<Product>> dataSubject = BehaviorSubject();
  final BehaviorSubject<AppException?> exceptionSubject =
      BehaviorSubject.seeded(null);
  final List<ProductColor> colorList = [];
  final BehaviorSubject<Product> selectedProduct = BehaviorSubject();
  final pageSize = 10;
  int currentPage = 1;
  int totalPage = 0;

  Future<void> getData() async {
    EasyLoading.show();
    await Future.wait([getProducts(), getColors()]);
    EasyLoading.dismiss();
  }

  Future<void> getProducts() async {
    final res = await _repo.getProducts();
    res.when(success: (data) {
      dataSubject.sink.add(data);
      if (data.isNotEmpty) {
        selectedProduct.sink.add(data.first);
      }
    }, error: (err) {
      if (err != exceptionSubject.valueOrNull) {
        exceptionSubject.sink.add(err);
      }
    });
  }

  Future<void> getColors() async {
    colorList.clear();
    final res = await _repo.getColors();
    res.when(success: (data) {
      colorList.addAll(data);
    }, error: (err) {
      if (err != exceptionSubject.valueOrNull) {
        exceptionSubject.sink.add(err);
      }
    });
  }
}
