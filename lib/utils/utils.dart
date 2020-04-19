import 'dart:ui';
import 'package:flutter/material.dart';

class AppConstants {
  static const appName = "Covid-19 Maroc";
  static const endEmergencyStateDate = "18H00 20-05-2020";
  static const stayAtHomeAR = "خليك_في_دارك#";
  static const stayAtHomeEN = "#stay_at_home";
  static const stayAtHomeFR = "#reste_chez_toi";
  static const covidMarocUrl = "http://www.covidmaroc.ma/pages/Accueil.aspx";
  static const headersUrl = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36'
  };
}

class AppFonts {
  static const primaryFont = "CarosSoft";
}

class AppColors {
  static const primaryColor = const Color(0xFF353434);
  static const primaryLightColor = const Color(0xFFEEEDED);
  static const statusBarColor = Colors.white;
  static const appBarColor = Colors.white;
  static const scaffoldColor = Colors.white;
}

class AppImages {
  static const washHand = "assets/images/wash-hand.png";
  static const quarantine = "assets/images/quarantine.png";
}
