import 'package:flutter/material.dart';
import 'package:product_list/core/constants/resources/dimens.dart';
import 'package:product_list/core/constants/resources/styles.dart';
import 'package:product_list/core/constants/size_constants.dart';

class AppPagination extends StatefulWidget {
  const AppPagination(
      {super.key,
      required this.totalItem,
      required this.itemEachPage,
      required this.onPageTap,
      this.currentPage,
      this.totalPage});
  final int totalItem;
  final int itemEachPage;
  final int? totalPage;
  final int? currentPage;
  final void Function(int) onPageTap;

  @override
  State<AppPagination> createState() => _AppPaginationState();
}

class _AppPaginationState extends State<AppPagination> {
  int totalPage = 1;
  int currentPage = 1;

  @override
  void initState() {
    totalPage = widget.totalPage ?? getTotalPage;
    currentPage = widget.currentPage ?? 1;
    super.initState();
  }

  int get getTotalPage {
    if (widget.totalItem % widget.itemEachPage == 0) {
      return widget.totalItem ~/ widget.itemEachPage;
    }
    return widget.totalItem ~/ widget.itemEachPage + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: Dimens.d100,
      height: Dimens.d25,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => pageItem(index + 1),
        separatorBuilder: (_, __) => spaceW10,
        itemCount: totalPage,
      ),
    );
  }

  Widget pageItem(int page) => InkWell(
        onTap: () {
          currentPage = page;
          widget.onPageTap(page);
          // setState(() {
          //   currentPage = page;
          //   widget.onPageTap(page);
          // });
        },
        child: Container(
          padding: const EdgeInsets.all(Dimens.d4),
          child: Text(
            page.toString(),
            style: AppTextStyle.lightText.copyWith(
              color: page == currentPage ? Colors.blue : null,
              fontWeight: page == currentPage ? FontWeight.bold : null,
            ),
          ),
        ),
      );
}
