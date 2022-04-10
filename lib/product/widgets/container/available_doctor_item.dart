import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../text/fitted_box.dart';

class AvailabeDoctorItem extends StatelessWidget {
  const AvailabeDoctorItem({Key? key}) : super(key: key);

  final String _doctorName = 'Dr.Johnmmmm';
  final String _experienceText = 'Experience';
  final String _experienceValue = '5 years';
  final String _specialist = 'Heart Specialist';
  final String _profileImage = 'doctor_profile';
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
          CustomFittedBox(context, text: _specialist),
          SizedBox(height: context.lowValue),
          Text(_experienceText,
              style: context.textTheme.subtitle2!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w600)),
          CustomFittedBox(context, text: _experienceValue),
          SizedBox(height: context.lowValue),
          _ratingBar(context)
        ],
      ),
    );
  }

  RatingBar _ratingBar(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
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

  Widget _avatarAndName(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundImage: AssetImage(_profileImage.toImagePng),
            radius: context.height * 0.033),
        SizedBox(width: context.lowValue),
        Flexible(
          child: Text(_doctorName,
              style: context.textTheme.subtitle2!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
              softWrap: false,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}