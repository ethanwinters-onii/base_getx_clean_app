import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'text_theme.dart';

class DAppTheme {
  static ThemeData lightTheme = ThemeData(
      // Color theme
      brightness: Brightness.light,
      textTheme: DTextTheme.lightTextTheme,
      // fontFamily: "",
      useMaterial3: true,
      colorScheme: DColorSheme.lightColorScheme,
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: Color(0xFFF55050),
        trackShape: RoundedRectSliderTrackShape(),
        rangeTrackShape: RoundedRectRangeSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
        ),
        rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
        rangeTickMarkShape: RoundRangeSliderTickMarkShape(
          tickMarkRadius: 20,
        ),
        rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 12.0),
      ),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)));

  static ThemeData darkTheme = ThemeData(
      // Color Theme
      brightness: Brightness.dark,
      textTheme: DTextTheme.darkTextTheme,
      // fontFamily: "",
      useMaterial3: true,
      primaryColor: secondaryColor,
      colorScheme: DColorSheme.darkColorScheme,
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: Color(0xFFBD101C),
        trackShape: RoundedRectSliderTrackShape(),
        rangeTrackShape: RoundedRectRangeSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
        ),
        rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
        rangeTickMarkShape: RoundRangeSliderTickMarkShape(
          tickMarkRadius: 20,
        ),
        rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 12.0),
      ),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)));
}
