import 'package:flutter/material.dart';
import 'package:medicos_app/product/widgets/container/shop_cart_item.dart';
import 'package:medicos_app/view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import 'confirm_order.dart';
import 'shipping_detail_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          cartControl ? _fabButton(context) : const SizedBox(),
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
          cartControl ? _productDetailContent(context) : const SizedBox()
        ],
      ),
    );
  }

  CustomFabButton _fabButton(BuildContext context) {
    return CustomFabButton(
        text: LocaleKeys.cart_checkOut.locale,
        onTap: () async {
          final response = await context.read<UserViewModel>().addOrder();
          response
              ? Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ConfirmOrder()))
              : null;
        });
  }

  bool get cartControl => (context.watch<UserViewModel>().cart != null &&
          context.watch<UserViewModel>().cart!.isNotEmpty)
      ? true
      : false;

  Widget _cartListView(BuildContext context) {
    return cartControl
        ? ListView.builder(
            padding: EdgeInsets.symmetric(
                vertical: context.lowValue, horizontal: context.lowValue),
            shrinkWrap: true,
            itemCount: context.watch<UserViewModel>().cart!.length,
            itemBuilder: ((context, index) =>
                ShopCartItem(item: context.read<UserViewModel>().cart![index])))
        : Center(
            child: Text('Cart is Empty',
                style: context.textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.theme.colorScheme.primary)));
  }

  Container _productDetailContent(BuildContext context) {
    final _userProvider = Provider.of<UserViewModel>(context);

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
          _itemPriceInfoText(context, LocaleKeys.cart_order.locale,
              _userProvider.order.toStringAsFixed(2).dolarPrice),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(context, LocaleKeys.cart_delivery.locale,
              '${_userProvider.delivery}'.dolarPrice),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(
              context, LocaleKeys.cart_tax.locale, '${_userProvider.tax}%'),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(context, LocaleKeys.cart_discount.locale,
              '${_userProvider.discount}%'),
          SizedBox(height: context.normalValue),
          _itemPriceInfoText(context, LocaleKeys.cart_totalBill.locale,
              _userProvider.totalPrice.toStringAsFixed(2).dolarPrice),
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
