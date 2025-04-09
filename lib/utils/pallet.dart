import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
  ),
  listTileTheme: ListTileThemeData(
      selectedColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
  bottomAppBarTheme:
      const BottomAppBarTheme(elevation: 0, color: Colors.transparent),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) => Colors.grey),
    thumbColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) => states.contains(WidgetState.focused) ||
                states.contains(WidgetState.selected)
            ? Colors.black
            : Colors.transparent),
  ),
  primaryColor: Colors.black,
  appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
      color: Colors.transparent,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: Colors.black)),
  textTheme: GoogleFonts.oxygenTextTheme(),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    prefixIconColor: Colors.grey,
    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
    border: OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(15)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(15)),
  ),
  tabBarTheme: TabBarTheme(
    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) =>
            states.contains(WidgetState.focused) ? null : Colors.transparent),
    indicator: const BoxDecoration(),
    labelPadding: EdgeInsets.zero,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  )),
  drawerTheme: const DrawerThemeData(elevation: 0),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.black),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.black)),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.black),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 0.5,
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: Colors.white)),
  fontFamily: GoogleFonts.oxygen().fontFamily,
  colorScheme: const ColorScheme.dark(),
  tabBarTheme: TabBarTheme(
    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) =>
            states.contains(WidgetState.focused) ? null : Colors.transparent),
    indicator: const BoxDecoration(),
    labelPadding: EdgeInsets.zero,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    textStyle: const TextStyle(color: Colors.black),
    backgroundColor: Colors.white,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  )),
);
