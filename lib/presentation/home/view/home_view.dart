import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_list/core/config/router/app_router.dart';
import 'package:product_list/core/constants/resources/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRouter.products,
              );
            },
            icon: const Icon(CupertinoIcons.list_dash),
            label: Text(
              'Product list',
              style: AppTextStyle.regularText,
            )),
      ),
    );
  }
}
