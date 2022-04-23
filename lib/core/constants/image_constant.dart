class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get searchImage => 'search';
  String get loginImage => 'login_view';
  String get registerImage => 'register_view';
  String get forgotImage => 'forgot_view';
  String get loginFaceBookIcon => 'facebook';
  String get loginGoogleIcon => 'google';
  String get successVerificationImage => 'success_verification';
}