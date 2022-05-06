import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get toImagePng => 'assets/images/$this.png';
  String get toImageJpg => 'assets/images/$this.jpg';

  String get toIconPng => 'assets/icons/$this.png';

  String get doctorName => 'Dr. $this';
  String get dolarPrice => '\$ $this';

  String get networkUrl => 'http://10.0.2.2:3000/$this';

  String get locale => this.tr();
  String paramLocale(List<String> args) => this.tr(args: args);

  bool get emailRegex => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(this);
}
