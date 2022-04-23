import 'package:flutter/material.dart';
import '../../../core/constants/image_constant.dart';
import 'package:provider/provider.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/icon_button/back_arrow.dart';
import '../../../view/user/view_model/user_view_model.dart';
import '../textField/search_text_field.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, this.isBack = false}) : super(key: key);
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: context.height * 0.22, color: Colors.transparent),
        _searchTextAndTextField(context),
        _userNameAndSearchImage(context),
      ],
    );
  }

  Positioned _searchTextAndTextField(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: context.normalValue, vertical: context.normalValue),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1, color: context.theme.colorScheme.surface)
                ],
                borderRadius: BorderRadius.circular(context.normalValue),
                color: context.theme.colorScheme.onSecondary),
            height: context.height * 0.17,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _wrapSearchText(context),
                SizedBox(
                    height: context.height * 0.05,
                    child: const SearchTextField())
              ],
            )));
  }

  Wrap _wrapSearchText(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text(LocaleKeys.search_findYour.locale,
            style: context.textTheme.subtitle1!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
        Text(LocaleKeys.search_specialist.locale,
            style: context.textTheme.subtitle2!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 23)),
      ],
    );
  }

  Positioned _userNameAndSearchImage(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBack
              ? BackArrowButton(context)
              : Text(context.watch<UserViewModel>().fakeUser.name ?? '',
                  style: context.textTheme.subtitle1!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
          Container(
              child:
                  Image.asset(ImageConstants.instance.searchImage.toImagePng),
              height: context.height * 0.13,
              decoration: const BoxDecoration(color: Colors.transparent))
        ],
      ),
    );
  }
}
