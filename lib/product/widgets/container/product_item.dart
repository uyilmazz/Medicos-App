import 'package:flutter/material.dart';
import 'package:medicos_app/core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../view/pharmacy/model/product.dart';
import '../../../view/pharmacy/view/product_detail.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.item}) : super(key: key);

  final Product item;
  final String _notFoundText = 'Item Not Found';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: context.lowValue, horizontal: context.normalValue),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: _productImage(context)),
          Expanded(flex: 2, child: _productIngo(context))
        ],
      ),
    );
  }

  Widget _productImage(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(product: item)));
        },
        child: Align(
            alignment: Alignment.center,
            child: item.imageUrl != null
                ? Image.network(item.imageUrl!.networkUrl,
                    errorBuilder: ((context, error, stackTrace) => Image.asset(
                        ImageConstants.instance.imageNotFound.toImagePng,
                        fit: BoxFit.fill)),
                    fit: BoxFit.fill)
                : Image.asset(ImageConstants.instance.imageNotFound.toImagePng,
                    fit: BoxFit.fill)),
      );

  Column _productIngo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _flexProductName(context),
        CustomRatingBar(
            initializeRating: item.rate, itemSize: context.normalValue * 0.8),
        _priceAndShoppingIcon(context)
      ],
    );
  }

  Flexible _flexProductName(BuildContext context) {
    return Flexible(
      child: Text(item.name ?? _notFoundText,
          style: context.textTheme.subtitle2!.copyWith(fontSize: 13),
          softWrap: false,
          overflow: TextOverflow.ellipsis),
    );
  }

  Row _priceAndShoppingIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$ ${item.price ?? 0}', style: context.textTheme.subtitle2),
        Image.asset('shopping'.toIconPng,
            color: context.theme.colorScheme.primary,
            height: context.normalValue)
      ],
    );
  }
}
