import 'package:flutter/material.dart';
import 'package:medicos_app/product/widgets/text/experience_rich_text.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/stack/search_box.dart';
import 'doctor_profile.dart';
import '../view_model/doctor_view_model.dart';
import '../model/doctor.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key}) : super(key: key);

  final String _notFound = 'Not Found';

  @override
  Widget build(BuildContext context) {
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
                          ? _doctorsListBuilder(context, viewModel)
                          : Center(child: Text(_notFound)),
                    )
                  ],
                ),
              ),
            ));
  }

  ListView _doctorsListBuilder(
      BuildContext context, DoctorViewModel viewModel) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: context.normalValue),
        itemCount: viewModel.fakeDoctorList.length,
        itemBuilder: (context, index) {
          return _doctorItem(context, viewModel.fakeDoctorList[index]);
        });
  }

  Widget _doctorItem(BuildContext context, Doctor item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DoctorProfile(doctor: item)));
      },
      child: Container(
        padding: EdgeInsets.all(context.lowValue * 1.5),
        height: context.height * 0.12,
        margin: EdgeInsets.only(top: context.lowValue),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
            ],
            color: context.theme.colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(context.normalValue)),
        child: _doctorInfoColumn(context, item),
      ),
    );
  }

  Column _doctorInfoColumn(BuildContext context, Doctor item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _doctorProfile(context, item),
            SizedBox(width: context.lowValue),
            Expanded(child: _doctorNameAndRate(item, context))
          ],
        ),
        SizedBox(height: context.lowValue),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExperienceRichText(experienceValue: item.experience.toString()),
            _availableClocksWrap(context)
          ],
        )
      ],
    );
  }

  CircleAvatar _doctorProfile(BuildContext context, Doctor item) {
    return CircleAvatar(
        radius: context.normalValue * 1.3,
        child: Image.asset((item.profileUrl ?? 'serena').toImagePng,
            fit: BoxFit.fill));
  }

  Column _doctorNameAndRate(Doctor item, BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(item.name ?? _notFound,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.w600)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
                  LocaleKeys.specialist
                      .paramLocale([(item.specialist ?? '').toString()]),
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.subtitle2!.copyWith(
                      letterSpacing: -0.2,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
          CustomRatingBar(
              initializeRating: item.rate,
              itemPadding: EdgeInsets.only(left: context.lowValue * 0.8))
        ],
      )
    ]);
  }

  Wrap _availableClocksWrap(BuildContext context) {
    return Wrap(
      spacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(Icons.history,
            size: context.normalValue,
            color: context.theme.colorScheme.onBackground),
        Text('02:00 am - 10:00 am',
            style: context.textTheme.headline2!.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.onBackground))
      ],
    );
  }
}
