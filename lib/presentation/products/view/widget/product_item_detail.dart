import 'package:flutter/material.dart';
import 'package:product_list/core/constants/resources/dimens.dart';
import 'package:product_list/core/constants/resources/styles.dart';
import 'package:product_list/core/constants/size_constants.dart';
import 'package:product_list/domain/model/color_model.dart';
import 'package:product_list/domain/model/product_model.dart';
import 'package:collection/collection.dart';
import 'package:product_list/presentation/widget/app_text_field.dart';
import 'package:product_list/presentation/widget/button/app_primary_button.dart';

class EditProductItem extends StatefulWidget {
  const EditProductItem({
    super.key,
    required this.avalableColor,
    required this.data,
    required this.onChangeData,
  });
  final List<ProductColor> avalableColor;
  final Product data;
  final void Function(Product) onChangeData;

  @override
  State<EditProductItem> createState() => _EditProductItemState();
}

class _EditProductItemState extends State<EditProductItem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(Dimens.d8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              Dimens.d8,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowData(
              title: 'Name',
              content: AppTextField(
                initText: widget.data.name,
                maxLine: 1,
                maxLength: 50,
                onChange: (text) {
                  _formKey.currentState!.validate();
                  if (text.isNotEmpty) {
                    widget.data.name = text;
                  }
                },
                validator: (value) {
                  return (value?.isEmpty ?? true) ? 'Name is required' : null;
                },
              ),
            ),
            spaceH8,
            rowData(
              title: 'SKU',
              content: AppTextField(
                initText: widget.data.sku,
                maxLine: 1,
                maxLength: 20,
                onChange: (text) {
                  _formKey.currentState!.validate();
                  if (text.isNotEmpty) {
                    widget.data.sku = text;
                  }
                },
                validator: (value) {
                  return (value?.isEmpty ?? true) ? 'SKU is required' : null;
                },
              ),
            ),
            spaceH8,
            rowData(
                title: 'Color',
                content: DropdownButton<ProductColor>(
                  value: widget.avalableColor.firstWhereOrNull(
                      (element) => element.id == widget.data.color),
                  items: widget.avalableColor.map((ProductColor item) {
                    return DropdownMenuItem<ProductColor>(
                      value: item,
                      child: Text(item.name),
                    );
                  }).toList(),
                  onChanged: (seletedColor) {
                    setState(() {
                      widget.data.color = seletedColor?.id;
                    });
                  },
                )),
            spaceH8,
            Row(
              children: [
                Expanded(
                  child: AppPrimaryButton(
                    title: 'Cancel',
                    color: Colors.grey,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: AppPrimaryButton(
                    title: 'Save',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onChangeData(widget.data);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rowData({required String title, required Widget content}) {
    return Row(
      children: [
        SizedBox(
          width: Dimens.d50,
          child: Text(
            title,
            style: AppTextStyle.lightText,
          ),
        ),
        Expanded(
          child: content,
        ),
      ],
    );
  }
}
