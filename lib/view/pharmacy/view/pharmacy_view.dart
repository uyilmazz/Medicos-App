import 'package:flutter/material.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import 'package:medicos_app/product/widgets/textField/search_text_field.dart';

import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../../../product/widgets/row/home_app.dart';

class PharmacyView extends StatelessWidget {
  const PharmacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(
              trailing: CircleAvatar(
                backgroundColor: context.theme.colorScheme.primary,
                child: Image.asset('shopping'.toIconPng,
                    fit: BoxFit.fill,
                    color: context.theme.colorScheme.onSecondary),
                // backgroundImage: AssetImage('profile'.toImagePng),
              ),
              imageUrl: 'shopping'.toIconPng),
          Text('Dev user',
              style: context.textTheme.subtitle1!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
          SizedBox(height: context.normalValue * 2),
          SizedBox(
            height: context.height * 0.05,
            child: SearchTextField(
                customFillColor: context.theme.colorScheme.onSecondary),
          ),
          SizedBox(height: context.normalValue),
          const HeadAndSeeAllText(
              headText: LocaleKeys.categories, isSeeAll: false),
          // department != null
          //     ? GridView.builder(
          //         padding: EdgeInsets.only(top: context.normalValue),
          //         shrinkWrap: true,
          //         itemCount: department!.length,
          //         physics: const NeverScrollableScrollPhysics(),
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisSpacing: context.lowValue * 1.5,
          //             mainAxisSpacing: context.normalValue,
          //             childAspectRatio: (context.width / context.height * 1.5),
          //             crossAxisCount: 3),
          //         itemBuilder: (context, index) {
          //           return HomePageItem(medicineItem: department![index]);
          //         })
          //     : const SizedBox(),
          SizedBox(height: context.normalValue),
        ],
      ),
    );
    ;
  }
}
