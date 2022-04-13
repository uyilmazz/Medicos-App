import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import 'package:medicos_app/core/init/language/locale_keys.g.dart';
import 'package:medicos_app/product/widgets/row/back_arrow_app_bar.dart';

import '../model/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.appPadding,
        child: Column(
          children: [
            BackArrowAppBar(
                centerText: LocaleKeys.productDetail.locale,
                imageUrl: 'shopping'.toIconPng),
          ],
        ),
      ),
    );
  }
}
