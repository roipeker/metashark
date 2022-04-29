import 'package:metashark/commons.dart';

export 'colors.dart';

/// item separator.
const kGap1 = Gap(1);
const kGap4 = Gap(4.0);
const kGap6 = Gap(6.0);
const kGap8 = Gap(8.0);
const kGap12 = Gap(12);
const kGap10 = Gap(10);
const kGap16 = Gap(16);
const kGap24 = Gap(24);
const kGap32 = Gap(32);

const kMaterialRectBorder = ContinuousRectangleBorder();

/// elevated button
final kBorderRadius4 = BorderRadius.circular(4);

final kBorderRadius8 = BorderRadius.circular(8);
final kBorderRadius12 = BorderRadius.circular(12);
final kBorderRadius16 = BorderRadius.circular(16);
final kBorderRadius20 = BorderRadius.circular(20);
final kBorderRadiusPill = BorderRadius.circular(100);

const kRadius20 = Radius.circular(20);

/// used in Settings tile.
const kPadH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
const kPadH16V4 = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
const kPadH16 = EdgeInsets.symmetric(horizontal: 16);
const kPad16 = EdgeInsets.all(16);
const kPad32 = EdgeInsets.all(32);
const kPad8 = EdgeInsets.all(8);
const kPad4 = EdgeInsets.all(4);
const kEmptyWidget = SizedBox.shrink();

/// divider for settings panel
final kDivider1 = const Divider(
  height: 1,
  thickness: 1,
);

const kDividerSettingsTile = Divider(
  height: 0,
  thickness: 0,
  indent: 16,
  endIndent: 16,
);

final kBorderPill = RoundedRectangleBorder(
  borderRadius: kBorderRadiusPill,
);
final kBorder8 = RoundedRectangleBorder(
  borderRadius: kBorderRadius8,
);
// Finance-top card
final kBorder12 = RoundedRectangleBorder(
  borderRadius: kBorderRadius12,
);

final kBinaryTreeCircleButtonStyle = OutlinedButton.styleFrom(
  shape: CircleBorder(),
  backgroundColor: Colors.white,
);

/// button style.
final kElevatedButtonSettings = ElevatedButton.styleFrom(
  elevation: 4,
  padding: kPad16,
  primary: Colors.white,
  shadowColor: const Color(0xff5E5873).withOpacity(.22),
  splashFactory: InkRipple.splashFactory,
// onPrimary: Color(0xff5E5873).withOpacity(.2),
  onPrimary: Colors.grey[400],
  shape: RoundedRectangleBorder(
    borderRadius: kBorderRadius8,
  ),
);

final kElevatedButtonPrimary = ElevatedButton.styleFrom(
  primary: AppColors.primaryPurple,
  onPrimary: Colors.white,
  minimumSize: Size(50, 50),
  // fixedSize: Size(0, 50),
  elevation: 0,
);
final kElevatedButtonSecondary = ElevatedButton.styleFrom(
  primary: Colors.white,
  onPrimary: AppColors.primaryPurple,
  fixedSize: Size(0, 50),
  // maximumSize: Size(double.infinity, 50),
  // minimumSize: Size(50, 50),
  elevation: 0,
);

final kElevatedButtonPrimarySmall = kElevatedButtonPrimary.copyWith(
  maximumSize: MaterialStateProperty.all(Size(double.infinity, 35)),
  minimumSize: MaterialStateProperty.all(Size(35, 35)),
  textStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.w500)),
);

final kElevatedButtonPrimaryPill = kElevatedButtonPrimary.copyWith(
  shape: MaterialStateProperty.all(kBorderPill),
);

final kElevatedButtonSecondaryPill = kElevatedButtonSecondary.copyWith(
  shape: MaterialStateProperty.all(kBorderPill),
);

final kTextButtonStyleAccessory = TextButton.styleFrom(
  textStyle: const TextStyle(
    color: Color(0xff7367f0),
    fontSize: 14,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.w600,
  ),
);

/// forgot password.
final kTextButtonStyleTiny = TextButton.styleFrom(
  textStyle: const TextStyle(
    color: Color(0xff7367f0),
    fontFamily: "Open Sans",
    fontSize: 10,
  ),
);

final kTextButtonStyleWalletBalance = TextButton.styleFrom(
  primary: AppColors.appbarIconGrey,
  shape: kMaterialRectBorder,
  padding: const EdgeInsets.all(16),
  textStyle: const TextStyle(
    // color: AppColors.appbarIconGrey,
    fontSize: 14,
  ),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
);

final kOutlinedButtonBaseStyle = OutlinedButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: 28),
);
const kFormLabeledStyle = TextStyle(
  color: Color(0xff5e5873),
  fontSize: 12,
);
const kTextFieldHintStyle = TextStyle(
  color: Color(0xffb9b9c3),
  fontSize: 14,
);
const kTextFieldBottomStyle = TextStyle(
  color: Color(0xff7367f0),
  fontSize: 10,
);

const kAppbarTitleStyle = TextStyle(
  color: AppColors.darkGrey,
  fontSize: 14,
  fontFamily: "Open Sans",
  fontWeight: FontWeight.w600,
);

const kLoginFormTitleStyle = TextStyle(
  color: Color(0xff5e5873),
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

const kLoginFormErrorStyle = TextStyle(
  color: Color(0xffea5455),
  fontSize: 14,
  fontFamily: "Open Sans",
  fontWeight: FontWeight.w600,
);

const kSettingsTileGreenStyle = TextStyle(
  color: Color(0xff28c76f),
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const kTabBarLabel = TextStyle(
  fontSize: 14,
  fontFamily: "Open Sans",
  fontWeight: FontWeight.w600,
);

/// finance

const kFinanceAssetItemTitle = TextStyle(
  color: Color(0xff5e5873),
  fontSize: 14,
  fontFamily: "Open Sans",
  fontWeight: FontWeight.w600,
);
const kFinanceAssetItemSubtitle = TextStyle(
  color: Color(0xff5e5873),
  fontSize: 12,
);

const kWalletHistoryItemValueStyle = TextStyle(
  color: Color(0xff5e5873),
  fontSize: 14,
  fontFamily: "Open Sans",
  fontWeight: FontWeight.w600,
);

const kTextAccessoryStyle = TextStyle(
  color: AppColors.greyAccesoryIconColor,
  fontSize: 14,
  fontFamily: "Open Sans",
  fontWeight: FontWeight.w600,
);

const kBoxShadow4 = [
   BoxShadow(
    color: Color(0x1e5e5873),
    blurRadius: 8,
    offset: Offset(0, 4),
  ),
  BoxShadow(
    color: Color(0x195e5873),
    blurRadius: 3,
    offset: Offset(0, 2),
  ),
];
