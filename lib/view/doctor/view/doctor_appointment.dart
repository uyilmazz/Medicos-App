import 'package:flutter/material.dart';
import 'package:medicos_app/view/department/model/department.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/container/schedule_day_container.dart';
import '../../../product/widgets/dialog/appointment_confirm.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/contants/fake_appointment.dart';
import '../../../product/widgets/text/experience_rich_text.dart';
import '../model/doctor.dart';

class DoctorAppointmentView extends StatelessWidget {
  DoctorAppointmentView({Key? key}) : super(key: key);

  final Doctor _doctor = Doctor(
      name: "Serena",
      experience: 4,
      profilUrl: "doctor_profile",
      rate: 3.5,
      department: Department(name: "Heart"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _customFab(context),
        body: Padding(
          padding: context.appPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackArrowAppBar(
                    centerText:
                        LocaleKeys.doctorAppointment_appointment.locale),
                SizedBox(height: context.mediumValue),
                _doctorProfileCard(context),
                SizedBox(height: context.normalValue * 2),
                const HeadAndSeeAllText(
                    headText: LocaleKeys.doctorAppointment_schedule,
                    isSeeAll: false),
                SizedBox(height: context.lowValue),
                _scheduleDayListView(context),
                SizedBox(height: context.mediumValue),
                const HeadAndSeeAllText(
                    headText: LocaleKeys.doctorAppointment_availableTimings,
                    isSeeAll: false),
                SizedBox(height: context.lowValue),
                _slotsColumn(context, LocaleKeys.doctorAppointment_morningSlots,
                    FakeAppointmentConstant.morningSlots),
                _slotsColumn(
                    context,
                    LocaleKeys.doctorAppointment_afternoonSlots,
                    FakeAppointmentConstant.afternoonSlots),
                _slotsColumn(context, LocaleKeys.doctorAppointment_eveningSlots,
                    FakeAppointmentConstant.eveningSlots),
                SizedBox(height: context.height * 0.12)
              ],
            ),
          ),
        ));
  }

  Container _customFab(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: context.height * 0.04),
        child: CustomFabButton(
            onTap: () {
              showDialog(
                  barrierColor: const Color(0xFFC4C4C4).withOpacity(0.55),
                  context: context,
                  builder: (context) =>
                      AppointmentConfirmDialog(doctor: _doctor));
            },
            text: LocaleKeys.doctorAppointment_bookAppointment.locale));
  }

  Container _doctorProfileCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.lowValue * 1),
      height: context.height * 0.12,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Row(
        children: [
          _doctorProfileAvatar(context, _doctor),
          SizedBox(width: context.lowValue),
          Expanded(child: _doctorInfo(context))
        ],
      ),
    );
  }

  Widget _doctorProfileAvatar(BuildContext context, Doctor item) {
    return Container(
        height: context.height * 0.12,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset((item.profilUrl ?? 'profile').toImagePng,
            fit: BoxFit.fill));
  }

  Column _doctorInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dr.${_doctor.name ?? ''}',
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w600)),
        Text(
            LocaleKeys.specialist
                .paramLocale([(_doctor.department?.name ?? '').toString()]),
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.subtitle2!.copyWith(
                letterSpacing: -0.2,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        ExperienceRichText(experienceValue: _doctor.experience.toString()),
        const Spacer(),
        CustomRatingBar(initializeRating: _doctor.rate)
      ],
    );
  }

  SizedBox _scheduleDayListView(BuildContext context) {
    return SizedBox(
      height: context.height * 0.09,
      child: ListView.builder(
          itemCount: FakeAppointmentConstant.scheduleList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final currentDay = FakeAppointmentConstant.scheduleList[index];
            return ScheduleDayContainer(
                dayText: currentDay['dayText'],
                dayValue: currentDay['dayValue'].toString());
          }),
    );
  }

  Widget _slotsColumn(BuildContext context, String headText, List slotItems) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headText.locale,
              style: context.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: context.lowValue),
          Wrap(
              spacing: context.normalValue * 1.5,
              runSpacing: context.lowValue,
              children:
                  slotItems.map((item) => _slotItem(context, item)).toList()),
          SizedBox(height: context.normalValue),
        ],
      );

  Container _slotItem(BuildContext context, String item) {
    return Container(
      height: context.height * 0.037,
      width: context.width * 0.25,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.lowValue)),
      child: Center(
        child: Text(item,
            style: context.textTheme.subtitle2!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.background)),
      ),
    );
  }
}
