import 'package:flutter/material.dart';
import 'package:medicos_app/core/constants/image_constant.dart';
import 'package:medicos_app/view/doctor/view/doctor_appointment.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../model/doctor.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor;
  final String _profileImage = 'doctor_profile';
  final String _availableHours = '02:00 am - 10:00 am';
  final String _availableDay = 'Monday till Friday';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: context.height * 0.04),
          child: CustomFabButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DoctorAppointmentView(
                          doctor: doctor,
                        )));
              },
              text: LocaleKeys.getAppointment.locale)),
      body: Padding(
        padding: context.appPadding,
        child: Column(
          children: [
            const BackArrowAppBar(),
            Stack(
              children: [
                _profileInfo(context),
                _profileAvatar(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _profileInfo(BuildContext context) {
    return Container(
      padding: context.appPadding,
      margin: EdgeInsets.only(top: context.height * 0.14),
      height: context.height * 0.73,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Column(
        children: [
          SizedBox(height: context.height * 0.04),
          Text(doctor.name != null ? doctor.name!.doctorName : '',
              style: context.textTheme.headline5!.copyWith(
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: context.lowValue),
          Text(
              LocaleKeys.specialist
                  .paramLocale([(doctor.department?.name ?? '').toString()]),
              style: context.textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.w600)),
          SizedBox(height: context.lowValue),
          CustomRatingBar(
              initializeRating: doctor.rate,
              itemSize: context.normalValue * 1.3,
              itemPadding: const EdgeInsets.only(left: 5)),
          SizedBox(height: context.normalValue),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _contactItem(context, 'audio-1', 'Audio'),
              _contactItem(context, 'video-1', 'Video'),
              _contactItem(context, 'chat-1', 'Chat'),
            ],
          ),
          SizedBox(height: context.normalValue),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(LocaleKeys.about.locale,
                  style: context.textTheme.headline5!
                      .copyWith(fontWeight: FontWeight.w600))),
          SizedBox(height: context.lowValue * 1.5),
          Text(doctor.about ?? '',
              style: context.textTheme.subtitle2!.copyWith(
                  fontSize: 15,
                  color: context.theme.colorScheme.onSurface.withAlpha(180),
                  fontWeight: FontWeight.w500)),
          SizedBox(height: context.lowValue * 1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _patientExperienceRateItem(context, LocaleKeys.patient,
                  (doctor.patience ?? 0).toString()),
              _patientExperienceRateItem(
                  context,
                  LocaleKeys.experience,
                  LocaleKeys.years
                      .paramLocale([(doctor.experience ?? 0).toString()])),
              _patientExperienceRateItem(context, LocaleKeys.ratings,
                  LocaleKeys.star.paramLocale([doctor.rate.toString()])),
            ],
          ),
          SizedBox(height: context.normalValue),
          _availableClocksWrap(context),
          Text(_availableDay,
              style: context.textTheme.headline2!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: context.theme.colorScheme.background.withAlpha(200)))
        ],
      ),
    );
  }

  Wrap _availableClocksWrap(BuildContext context) {
    return Wrap(
      spacing: context.lowValue,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(Icons.history,
            size: context.normalValue * 1.5,
            color: context.theme.colorScheme.background.withAlpha(200)),
        Text(_availableHours,
            style: context.textTheme.headline2!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.background.withAlpha(200)))
      ],
    );
  }

  Wrap _patientExperienceRateItem(
      BuildContext context, String headText, String value) {
    return Wrap(
      spacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.vertical,
      children: [
        Text(headText.locale,
            style: context.textTheme.subtitle1!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w700)),
        Text(value,
            style: context.textTheme.subtitle1!.copyWith(
                fontSize: 15,
                color: context.theme.colorScheme.background.withAlpha(200),
                fontWeight: FontWeight.w600))
      ],
    );
  }

  Wrap _contactItem(BuildContext context, String iconName, String text) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: context.lowValue,
      direction: Axis.vertical,
      children: [
        Image.asset(iconName.toIconPng,
            fit: BoxFit.fill, height: context.height * 0.05),
        Text(text,
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }

  Positioned _profileAvatar(BuildContext context) {
    return Positioned(
      left: context.width * 0.23,
      child: doctor.profilUrl != null
          ? CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: context.height * 0.1,
              backgroundImage: NetworkImage(doctor.profilUrl!.networkUrl))
          : CircleAvatar(
              radius: context.height * 0.1,
              backgroundImage:
                  AssetImage(ImageConstants.instance.profileImage.toImagePng)),
    );
  }
}
