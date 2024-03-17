import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:product_list/core/constants/resources/dimens.dart';
import 'package:product_list/core/constants/resources/styles.dart';
import 'package:product_list/core/constants/size_constants.dart';
import 'package:product_list/core/di/module.dart';
import 'package:product_list/domain/model/product_model.dart';
import 'package:product_list/presentation/products/bloc/cubit.dart';
import 'package:product_list/presentation/products/view/widget/product_item.dart';
import 'package:product_list/presentation/products/view/widget/product_item_detail.dart';
import 'package:product_list/presentation/widget/button/app_primary_button.dart';
import 'package:product_list/presentation/widget/pagination/app_pagination.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductCubit _cubit = getIt();
  final List<Product> modifiedProduct = [];

  @override
  void initState() {
    _cubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PRODUCT LIST',
          style: AppTextStyle.boldText,
        ),
      ),
      body: StreamBuilder(
        stream: _cubit.exceptionSubject,
        builder: (context, snapShot) {
          return snapShot.data != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        snapShot.data?.message ?? 'Some thing went wrong!',
                        style: AppTextStyle.mediumText
                            .copyWith(color: Colors.redAccent),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          _cubit.getData();
                        },
                        child: Text(
                          'Retry',
                          style: AppTextStyle.mediumText.copyWith(),
                        ))
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Dimens.d220,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.d8,
                          vertical: Dimens.d24,
                        ),
                        child: StreamBuilder<List<Product>>(
                            stream: _cubit.dataSubject,
                            builder: (context, snapshot) {
                              final listProduct = snapshot.data ?? [];
                              _cubit.totalPage = listProduct.length ~/ 10 +
                                  ((listProduct.length % 10 == 0) ? 0 : 1);
                              return Column(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      separatorBuilder: (_, __) => spaceH10,
                                      itemCount: _cubit.currentPage <
                                              _cubit.totalPage
                                          ? _cubit.pageSize
                                          : _cubit.totalPage % _cubit.pageSize,
                                      itemBuilder: (_, index) {
                                        final itemIndex =
                                            (_cubit.currentPage - 1) *
                                                    _cubit.pageSize +
                                                index;
                                        return ProductItems(
                                          key: UniqueKey(),
                                          avalableColor: _cubit.colorList,
                                          data: listProduct[itemIndex],
                                          onEditTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                clipBehavior: Clip.none,
                                                title: Center(
                                                  child: Text(
                                                    'Edit Product',
                                                    style:
                                                        AppTextStyle.boldText,
                                                  ),
                                                ),
                                                insetPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: Dimens.d16,
                                                ),
                                                backgroundColor: Colors.white,
                                                surfaceTintColor:
                                                    Colors.transparent,
                                                content: EditProductItem(
                                                  avalableColor:
                                                      _cubit.colorList,
                                                  data: listProduct[itemIndex],
                                                  onChangeData: (item) {
                                                    modifiedProduct.add(item);
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  AppPagination(
                                    key: UniqueKey(),
                                    totalItem: listProduct.length,
                                    itemEachPage: 10,
                                    currentPage: _cubit.currentPage,
                                    totalPage: _cubit.totalPage,
                                    onPageTap: (page) {
                                      _cubit.currentPage = page;
                                      setState(() {});
                                    },
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                    AppPrimaryButton(
                      onTap: () {
                        if (modifiedProduct.isEmpty) {
                          EasyLoading.showToast(
                            'Nothing changed',
                            toastPosition: EasyLoadingToastPosition.bottom,
                          );
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            clipBehavior: Clip.none,
                            title: Center(
                              child: Text(
                                'Submit Change',
                                style: AppTextStyle.boldText,
                              ),
                            ),
                            insetPadding: const EdgeInsets.symmetric(
                              horizontal: Dimens.d16,
                            ),
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.transparent,
                            content: SingleChildScrollView(
                              child: Column(children: [
                                spaceH10,
                                ...modifiedProduct
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.only(
                                            top: Dimens.d10,
                                          ),
                                          child: ProductItems(
                                            key: UniqueKey(),
                                            avalableColor: _cubit.colorList,
                                            data: e,
                                          ),
                                        ))
                                    .toList(),
                                spaceH10,
                                AppPrimaryButton(
                                  title: 'Ok',
                                  onTap: () {
                                    modifiedProduct.clear();
                                    Navigator.pop(context);
                                  },
                                )
                              ]),
                            ),
                          ),
                        );
                      },
                      title: 'SUBMIT',
                    ),
                    navBarHeight,
                  ],
                );
        },
      ),
    );
  }
}
