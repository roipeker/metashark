import 'package:metashark/commons.dart';

class AppText extends Text {
  const AppText(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) : super(
          text,
          key: key,
          style: style,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );

  const AppText.loginTitle(
    String text, {
    Key? key,
  }) : super(
          text,
          style: kLoginFormTitleStyle,
          textAlign: TextAlign.center,
          key: key,
        );

  const AppText.error(
    String text, {
    Key? key,
  }) : super(
          text,
          style: kLoginFormErrorStyle,
          textAlign: TextAlign.center,
          key: key,
        );

  AppText.cupertino(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
  }) : super(
          text,
          style: const TextStyle(
            fontFamily: AppFonts.openSans,
            // fontFamily: '-apple-system',
            // fontFamilyFallback: ['BlinkMacSystemFont',"Segoe UI",'Roboto',],
          ).merge(style),
          textAlign: textAlign,
          key: key,
        );
}
