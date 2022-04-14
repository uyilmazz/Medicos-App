import 'package:flutter/material.dart';
import 'package:medicos_app/core/base/view/base_widget.dart';
import 'package:medicos_app/core/extensions/context_extension.dart';
import 'package:medicos_app/core/extensions/string_extension.dart';
import 'package:medicos_app/core/init/language/locale_keys.g.dart';
import 'package:medicos_app/product/widgets/stack/search_box.dart';
import 'package:medicos_app/view/doctor/view_model/doctor_view_model.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // EasyLocalization
    return BaseView<DoctorViewModel>(
        viewModel: DoctorViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel) => Scaffold(
              body: Padding(
                padding: context.appPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.lowValue),
                    const SearchBox(isBack: true),
                    SizedBox(height: context.normalValue * 1.5),
                    Text(LocaleKeys.doctorList.paramLocale(['Heart']),
                        style: context.textTheme.headline6!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(height: context.normalValue),
                    Expanded(
                      child: viewModel.fakeDoctorList.isNotEmpty
                          ? ListView.builder(
                              padding:
                                  EdgeInsets.only(bottom: context.normalValue),
                              itemCount: viewModel.fakeDoctorList.length,
                              itemBuilder: (context, index) {
                                return _doctorItem(context);
                              })
                          : const Center(
                              child: Text('Not Found Specialist'),
                            ),
                    )
                  ],
                ),
              ),
            ));
  }

  Container _doctorItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.lowValue * 1.5),
      height: context.height * 0.13,
      margin: EdgeInsets.only(top: context.lowValue),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: context.normalValue * 1.3,
            child: Image.asset('serena'.toImagePng, fit: BoxFit.fill),
          )
        ],
      ),
    );
  }
}
