import 'package:covid_19/locale/localizations.dart';
import 'package:covid_19/utils/utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import './adv_countdown.dart';
import 'package:auto_size_text/auto_size_text.dart';

class EmergencyState extends StatefulWidget {
  @override
  _EmergencyStateState createState() => _EmergencyStateState();
}

class _EmergencyStateState extends State<EmergencyState> {
  final DateTime alarmDate = DateTime(2020, 04, 20, 18, 00);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = AdvCountdown(futureDate: alarmDate);

    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 60.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          (MyLocalizations.of(context).quarantineDate ?? "") +
                              AppConstants.endEmergencyStateDate,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.redAccent),
                        ))
                      ]),
                ],
              ),
            ),
          ),
          Directionality(textDirection: TextDirection.ltr, child: list),
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                          //width: MediaQuery.of(context).size.width * 0.2,
                          child: AutoSizeText(
                        AppConstants.stayAtHomeFR.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        maxFontSize: 15.0,
                        overflow: TextOverflow.fade,
                        minFontSize: 2.0,
                      )))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: AutoSizeText(
                      AppConstants.stayAtHomeAR,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      maxFontSize: 15.0,
                      overflow: TextOverflow.fade,
                      minFontSize: 2.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: AutoSizeText(
                      AppConstants.stayAtHomeEN.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      maxFontSize: 15.0,
                      overflow: TextOverflow.fade,
                      minFontSize: 2.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
