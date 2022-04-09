import 'package:medicos_app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, this.onChanged}) : super(key: key);
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorConstants.searchTextcolor,
      onChanged: onChanged,
      style: context.textTheme.labelMedium!.copyWith(
          color: ColorConstants.searchTextcolor, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.backgroundColor,
          isDense: true,
          contentPadding: EdgeInsets.only(right: context.normalValue),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorConstants.backgroundColor),
              borderRadius: BorderRadius.circular(context.mediumValue)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorConstants.backgroundColor),
              borderRadius: BorderRadius.circular(context.mediumValue)),
          prefixIcon: Icon(Icons.search,
              color: ColorConstants.searchTextcolor,
              size: context.normalValue * 1.4),
          hintText: 'Search',
          hintStyle: context.textTheme.headline6!.copyWith(
              fontSize: 18,
              fontFamily: 'MontserratSemiBold',
              color: ColorConstants.searchTextcolor,
              fontWeight: FontWeight.w500)),
    );
  }
}
