import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/image_constant.dart';
import '../../../view/doctor/model/appointment.dart';
import '../../../view/doctor/view_model/doctor_view_model.dart';
import '../../../view/home/view/home_page.dart';
import '../../../view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../view/doctor/model/doctor.dart';

class AppointmentConfirmDialog extends StatelessWidget {
  AppointmentConfirmDialog(
      {Key? key, required this.doctor, required this.appointment})
      : super(key: key);
  final Doctor doctor;
  final Appointment appointment;

  final viewModel = DoctorViewModel();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(bottom: context.height * 0.1),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: context.height * 0.44,
        width: context.width * 0.55,
        child: Stack(
          children: [
            _showDialogInsideContainer(context),
            _dialogCircleAvatar(context)
          ],
        ),
      ),
    );
  }

  Container _showDialogInsideContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: context.height * 0.05),
      height: context.height * 0.4,
      decoration: BoxDecoration(
          border: Border.all(color: context.theme.colorScheme.onSecondary),
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.theme.colorScheme.onSecondary,
                context.theme.colorScheme.onSecondary.withOpacity(0.1)
              ]),
          borderRadius: BorderRadius.circular(context.mediumValue)),
      child: _showDialogContent(context, viewModel),
    );
  }

  Column? _showDialogContent(BuildContext context, DoctorViewModel viewModel) {
    if (appointment.date != null) {
      DateTime date = DateTime.parse(appointment.date!);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.height * 0.09),
          Text('Dr.${doctor.name ?? ''}',
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w600)),
          SizedBox(height: context.normalValue * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _confirmItem(context, DateFormat.d().format(date),
                  DateFormat.E().format(date), Icons.date_range_outlined),
              SizedBox(width: context.normalValue),
              _confirmItem(
                  context,
                  DateFormat('hh:mm').format(date),
                  DateFormat('a').format(date).toLowerCase(),
                  Icons.watch_later_outlined),
            ],
          ),
          SizedBox(height: context.mediumValue),
          _confirmButton(context, viewModel)
        ],
      );
    }
    return null;
  }

  Widget _confirmItem(BuildContext context, String textOne, String textTwo,
          IconData icon) =>
      Container(
          width: context.width * 0.17,
          height: context.height * 0.11,
          color: Colors.transparent,
          child: Stack(
            children: [
              _stackContentContainer(context, textOne, textTwo),
              _confirmItemIcon(context, icon)
            ],
          ));

  Container _stackContentContainer(
      BuildContext context, String textOne, String textTwo) {
    return Container(
      margin: EdgeInsets.only(top: context.height * 0.02),
      width: context.width * 0.16,
      height: context.height * 0.9,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: _confirmItemContent(textOne, context, textTwo),
    );
  }

  Wrap _confirmItemContent(
          String textOne, BuildContext context, String textTwo) =>
      Wrap(
        spacing: 4,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
          Text(textOne,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w600)),
          Text(textTwo,
              style: context.textTheme.subtitle2!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      );

  Positioned _confirmItemIcon(BuildContext context, IconData icon) =>
      Positioned(
          top: 2,
          left: context.normalValue * 1.1,
          child: Icon(icon, size: context.normalValue * 1.6));

  GestureDetector _confirmButton(
      BuildContext context, DoctorViewModel viewModel) {
    return GestureDetector(
      onTap: () async {
        bool result = await viewModel.makeAppointment(
            context.read<UserViewModel>().user?.sId ?? '',
            appointment.id ?? '');
        result
            ? Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()))
            : Navigator.of(context).pop();
      },
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.12,
              vertical: context.lowValue * 1.3),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, context.normalValue),
                    blurRadius: 56,
                    color: context.theme.colorScheme.primary.withOpacity(0.35))
              ],
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    context.theme.colorScheme.primary,
                    context.theme.colorScheme.primary.withOpacity(0.3)
                  ]),
              borderRadius: BorderRadius.circular(context.lowValue * 1.7)),
          child: Text(LocaleKeys.doctorAppointment_confirm.locale,
              textAlign: TextAlign.center,
              style: context.textTheme.headline2!.copyWith(
                  fontSize: 18,
                  color: context.theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.w700))),
    );
  }

  Positioned _dialogCircleAvatar(BuildContext context) {
    return Positioned(
        left: context.width * 0.23,
        top: context.height * 0.00,
        child: ClipOval(
            child: doctor.profilUrl != null
                ? Image.network(doctor.profilUrl!.networkUrl,
                    height: context.height * 0.12,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                        ImageConstants.instance.profileImage.toImagePng,
                        height: context.height * 0.12,
                        fit: BoxFit.fill),
                    fit: BoxFit.fill)
                : Image.asset(ImageConstants.instance.profileImage.toImagePng,
                    height: context.height * 0.12, fit: BoxFit.fill)));
  }
}
