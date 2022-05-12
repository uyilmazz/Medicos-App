import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../doctor/model/appointment.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../../doctor/model/doctor.dart';
import '../view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/button/custom_gradient_button.dart';

class UserAppointment extends StatefulWidget {
  const UserAppointment({Key? key}) : super(key: key);

  @override
  State<UserAppointment> createState() => _UserAppointmentState();
}

class _UserAppointmentState extends State<UserAppointment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await context.read<UserViewModel>().getAppointmentByUserId();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.appPadding,
        child: Column(
          children: [
            BackArrowAppBar(
                centerText: LocaleKeys.userAppointment_myAppointments.locale),
            SizedBox(height: context.mediumValue),
            _headComingAndPassButton(context),
            SizedBox(height: context.normalValue),
            Flexible(
              child: context.watch<UserViewModel>().userAppointment.isNotEmpty
                  ? ListView.builder(
                      itemCount:
                          context.read<UserViewModel>().userAppointment.length,
                      itemBuilder: (context, index) {
                        Appointment currentAppointment = context
                            .read<UserViewModel>()
                            .userAppointment[index];
                        return context.watch<UserViewModel>().isUpcoming
                            ? _appointmentUpcomingItem(
                                context, currentAppointment)
                            : _appointmentPastItem(context, currentAppointment);
                      })
                  : Center(
                      child: Text('Appointment is Empty',
                          style: context.textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.theme.colorScheme.primary))),
            )
          ],
        ),
      ),
    );
  }

  Row _headComingAndPassButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientButton(
            buttonText: LocaleKeys.userAppointment_upcoming.locale,
            width: context.width * 0.4,
            isSelected: context.watch<UserViewModel>().isUpcoming,
            onTap: () {
              context.read<UserViewModel>().changeAppointment(true);
            }),
        SizedBox(width: context.normalValue),
        GradientButton(
            buttonText: LocaleKeys.userAppointment_past.locale,
            width: context.width * 0.4,
            isSelected: !context.watch<UserViewModel>().isUpcoming,
            onTap: () {
              context.read<UserViewModel>().changeAppointment(false);
            }),
      ],
    );
  }

  Widget _appointmentUpcomingItem(
      BuildContext context, Appointment appointment) {
    return Container(
      margin: EdgeInsets.only(bottom: context.mediumValue),
      height: context.height * 0.22,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(context.lowValue * 1.5),
            height: context.height * 0.19,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1, color: context.theme.colorScheme.surface)
                ],
                color: context.theme.colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(context.normalValue)),
            child: _appointmentItemContent(context, appointment),
          ),
          _upComingCancelButton(context, appointment)
        ],
      ),
    );
  }

  Widget _appointmentPastItem(BuildContext context, Appointment appointment) =>
      Container(
        padding: EdgeInsets.all(context.lowValue * 1.5),
        margin: EdgeInsets.only(bottom: context.mediumValue),
        height: context.height * 0.17,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
            ],
            color: context.theme.colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(context.normalValue)),
        child: _appointmentItemContent(context, appointment),
      );

  Column _appointmentItemContent(
      BuildContext context, Appointment appointment) {
    String dateString = DateTime.now().toIso8601String();
    DateTime date = DateTime.parse(appointment.date ?? dateString);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _doctorProfileAvatar(context, appointment),
            SizedBox(width: context.lowValue),
            Expanded(child: _nameAndSpecialist(context, appointment.doctor)),
          ],
        ),
        SizedBox(height: context.normalValue),
        _dateIconText(
            context, DateFormat.EEEE().format(date), Icons.date_range_outlined),
        SizedBox(height: context.lowValue),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _dateIconText(
                context,
                DateFormat('hh : mm a').format(date).toLowerCase(),
                Icons.update_outlined),
            CustomRatingBar(
                initializeRating: 5, itemSize: context.normalValue * 1.3)
          ],
        )
      ],
    );
  }

  Widget _doctorProfileAvatar(BuildContext context, Appointment appointment) {
    return ClipOval(
        child: appointment.doctor?.profilUrl != null
            ? Image.network(appointment.doctor!.profilUrl!.networkUrl,
                height: context.normalValue * 2.6,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                    ImageConstants.instance.profileImage.toImagePng,
                    height: context.normalValue * 2.6,
                    fit: BoxFit.fill),
                fit: BoxFit.fill)
            : Image.asset(ImageConstants.instance.profileImage.toImagePng,
                height: context.normalValue * 2.6, fit: BoxFit.fill));
  }

  Column _nameAndSpecialist(BuildContext context, Doctor? doctor) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Dr.${doctor?.name ?? ''}',
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.w600)),
      Text(
          LocaleKeys.specialist
              .paramLocale([(doctor?.department?.name ?? '').toString()]),
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.subtitle2!.copyWith(
              letterSpacing: -0.2, fontSize: 13, fontWeight: FontWeight.w500))
    ]);
  }

  Wrap _dateIconText(BuildContext context, String text, IconData icon) {
    return Wrap(
      spacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(icon, size: context.normalValue * 1.25),
        Text(text,
            style: context.textTheme.subtitle2!.copyWith(
                letterSpacing: -0.2,
                fontSize: 13,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  Positioned _upComingCancelButton(
      BuildContext context, Appointment appointment) {
    return Positioned(
        bottom: 0,
        right: context.width * 0.03,
        child: SizedBox(
            height: context.height * 0.053,
            child: GradientButton(
                onTap: () async {
                  final result = await context
                      .read<UserViewModel>()
                      .cancelAppointment(appointment.id ?? '');
                  if (result) {
                    context.read<UserViewModel>().getAppointmentByUserId();
                    _scaffoldMessage(context,
                        LocaleKeys.userAppointment_cancelAppointmentMessage);
                  } else {
                    _scaffoldMessage(context,
                        LocaleKeys.userAppointment_cancelNotAppointmentMessage);
                  }
                },
                buttonText: LocaleKeys.userAppointment_cancel.locale,
                width: context.width * 0.25)));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _scaffoldMessage(
          BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(text.locale,
              style: context.textTheme.subtitle1!
                  .copyWith(color: context.theme.colorScheme.primary))));
}
