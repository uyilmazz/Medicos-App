import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../view/home/model/medicine_model.dart';
import '../text/flexible_text.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({Key? key, required this.medicineItem}) : super(key: key);
  final MedicineModel medicineItem;

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
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(medicineItem.imageUrl.toImagePng,
              width: context.width * 0.14,
              height: context.height * 0.08,
              fit: BoxFit.fill),
          SizedBox(height: context.normalValue),
          FlexibleText(medicineItem.name, context)
        ],
      ),
    );
  }
}
