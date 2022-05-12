import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/stack/search_box.dart';
import '../../../product/widgets/text/experience_rich_text.dart';
import '../../department/model/department.dart';
import '../model/doctor.dart';
import '../view_model/doctor_view_model.dart';
import 'doctor_profile.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key, this.department, this.searchText})
      : super(key: key);
  final Department? department;
  final String? searchText;

  final String _notFound = '';

  @override
  Widget build(BuildContext context) {
    return BaseView<DoctorViewModel>(
        viewModel: DoctorViewModel(),
        onModelReady: (model) {
          model.getDoctors(
              departmentId: department?.sId, searchText: searchText);
        },
        onPageBuilder: (context, viewModel) => Observer(
            builder: (context) => Scaffold(
                  body: Padding(
                    padding: context.appPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.lowValue),
                        const SearchBox(isBack: true),
                        SizedBox(height: context.normalValue * 1.5),
                        Text(
                            LocaleKeys.doctorList.paramLocale(
                                [department?.name ?? searchText ?? '']),
                            style: context.textTheme.headline6!.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        SizedBox(height: context.normalValue),
                        Expanded(
                          child: (viewModel.doctors != null &&
                                  viewModel.doctors!.isNotEmpty)
                              ? _doctorsListBuilder(context, viewModel)
                              : _emptyDoctorList(context),
                        )
                      ],
                    ),
                  ),
                )));
  }

  ListView _doctorsListBuilder(
      BuildContext context, DoctorViewModel viewModel) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: context.normalValue),
        itemCount: viewModel.doctors!.length,
        itemBuilder: (context, index) {
          return _doctorItem(context, viewModel.doctors![index]);
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
    return item.profilUrl != null
        ? CircleAvatar(
            radius: context.normalValue * 1.3,
            child: Image.network(item.profilUrl!.networkUrl,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                    ImageConstants.instance.profileImage.toImagePng,
                    fit: BoxFit.fill)))
        : CircleAvatar(
            radius: context.normalValue * 1.3,
            child: Image.asset(
                (ImageConstants.instance.profileImage.toImagePng),
                fit: BoxFit.fill));
  }

  Column _doctorNameAndRate(Doctor item, BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text((item.name ?? _notFound).doctorName,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.w600)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
                  LocaleKeys.specialist
                      .paramLocale([(item.department?.name ?? '').toString()]),
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.subtitle2!.copyWith(
                      letterSpacing: -0.2,
                      fontSize: 13,
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

  Center _emptyDoctorList(BuildContext context) {
    return Center(
        child: Text(
            LocaleKeys.doctorNotFound
                .paramLocale([department?.name ?? searchText ?? '']),
            textAlign: TextAlign.center,
            style: context.textTheme.headline6!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w600)));
  }
}
