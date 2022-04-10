import 'color_schema.dart';
import 'text_theme.dart';

abstract class IAppTheme {
  CustomTextTheme customTextTheme = CustomTextTheme.instance;
  CustomColorSchema customColorSchema = CustomColorSchema.instance;
}
