import 'package:covid_19/locale/localizations.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RegionsPage extends StatefulWidget {
  final List<String> regions;
  final String lastUpdate;
  RegionsPage(this.regions, this.lastUpdate);
  @override
  _RegionsPageState createState() =>
      _RegionsPageState(this.regions, this.lastUpdate);
}

class _RegionsPageState extends State<RegionsPage> {
  final List<String> regions;
  final String lastUpdate;
  _RegionsPageState(this.regions, this.lastUpdate);
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _generateRegions(
      List<String> regionsNames, List<String> regionsValues) {
    List<Widget> childrens = [];
    for (int i = 0; i < 12; i++) {
      childrens.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black12.withOpacity(0.08), width: 1.0),
              borderRadius: BorderRadius.circular(2.0),
            ),
            onPressed: () => {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      child: AutoSizeText(
                    regionsNames[i],
                    style: TextStyle(
                        fontSize: 22.0,
                        color: i % 2 == 0
                            ? Colors.deepOrangeAccent
                            : Colors.blueAccent),
                    maxLines: 1,
                    maxFontSize: 22.0,
                    textAlign: TextAlign.center,
                    minFontSize: 2.0,
                  )),
                  SizedBox(height: 10.0),
                  SizedBox(
                      child: AutoSizeText(
                    (MyLocalizations.of(context).regionConfirmedCases ?? "") +
                        regionsValues[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.0, color: Colors.grey.withOpacity(0.9)
                        // fontWeight: FontWeight.w600,
                        ),
                    maxLines: 1,
                    maxFontSize: 18.0,
                    minFontSize: 2.0,
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    }
    return childrens;
  }

  @override
  Widget build(BuildContext context) {
    final regionsNames = [
      MyLocalizations.of(context).regionBeniMellal ?? "",
      MyLocalizations.of(context).regionCasa ?? "",
      MyLocalizations.of(context).regionDaraa ?? "",
      MyLocalizations.of(context).regionDakhla ?? "",
      MyLocalizations.of(context).regionFes ?? "",
      MyLocalizations.of(context).regionGuelmim ?? "",
      MyLocalizations.of(context).regionLaayoun ?? "",
      MyLocalizations.of(context).regionMarrakesh ?? "",
      MyLocalizations.of(context).regionOriental ?? "",
      MyLocalizations.of(context).regionRabat ?? "",
      MyLocalizations.of(context).regionSouss ?? "",
      MyLocalizations.of(context).regionTanger ?? "",
    ];

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
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: this._generateRegions(regionsNames, regions),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20.0,
                childAspectRatio: 3.1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
