import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../view/user/model/user_cart.dart';
import '../../../view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';

class ShopCartItem extends StatelessWidget {
  const ShopCartItem({Key? key, required this.item}) : super(key: key);

  final CartItem item;
  final String _trashIconName = 'trash';

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);

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
          Expanded(flex: 4, child: _cartItemInfo(context, _userViewModel))
        ],
      ),
    );
  }

  Padding _cartItemInfo(BuildContext context, UserViewModel userViewModel) {
    return Padding(
      padding: EdgeInsets.only(left: context.normalValue * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _nameAndTrashButton(context),
          const SizedBox(height: 3),
          CustomRatingBar(
              initializeRating: item.product?.rate ?? 0,
              itemSize: context.lowValue * 1.5),
          const SizedBox(height: 3),
          Text('\$ ${item.product?.price ?? 0}',
              style: context.textTheme.subtitle2!.copyWith(fontSize: 12)),
          const Spacer(),
          _incrementAndDecrementRow(context, userViewModel)
        ],
      ),
    );
  }

  Align _incrementAndDecrementRow(
      BuildContext context, UserViewModel userViewModel) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: context.lowValue,
        children: [
          _incrementDecrementButton(
              context, Icons.remove_circle_outline_rounded, onTap: () async {
            await userViewModel
                .decrementProductFromCart(item.product?.id ?? '');
          }),
          Text(item.quantity.toString(),
              style: context.textTheme.subtitle2!.copyWith(fontSize: 12)),
          _incrementDecrementButton(context, Icons.add_circle_outline,
              onTap: () async {
            await userViewModel.addProductInCart(item.product?.id ?? '');
          }),
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
        Text(item.product?.name ?? '',
            style: context.textTheme.subtitle2!.copyWith(fontSize: 14)),
        Image.asset(_trashIconName.toIconPng,
            fit: BoxFit.fill, height: context.normalValue * 1.2)
      ],
    );
  }
}
