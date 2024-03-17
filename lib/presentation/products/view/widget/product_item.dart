import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_list/core/config/themes/app_theme.dart';
import 'package:product_list/core/constants/resources/dimens.dart';
import 'package:product_list/core/constants/resources/styles.dart';
import 'package:product_list/core/constants/size_constants.dart';
import 'package:product_list/domain/model/color_model.dart';
import 'package:product_list/domain/model/product_model.dart';
import 'package:collection/collection.dart';

class ProductItems extends StatefulWidget {
  const ProductItems({
    super.key,
    required this.avalableColor,
    required this.data,
    this.onEditTap,
  });
  final List<ProductColor> avalableColor;
  final Product data;
  final void Function()? onEditTap;

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  late ProductColor? currentColor;

  @override
  void initState() {
    currentColor = widget.avalableColor
        .firstWhereOrNull((element) => element.id == widget.data.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.d8),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppTheme.getInstance().bodyTextColor.withOpacity(0.2)),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            Dimens.d4,
          ),
        ),
      ),
      child: Row(children: [
        // Image.network(data.image),
        SizedBox(
          height: Dimens.d120,
          width: Dimens.d120,
          child: CachedNetworkImage(
            imageUrl: widget.data.image,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        spaceW10,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.data.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.boldText,
                    ),
                  ),
                  if (widget.onEditTap != null)
                    InkWell(
                      onTap: () {
                        widget.onEditTap?.call();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.pencil,
                          size: Dimens.d24,
                          color: Colors.red,
                        ),
                      ),
                    )
                ],
              ),
              spaceH4,
              Text(
                widget.data.errorDescription ?? '',
              ),
              spaceH4,
              Text(
                widget.data.sku,
              ),
              spaceH4,
              Text(
                widget.data.id.toString(),
              ),
              if (currentColor != null)
                Text(
                  currentColor!.name,
                ),
            ],
          ),
        ),
      ]),
    );
  }
}
