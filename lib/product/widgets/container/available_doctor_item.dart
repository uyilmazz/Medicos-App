import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../view/doctor/model/doctor.dart';
import '../text/fitted_box.dart';

class AvailabeDoctorItem extends StatelessWidget {
  const AvailabeDoctorItem({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor;
  final String _defaultProfilImage = 'doctor_profile';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.normalValue, vertical: context.lowValue),
      width: context.width * 0.48,
      height: context.height * 0.21,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, color: context.theme.colorScheme.surface)
          ],
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _avatarAndName(context),
          SizedBox(height: context.lowValue),
          CustomFittedBox(context,
              text: LocaleKeys.specialist
                  .paramLocale([(doctor.specialist ?? '').toString()])),
          SizedBox(height: context.lowValue),
          Text(LocaleKeys.experience.locale,
              style: context.textTheme.subtitle2!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w600)),
          CustomFittedBox(context,
              text: (LocaleKeys.years
                  .paramLocale([(doctor.experience ?? 0).toString()]))),
          SizedBox(height: context.lowValue),
          _ratingBar(context)
        ],
      ),
    );
  }

  Widget _avatarAndName(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundImage: AssetImage(doctor.profileUrl != null
                ? doctor.profileUrl!.toImagePng
                : _defaultProfilImage.toImagePng),
            radius: context.height * 0.033),
        SizedBox(width: context.lowValue),
        Flexible(
          child: Text(doctor.name ?? '',
              style: context.textTheme.subtitle2!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
              softWrap: false,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }

  RatingBar _ratingBar(BuildContext context) {
    return RatingBar.builder(
      initialRating: doctor.rate ?? 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: context.height * 0.025,
      itemBuilder: (context, _) =>
          Icon(Icons.star, color: context.theme.colorScheme.secondary),
      onRatingUpdate: (rating) {},
    );
  }
}
