import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../user/view_model/user_view_model.dart';
import 'confirm_order.dart';

class ShippingDetail extends StatelessWidget {
  const ShippingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserViewModel>(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFabButton(
          text: LocaleKeys.submit.locale,
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ConfirmOrder()));
          }),
      body: Padding(
        padding: context.appPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackArrowAppBar(centerText: LocaleKeys.cart_shippingDetails.locale),
            SizedBox(height: context.height * 0.07),
            _formItem(context, LocaleKeys.profile_name, provider.fakeUser.name,
                maxLines: 2),
            _formItem(
                context, LocaleKeys.profile_email, provider.fakeUser.email,
                maxLines: 2),
            _formItem(context, LocaleKeys.profile_phoneNumber,
                provider.fakeUser.phoneNumber),
            _formItem(
                context, LocaleKeys.profile_address, provider.fakeUser.address,
                maxLines: 4),
            _formItem(context, LocaleKeys.profile_zipCode,
                provider.fakeUser.zipCode.toString()),
          ],
        ),
      ),
    );
  }

  Column _formItem(BuildContext context, String headText, String? hintText,
      {int? maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headText.locale,
            style: context.textTheme.headline6!
                .copyWith(letterSpacing: -0.5, fontWeight: FontWeight.w600)),
        SizedBox(height: context.lowValue),
        _shippingTextField(context, hintText, maxLines: maxLines),
        SizedBox(height: context.lowValue),
      ],
    );
  }

  Widget _shippingTextField(BuildContext context, String? hintText,
      {int? maxLines = 1}) {
    return TextField(
      readOnly: true,
      minLines: 1,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
          filled: true,
          fillColor: context.theme.colorScheme.onSecondary,
          isDense: true,
          contentPadding: EdgeInsets.only(
              left: context.normalValue,
              right: context.normalValue,
              top: context.normalValue * 0.7,
              bottom: context.normalValue * 1.5),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(context.normalValue * 1.2)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(context.normalValue * 1.2)),
          hintText: hintText,
          hintStyle: context.textTheme.headline6!.copyWith(
              fontSize: 19,
              color: context.theme.colorScheme.onSurface.withOpacity(0.5),
              fontWeight: FontWeight.w500)),
    );
  }
}
