import 'package:flutter/material.dart';
import '../../user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../home/view/home_page.dart';
import '../../../product/widgets/button/custom_fab_button.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  final String _doneIcon = 'done_icon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFabButton(
          text: LocaleKeys.order_startNewOrder.locale,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          }),
      body: Column(
        children: [
          Padding(
            padding: context.appPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _completedIconContainer(context),
                SizedBox(height: context.normalValue),
                _greatText(context),
                _successfulyText(context),
              ],
            ),
          ),
          SizedBox(height: context.mediumValue),
          Expanded(child: _orderDetail(context))
        ],
      ),
    );
  }

  Container _completedIconContainer(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: context.lowValue),
        height: context.height * 0.15,
        padding: EdgeInsets.all(context.normalValue * 1.9),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: context.theme.colorScheme.onTertiary, width: 9)),
        child: Image.asset(_doneIcon.toIconPng, fit: BoxFit.fill));
  }

  Text _greatText(BuildContext context) {
    return Text(LocaleKeys.order_great.locale,
        style: context.textTheme.headline4!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: context.theme.colorScheme.primary));
  }

  Text _successfulyText(BuildContext context) {
    return Text(LocaleKeys.order_orderPlacedSucces.locale,
        style: context.textTheme.headline2!.copyWith(
            color: context.theme.colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w400));
  }

  Widget _orderDetail(BuildContext context) => Container(
        width: context.width,
        padding: EdgeInsets.only(
            left: context.mediumValue * 1.2,
            right: context.mediumValue,
            top: context.mediumValue * 0.8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.mediumValue),
                topRight: Radius.circular(context.mediumValue))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _orderDetailItem(context, LocaleKeys.order_orderCode, '#207353'),
              _orderDetailItem(
                  context, LocaleKeys.order_deliveryTime, '15 Minutes'),
              _orderDetailItem(
                  context, LocaleKeys.order_amountToBePaid, '\$255'),
              _orderDetailItem(context, LocaleKeys.order_confirmEmailSent,
                  context.read<UserViewModel>().fakeUser.email ?? ''),
              _orderDetailItem(context, LocaleKeys.order_shippingAddress,
                  context.read<UserViewModel>().fakeUser.address ?? ''),
              SizedBox(height: context.mediumValue * 1.5)
            ],
          ),
        ),
      );

  Widget _orderDetailItem(BuildContext context, String headText, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headText.locale,
            style: context.textTheme.headline6!.copyWith(
                fontSize: 19,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w500)),
        Text(value,
            style: context.textTheme.headline6!.copyWith(
                fontSize: 15,
                color: context.theme.colorScheme.background,
                fontWeight: FontWeight.w500)),
        SizedBox(height: context.mediumValue)
      ],
    );
  }
}
