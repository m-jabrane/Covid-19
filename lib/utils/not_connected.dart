import 'package:covid_19/locale/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotConnected extends StatelessWidget {
  final String _image;
  NotConnected(this._image);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    MyLocalizations.of(context).noInternetError ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5)),
                  )),
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    MyLocalizations.of(context).notConnectedError ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4)),
                  )),
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 45.0),
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    MyLocalizations.of(context).checkConnectionError ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4)),
                  )),
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Container(
              child: Image.asset(this._image, height: 70.0, width: 70.0)),
        ),
      ],
    );
  }
}
