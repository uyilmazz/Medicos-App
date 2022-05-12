import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_widget.dart';
import '../view_model/doctor_view_model.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/custom_fab_button.dart';
import '../../../product/widgets/container/schedule_day_container.dart';
import '../../../product/widgets/dialog/appointment_confirm.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../../product/widgets/row/head_text_see_all.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/text/experience_rich_text.dart';
import '../model/appointment.dart';
import '../model/doctor.dart';

class DoctorAppointmentView extends StatelessWidget {
  const DoctorAppointmentView({Key? key, required this.doctor})
      : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return BaseView<DoctorViewModel>(
      viewModel: DoctorViewModel(),
      onModelReady: (model) {
        DateTime now = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);
        model.getAppointment(doctor.id, now.toIso8601String());
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _customFab(context, viewModel),
        body: Padding(
          padding: context.appPadding,
          child: SingleChildScrollView(
            child: Observer(builder: (context) {
              return Column(
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
                  _scheduleDayListView(context, viewModel),
                  SizedBox(height: context.mediumValue),
                  const HeadAndSeeAllText(
                      headText: LocaleKeys.doctorAppointment_availableTimings,
                      isSeeAll: false),
                  SizedBox(height: context.lowValue),
                  _morningSlotsColumn(
                      context,
                      LocaleKeys.doctorAppointment_morningSlots,
                      viewModel.moorningAppointments,
                      viewModel),
                  _afternoonSlotsColumn(
                      context,
                      LocaleKeys.doctorAppointment_afternoonSlots,
                      viewModel.afternoonAppointments,
                      viewModel),
                  _eveningSlotsColumn(
                      context,
                      LocaleKeys.doctorAppointment_eveningSlots,
                      viewModel.eveningAppointments,
                      viewModel),
                  SizedBox(height: context.height * 0.12)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Container _customFab(BuildContext context, DoctorViewModel viewModel) {
    return Container(
        margin: EdgeInsets.only(bottom: context.height * 0.04),
        child: CustomFabButton(
            onTap: () {
              viewModel.selectedAppointmentControl()
                  ? showDialog(
                      barrierColor: const Color(0xFFC4C4C4).withOpacity(0.55),
                      context: context,
                      builder: (context) => AppointmentConfirmDialog(
                          doctor: doctor,
                          appointment: viewModel.getConfirmAppointment()))
                  : null;
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
          _doctorProfileAvatar(context, doctor),
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
        child: doctor.profilUrl != null
            ? Image.network(doctor.profilUrl!.networkUrl, fit: BoxFit.fill)
            : Image.asset(ImageConstants.instance.profileImage.toImagePng));
  }

  Column _doctorInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dr.${doctor.name ?? ''}',
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w600)),
        Text(
            LocaleKeys.specialist
                .paramLocale([(doctor.department?.name ?? '').toString()]),
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.subtitle2!.copyWith(
                letterSpacing: -0.2,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        ExperienceRichText(experienceValue: doctor.experience.toString()),
        const Spacer(),
        CustomRatingBar(initializeRating: doctor.rate)
      ],
    );
  }

  Widget _scheduleDayListView(
          BuildContext context, DoctorViewModel viewModel) =>
      SizedBox(
        height: context.height * 0.09,
        child: ListView.builder(
            itemCount: viewModel.appointmentDayLenght,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DateTime date2 = DateTime(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day)
                  .add(Duration(days: index));
              return Observer(
                  builder: (context) => GestureDetector(
                        onTap: () async {
                          viewModel.changeScheduleDay(index);
                          viewModel.getAppointment(
                              doctor.id, date2.toIso8601String());
                        },
                        child: ScheduleDayContainer(
                            isSelected: index == viewModel.scheduleDayIndex,
                            dayText: DateFormat.E().format(date2).toString(),
                            dayValue: DateFormat.d().format(date2).toString()),
                      ));
            }),
      );

  Widget _morningSlotsColumn(BuildContext context, String headText,
          List<Appointment> slotItems, DoctorViewModel viewModel) =>
      Observer(
          builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(headText.locale,
                      style: context.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(height: context.lowValue),
                  Wrap(
                      spacing: context.normalValue * 1.5,
                      runSpacing: context.lowValue,
                      children: slotItems
                          .asMap()
                          .entries
                          .map((entry) => GestureDetector(
                                onTap: () {
                                  viewModel.changeSelectedHours(
                                      'morning', entry.key);
                                },
                                child: _slotItem(
                                    context,
                                    entry.value,
                                    viewModel.morningSelectedItemIndex ==
                                        entry.key),
                              ))
                          .toList()),
                  SizedBox(height: context.normalValue),
                ],
              ));

  Widget _afternoonSlotsColumn(BuildContext context, String headText,
          List<Appointment> slotItems, DoctorViewModel viewModel) =>
      Observer(
          builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(headText.locale,
                      style: context.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(height: context.lowValue),
                  Wrap(
                      spacing: context.normalValue * 1.5,
                      runSpacing: context.lowValue,
                      children: slotItems
                          .asMap()
                          .entries
                          .map((entry) => GestureDetector(
                                onTap: () {
                                  viewModel.changeSelectedHours(
                                      'afternoon', entry.key);
                                },
                                child: _slotItem(
                                    context,
                                    entry.value,
                                    viewModel.afternoonSelectedItemIndex ==
                                        entry.key),
                              ))
                          .toList()),
                  SizedBox(height: context.normalValue),
                ],
              ));

  Widget _eveningSlotsColumn(BuildContext context, String headText,
          List<Appointment> slotItems, DoctorViewModel viewModel) =>
      Observer(
          builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(headText.locale,
                      style: context.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(height: context.lowValue),
                  Wrap(
                      spacing: context.normalValue * 1.5,
                      runSpacing: context.lowValue,
                      children: slotItems
                          .asMap()
                          .entries
                          .map((entry) => GestureDetector(
                                onTap: () {
                                  viewModel.changeSelectedHours(
                                      'evening', entry.key);
                                },
                                child: _slotItem(
                                    context,
                                    entry.value,
                                    viewModel.eveningSelectedItemIndex ==
                                        entry.key),
                              ))
                          .toList()),
                  SizedBox(height: context.normalValue),
                ],
              ));

  Container _slotItem(BuildContext context, Appointment item, bool isSelected) {
    return Container(
      height: context.height * 0.037,
      width: context.width * 0.25,
      decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                      context.theme.colorScheme.tertiary,
                      context.theme.colorScheme.tertiary.withOpacity(0.1)
                    ])
              : null,
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.lowValue)),
      child: Center(
        child: Text(item.date == null ? '' : item.date!.dateString(),
            style: context.textTheme.subtitle2!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? context.theme.colorScheme.onSecondary
                    : context.theme.colorScheme.background)),
      ),
    );
  }
}
