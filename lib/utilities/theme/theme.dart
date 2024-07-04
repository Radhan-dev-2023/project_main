import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightPrimaryColor = Color(0xFFFAFAFA);

  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Color(0xFF232730);
  static const Color _appbarColorLight = Color(0xFFFAFAFA);
// 0E1330
// 4D84BD button color
  static const Color _darkPrimaryColor = Color(0xFF060B27);
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  //  static final Color _appbarColorDark = Colors.blueGrey.shade800;
  static const Color _appbarColorDark = Color(0xFF060B27);

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color(0xFF4D84BD);

  // *****************
  // Text Style - light
  // *****************
  static final TextStyle _lightHeadingText = GoogleFonts.roboto(
    color: _lightTextColorPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle _lightBodyText = GoogleFonts.roboto(
    color: _lightTextColorPrimary,
    // fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyeTextStyle,
  );

// *****************
// Theme light/dark
// *****************

  static final ThemeData lightTheme = ThemeData(
    cardTheme: const CardTheme(
      elevation: 5, surfaceTintColor: Colors.white, color: Colors.white,
      // color: Color(0xFFFAF9F6), // Set the background color for cards
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      // fillColor: Colors.grey.withOpacity(0.2),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: const BorderSide(color: Color(0xFF060B27)),
      ),
      // errorStyle: const TextStyle(color: Color(0xFF060B27)),
      // errorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(13.sp),
      //   borderSide: const BorderSide(color: Color(0xFF0E1330)),
      // ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: const BorderSide(color: Color.fromARGB(255, 192, 191, 191)
            // color: _lightTextColorPrimary,
            // Use accentColor for focus color
            ),
      ),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: AppBarTheme(
        color: _appbarColorLight,
        iconTheme: const IconThemeData(color: Colors.black),
        surfaceTintColor: _appbarColorLight,
        titleTextStyle: _lightHeadingText),
    colorScheme: ColorScheme.light(
      primary: _lightOnPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFF4D84BD),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
    // iconButtonTheme: IconButtonThemeData(
    //   style: ButtonStyle(
    //     iconColor: MaterialStateProperty.all<Color>(
    //       Colors.white,
    //     ), // Set your desired icon color
    //   ),
    // ),

    cardTheme: const CardTheme(
      elevation: 6,
      color: Color(0xFF0E1330), // Set the background color for cards
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor:
            Color(0xFF060B27) // Set the Bottom Sheet background color
        ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFF0E1330),
      filled: true,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.sp),
        borderSide: const BorderSide(
            color: Colors.grey // Use accentColor for focus color
            ),
      ),
      // focusedBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(color: Colors.white),
      // ),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: _darkThemeHeadingTextStyle,
      color: _appbarColorDark,
      iconTheme: const IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _accentColor,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorDark),
    buttonTheme: ButtonThemeData(
      // buttonColor: Colors.blueGrey[800],
      buttonColor: const Color(0xFF4D84BD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
    ),
  );
}
