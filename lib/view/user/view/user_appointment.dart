import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../product/widgets/row/back_arrow_app_bar.dart';
import '../view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/rating_bar/rating_bar.dart';
import '../../../product/widgets/button/custom_gradient_button.dart';

class UserAppointment extends StatelessWidget {
  const UserAppointment({Key? key}) : super(key: key);

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
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return context.watch<UserViewModel>().isUpcoming
                        ? _appointmentUpcomingItem(context)
                        : _appointmentPastItem(context);
                  }),
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

  Widget _appointmentUpcomingItem(BuildContext context) {
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
            child: _appointmentItemContent(context),
          ),
          _upComingCancelButton(context)
        ],
      ),
    );
  }

  Widget _appointmentPastItem(BuildContext context) => Container(
        padding: EdgeInsets.all(context.lowValue * 1.5),
        margin: EdgeInsets.only(bottom: context.mediumValue),
        height: context.height * 0.17,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
            ],
            color: context.theme.colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(context.normalValue)),
        child: _appointmentItemContent(context),
      );

  Column _appointmentItemContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _doctorProfileAvatar(context),
            SizedBox(width: context.lowValue),
            Expanded(child: _nameAndSpecialist(context)),
          ],
        ),
        SizedBox(height: context.normalValue),
        _dateIconText(context, 'Thursday', Icons.date_range_outlined),
        SizedBox(height: context.lowValue),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _dateIconText(context, '02:00 pm', Icons.update_outlined),
            CustomRatingBar(
                initializeRating: 5, itemSize: context.normalValue * 1.3)
          ],
        )
      ],
    );
  }

  CircleAvatar _doctorProfileAvatar(BuildContext context) {
    return CircleAvatar(
        radius: context.normalValue * 1.3,
        child: Image.asset('doctor_profile'.toImagePng, fit: BoxFit.fill));
  }

  Column _nameAndSpecialist(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Dr.Jacob Jane',
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.w600)),
      Text('Heart Specialist',
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

  Positioned _upComingCancelButton(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: context.width * 0.03,
        child: SizedBox(
            height: context.height * 0.053,
            child: GradientButton(
                buttonText: LocaleKeys.userAppointment_cancel.locale,
                width: context.width * 0.25)));
  }
}
