import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import 'package:medicos_app/core/init/language/locale_keys.g.dart';
import '../../../core/extensions/context_extension.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, this.onChanged}) : super(key: key);
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.theme.colorScheme.onBackground,
      onChanged: onChanged,
      style: context.textTheme.labelMedium!.copyWith(
          color: context.theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          filled: true,
          fillColor: context.theme.scaffoldBackgroundColor,
          isDense: true,
          contentPadding: EdgeInsets.only(right: context.normalValue),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(context.lowValue)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.theme.scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(context.lowValue)),
          prefixIcon: Icon(Icons.search,
              color: context.theme.colorScheme.onBackground,
              size: context.normalValue * 1.4),
          hintText: LocaleKeys.search_searchText.locale,
          hintStyle: context.textTheme.headline6!.copyWith(
              fontSize: 18,
              color: context.theme.colorScheme.onBackground,
              fontWeight: FontWeight.w600)),
    );
  }
}
