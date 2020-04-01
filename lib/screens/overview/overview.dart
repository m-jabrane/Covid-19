import 'package:covid_19/locale/localizations.dart';
import 'package:covid_19/models/overview.model.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class OverviewPage extends StatefulWidget {
  final OverviewModel overview;
  final String lastUpdate;
  OverviewPage(this.overview, this.lastUpdate);
  @override
  _OverviewPageState createState() =>
      _OverviewPageState(this.overview, this.lastUpdate);
}

class _OverviewPageState extends State<OverviewPage> {
  final OverviewModel overview;
  final String lastUpdate;
  _OverviewPageState(this.overview, this.lastUpdate);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
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
                          (MyLocalizations.of(context).lastUpdate ?? "") +
                              "${this.lastUpdate}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        )),
                      ]),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black12.withOpacity(0.08),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      onPressed: () => {},
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  child: AutoSizeText(
                                MyLocalizations.of(context)
                                        .overviewConfirmedCases ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 2.0,
                              )),
                              SizedBox(height: 10.0),
                              SizedBox(
                                  child: AutoSizeText(
                                this.overview.confirmed,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 70.0,
                                    fontWeight: FontWeight.normal),
                                maxLines: 1,
                                maxFontSize: 70.0,
                                minFontSize: 2.0,
                              )),
                            ],
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black12.withOpacity(0.08),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      onPressed: () => {},
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  child: AutoSizeText(
                                MyLocalizations.of(context).overviewDeaths ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 2.0,
                              )),
                              SizedBox(height: 10.0),
                              SizedBox(
                                  child: AutoSizeText(
                                this.overview.deaths,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 70.0,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.normal),
                                maxLines: 1,
                                maxFontSize: 70.0,
                                minFontSize: 2.0,
                              )),
                            ],
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black12.withOpacity(0.08),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      onPressed: () => {},
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  child: AutoSizeText(
                                MyLocalizations.of(context).overviewRecovered ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 2.0,
                              )),
                              SizedBox(height: 10.0),
                              SizedBox(
                                  child: AutoSizeText(
                                this.overview.recovered,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 70.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.normal),
                                maxLines: 1,
                                maxFontSize: 70.0,
                                minFontSize: 2.0,
                              )),
                            ],
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black12.withOpacity(0.08),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      onPressed: () => {},
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  child: AutoSizeText(
                                MyLocalizations.of(context).overviewExcluded ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 2.0,
                              )),
                              SizedBox(height: 10.0),
                              SizedBox(
                                  child: AutoSizeText(
                                this.overview.tested,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 70.0,
                                    color: Colors.deepOrangeAccent,
                                    fontWeight: FontWeight.normal),
                                maxLines: 1,
                                maxFontSize: 70.0,
                                minFontSize: 2.0,
                              )),
                            ],
                          ))),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20.0,
                childAspectRatio: 2.3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
