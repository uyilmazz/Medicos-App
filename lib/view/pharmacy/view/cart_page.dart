import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import 'shipping_detail_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  final String _trashIconName = 'trash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          CustomFabButton(text: LocaleKeys.cart_checkOut.locale),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: context.appPadding,
              child: Column(
                children: [
                  BackArrowAppBar(
                      centerText: LocaleKeys.cart_shoppingCart.locale),
                  SizedBox(height: context.normalValue),
                  Expanded(child: _cartListView(context)),
                ],
              ),
            ),
          ),
          SizedBox(height: context.normalValue),
          _productDetailContent(context)
        ],
      ),
    );
  }

  ListView _cartListView(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(
            vertical: context.lowValue, horizontal: context.lowValue),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: ((context, index) => _shopCartItem(context)));
  }

  Container _shopCartItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.lowValue * 1.5),
      height: context.height * 0.14,
      margin: EdgeInsets.only(top: context.normalValue),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: Image.asset('BP_Meter_detail'.toImagePng)),
          Expanded(flex: 4, child: _cartItemInfo(context))
        ],
      ),
    );
  }

  Padding _cartItemInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.normalValue * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _nameAndTrashButton(context),
          const SizedBox(height: 3),
          CustomRatingBar(
              initializeRating: 3, itemSize: context.lowValue * 1.5),
          const SizedBox(height: 3),
          Text('\$ 98',
              style: context.textTheme.subtitle2!.copyWith(fontSize: 12)),
          const Spacer(),
          _incrementAndDecrementRow(context)
        ],
      ),
    );
  }

  Align _incrementAndDecrementRow(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: context.lowValue,
        children: [
          _incrementDecrementButton(
              context, Icons.remove_circle_outline_rounded,
              onTap: () {}),
          Text('2', style: context.textTheme.subtitle2!.copyWith(fontSize: 12)),
          _incrementDecrementButton(context, Icons.add_circle_outline,
              onTap: () {}),
        ],
      ),
    );
  }

  GestureDetector _incrementDecrementButton(BuildContext context, IconData icon,
      {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon,
          color: context.theme.colorScheme.background,
          size: context.normalValue * 1.1),
    );
  }

  Row _nameAndTrashButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('BP Meter',
            style: context.textTheme.subtitle2!.copyWith(fontSize: 14)),
        Image.asset(_trashIconName.toIconPng,
            fit: BoxFit.fill, height: context.normalValue * 1.2)
      ],
    );
  }

  Container _productDetailContent(BuildContext context) {
    return Container(
      height: context.height * 0.4,
      padding: EdgeInsets.only(
          left: context.normalValue * 1.5,
          right: context.normalValue,
          top: context.normalValue),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.mediumValue),
              topRight: Radius.circular(context.mediumValue))),
      child: Column(
        children: [
          _itemPriceInfoText(context, LocaleKeys.cart_order.locale, '\$ 190'),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(context, LocaleKeys.cart_delivery.locale, '\$ 50'),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(context, LocaleKeys.cart_tax.locale, '2%'),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(context, LocaleKeys.cart_discount.locale, '3%'),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(
              context, LocaleKeys.cart_totalBill.locale, '\$ 255'),
          SizedBox(height: context.normalValue),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ShippingDetail()));
                },
                child: Text(LocaleKeys.cart_shippingDetails.locale,
                    style: context.textTheme.subtitle2!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.tertiary))),
          )
        ],
      ),
    );
  }

  Row _itemPriceInfoText(BuildContext context, String text, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: context.textTheme.subtitle1!
                .copyWith(fontSize: 17, fontWeight: FontWeight.w500)),
        Text(value,
            style: context.textTheme.subtitle2!.copyWith(
                fontSize: 13, color: context.theme.colorScheme.background))
      ],
    );
  }
}
