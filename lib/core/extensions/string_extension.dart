import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get toImagePng => 'assets/images/$this.png';
  String get toImageJpg => 'assets/images/$this.jpg';

  String get toIconPng => 'assets/icons/$this.png';

  String get locale => this.tr();
}
