import 'package:flutter/material.dart';
import 'package:medicos_app/core/base/view/base_widget.dart';
import 'package:medicos_app/core/constants/color_constants.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import 'package:medicos_app/product/widgets/stack/search_box.dart';
import 'package:medicos_app/view/home/view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, homeViewModel) => Scaffold(
          body: Padding(
        padding: context.appPadding,
        child: Column(
          children: [customAppbar(context), const SearchBox()],
        ),
      )),
    );
  }

  Row customAppbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Good Moorning!',
            style: context.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorConstants.appbarTitleColor)),
        CircleAvatar(backgroundImage: AssetImage('profile'.toImagePng))
      ],
    );
  }
}
