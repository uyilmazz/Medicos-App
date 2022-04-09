import 'package:flutter/material.dart';
import 'package:medicos_app/core/constants/app_constant.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../textField/search_text_field.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: context.height * 0.22,
            color: ColorConstants.transparentColor),
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
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 1, color: ColorConstants.searchShadowColor)
                ],
                borderRadius: BorderRadius.circular(context.normalValue),
                color: ColorConstants.whiteColor),
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
        Text('Find Your',
            style: context.textTheme.subtitle1!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
        Text('Specialist',
            style: context.textTheme.subtitle2!
                .copyWith(fontFamily: 'MontserratSemiBold', fontSize: 23)),
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
          Text('Dev user',
              style: context.textTheme.subtitle1!.copyWith(
                  fontFamily: 'MontserratSemiBold',
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          Container(
              child: Image.asset(AppConstants.searchImage.toImagePng),
              height: context.height * 0.13,
              decoration:
                  const BoxDecoration(color: ColorConstants.transparentColor))
        ],
      ),
    );
  }
}
