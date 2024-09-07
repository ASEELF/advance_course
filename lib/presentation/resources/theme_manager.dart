
import 'package:flutter/material.dart';
import 'package:advanced_course/presentation/resources/fonts_manager.dart';
import 'package:advanced_course/presentation/resources/styles_manager.dart';
import 'package:advanced_course/presentation/resources/values_manager.dart';
import 'package:advanced_course/presentation/resources/color_manager.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: colorManager.primary,
    primaryColorLight: colorManager.primaryOpacity70,
    primaryColorDark: colorManager.darkPrimary,
    disabledColor: colorManager.grey1,
    // ripple color
    splashColor: colorManager.primaryOpacity70,
    // will be used in case of disabled button for example
    hintColor: colorManager.grey,
    // card view theme
    cardTheme: CardTheme(
        color: colorManager.white,
        shadowColor: colorManager.grey,
        elevation: AppSize.s4,
    ),
    // App bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: colorManager.primary,
        elevation: AppSize.s4,
        shadowColor: colorManager.primaryOpacity70,
        titleTextStyle: getRegularStyle(
            color: colorManager.white,
            fontSize: FontSize.s16)),
    // Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: colorManager.grey1,
        buttonColor: colorManager.primary,
        splashColor: colorManager.primaryOpacity70),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: colorManager.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // Text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: colorManager.darkGrey,
          fontSize: FontSize.s16),
      displayMedium: getMediumStyle(
          color: colorManager.lightGrey,
          fontSize: FontSize.s14),
      labelMedium: getRegularStyle(color: colorManager.grey1),
      bodyMedium: getMediumStyle(color: colorManager.grey)
    ),


    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle: getRegularStyle(color: colorManager.grey1),
      //label style
      labelStyle: getMediumStyle(color: colorManager.grey1),
      //error style
      errorStyle: getRegularStyle(color: colorManager.error),
      //enabled borders
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorManager.grey ,
          width: AppSize.s1_5,
      ),
        borderRadius:  const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorManager.grey , width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

        //focused borders
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(
  color: colorManager.grey ,
  width: AppSize.s1_5,
  ),
  borderRadius:  const BorderRadius.all(Radius.circular(AppSize.s8)),
  ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorManager.primary, width:  AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

  ),
    );
    //input decoration theme (text form field)



}