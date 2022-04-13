import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../view/home/model/medicine_model.dart';
import '../text/flexible_text.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem(
      {Key? key, required this.medicineItem, this.isSelected = false})
      : super(key: key);
  final MedicineModel medicineItem;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.lowValue),
      width: context.width * 0.23,
      height: context.height * 0.15,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                      context.theme.colorScheme.primary,
                      context.theme.colorScheme.primary.withOpacity(0.1)
                    ])
              : null,
          color: isSelected
              ? context.theme.colorScheme.primary
              : context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: _itemContent(context),
    );
  }

  Column _itemContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(medicineItem.imageUrl?.toImagePng ?? "Eye".toImagePng,
            width: context.width * 0.14,
            height: context.height * 0.08,
            fit: BoxFit.fill),
        SizedBox(height: context.normalValue),
        FlexibleText(medicineItem.name ?? "Not Found", context,
            color: isSelected
                ? context.theme.colorScheme.onSecondary
                : context.theme.colorScheme.onSurface)
      ],
    );
  }
}
