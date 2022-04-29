import 'package:metashark/commons.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeBox extends StatelessWidget {
  final String code;
  final Color? color;
  final double size;
  final Color? backgroundColor;

  const QrCodeBox({
    Key? key,
    required this.code,
    this.color,
    this.backgroundColor,
    this.size = 210,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = QrImage(
      data: code,
      version: QrVersions.auto,
      size: size,
      padding: const EdgeInsets.all(20),
      gapless: false,
      // backgroundColor: Colors.grey.shade300,
      foregroundColor: color ?? AppColors.darkGrey,
    );
    if (backgroundColor != null) {
      return AppCard(
        borderRadius: kBorderRadius8,
        color: backgroundColor,
        padding: EdgeInsets.zero,
        child: child,
      );
    }
    return child;
  }
}
