import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

CupertinoThemeData get lightThemeCupertino => const CupertinoThemeData(
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
          fontFamily: AppFonts.openSans,
          fontFamilyFallback: AppFonts.fallback,
        ),
      ),
    );

ThemeData get lightTheme {
  return ThemeData(
    fontFamily: 'Open Sans',
    brightness: Brightness.light,
    dividerTheme: DividerThemeData(
      color: AppColors.appbarIconGrey.withOpacity(.12),
      space: 1,
      thickness: 1,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((e) {
        if (e.contains(MaterialState.selected)) {
          return AppColors.primaryPurple;
        } else {
          return const Color(0xffB3B3B3);
        }
      }),
      trackColor: MaterialStateProperty.resolveWith((e) {
        if (e.contains(MaterialState.selected)) {
          return AppColors.primaryPurple.withOpacity(.4);
        } else {
          return const Color(0xffB3B3B3).withOpacity(.4);
        }
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((e) {
        if (e.contains(MaterialState.selected)) {
          return AppColors.primaryPurple;
        } else {
          return const Color(0xffB3B3B3);
        }
      }),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      primary: Colors.purple,
      background: AppColors.scaffold,
      onBackground: AppColors.darkGrey,
    ),
    scaffoldBackgroundColor: AppColors.scaffold,
    primaryColor: AppColors.primaryPurple,
    // primaryColor: AppColors.scaffold,
    // primaryColor: Colors.white,
    // pageTransitionsTheme: PageTransitionsTheme(
    //   builders: getPageTransitionBuilders(),
    // ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryPurple,
      refreshBackgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.darkGrey,
      // elevation: 3,
      // shadowColor: Colors.black12,
      shadowColor: AppColors.cardShadow.withOpacity(.15),
      centerTitle: true,
      titleTextStyle: kAppbarTitleStyle,
      elevation: 4,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primaryPurple,
      unselectedLabelColor: AppColors.darkGrey,
      labelStyle: kTabBarLabel,
      unselectedLabelStyle: kTabBarLabel,
      // indicator: BoxDecoration(
      //   color: AppColors.primaryPurple,
      //   borderRadius: kBorderRadius8,
      // ),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffold,
      elevation: 0,
      selectedItemColor: AppColors.primaryPurple,
      unselectedItemColor: AppColors.appbarIconGrey,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 20),
      unselectedIconTheme: IconThemeData(size: 20),
      selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      unselectedLabelStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryPurple,
        elevation: 0,
        padding: kPadH16,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // side: BorderSide(),
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius4),
        alignment: Alignment.center,
        // visualDensity: VisualDensity.comfortable,
        // minimumSize: const Size(50, 50),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: kBorder8,
      // shadowColor: AppColors.cardShadow,
      // shadowColor: AppColors.cardShadow.withOpacity(.22),
      shadowColor: AppColors.cardShadow.withOpacity(.42),
      margin: EdgeInsets.zero,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(44, 44),
        maximumSize: Size(double.infinity, 64),
        backgroundColor: Colors.transparent,
        primary: AppColors.primaryPurple,
        padding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius4),
        side: BorderSide(color: AppColors.primaryPurple),
        // onSurface: Colors.red,
        textStyle: TextStyle(
          // color: Color(0xff7367f0),
          color: Colors.red,
          fontSize: 14,
          fontFamily: "Open Sans",
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    /// small label buttons?
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.primaryPurple,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      hoverColor: AppColors.primaryPurple.withOpacity(.04),
      filled: true,
      hintStyle: kTextFieldHintStyle,
      border: OutlineInputBorder(
        borderRadius: kBorderRadius8,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: kBorderRadius8,
        borderSide: const BorderSide(
          color: Color(0xff9E95F5),
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: kBorderRadius8,
        borderSide: BorderSide(
          color: const Color(0xff5E5873).withOpacity(.12),
          width: 1,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    ),
  );
}

ThemeData get darkTheme {
  return ThemeData(
    fontFamily: 'OpenSans',
    brightness: Brightness.dark,
  );
}
