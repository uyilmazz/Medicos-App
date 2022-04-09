extension StringExtension on String {
  String get toImagePng => 'assets/images/$this.png';
  String get toImageJpg => 'assets/images/$this.jpg';
}
