import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../extensions/context_extension.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar(
      {Key? key, this.itemSize, this.initializeRating, this.onRatingUpdate})
      : super(key: key);
  final double? itemSize;
  final double? initializeRating;
  final Function()? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initializeRating ?? 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize ?? context.height * 0.025,
      itemBuilder: (context, _) =>
          Icon(Icons.star, color: context.theme.colorScheme.secondary),
      onRatingUpdate: (rating) {
        onRatingUpdate;
      },
    );
    ;
  }
}
