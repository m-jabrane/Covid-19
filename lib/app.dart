import 'dart:async';
import 'package:covid_19/models/overview.model.dart';
import 'package:covid_19/utils/not_connected.dart';
import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'package:covid_19/locale/constant.dart' show languages;
import 'package:covid_19/locale/localizations.dart'
    show MyLocalizations, MyLocalizationsDelegate;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:covid_19/screens/emergency_state/emergency_state.dart';
import 'package:covid_19/screens/regions/regions.dart';
import 'package:covid_19/utils/utils.dart';
import 'package:covid_19/screens/overview/overview.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class App extends StatefulWidget {
  final Map<String, Map<String, String>> localizedValues;
  App(this.localizedValues);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _locale = 'fr';

  @override
  void initState() {
    super.initState();
  }

  onChangeLanguage() {
    if (this._locale == 'fr') {
      setState(() {
        this._locale = 'ar';
      });
    } else {
      if (this._locale == 'ar') {
        setState(() {
          this._locale = 'en';
        });
      } else {
        setState(() {
          this._locale = 'fr';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppFonts.primaryFont).copyWith(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        appBarTheme: AppBarTheme(
          color: AppColors.appBarColor,
          elevation: 0,
        ),
      ),
      home: HomePage(this.onChangeLanguage),
      locale: Locale(_locale),
      localizationsDelegates: [
        MyLocalizationsDelegate(widget.localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: languages.map((language) => Locale(language, '')),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onChangeLanguage;
  HomePage(this.onChangeLanguage);

  @override
  _HomePageState createState() => _HomePageState(this.onChangeLanguage);
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final VoidCallback onChangeLanguage;
  _HomePageState(this.onChangeLanguage);

  bool _isConnected = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  TabController _tabController;
  List<String> _regions = [];
  OverviewModel _overview;
  String _lastUpdate = "";
  bool _loader = true;

  @override
  void initState() {
    super.initState();
    this._initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        //print("Connected over wifi");
        this._fetch();
        setState(() => _isConnected = true);
        break;
      case ConnectivityResult.mobile:
        //print("Connected over mobile");
        this._fetch();
        setState(() => _isConnected = true);
        break;
      case ConnectivityResult.none:
        //print("Failed");
        setState(() => _isConnected = false);
        break;
      default:
        //print("Failed");
        setState(() => _isConnected = false);
        break;
    }
  }

  void _fetch() async {
    if (this._isConnected) {
      setState(() {
        this._loader = true;
      });
      http.Response response = await http.get(AppConstants.covidMarocUrl,
          headers: AppConstants.headersUrl);
      dom.Document document = parser.parse(response.body);

      // last update
      String lastUpdate = document
          .querySelector("div.ms-rtestate-field tbody")
          .children
          .elementAt(0)
          .querySelector("td p")
          .text
          .trim()
          .replaceAll(new RegExp(r' '), "");

      // recovered
      String recovered = document
          .querySelector("div.ms-rtestate-field tbody")
          .children
          .elementAt(1)
          .children
          .elementAt(0)
          .querySelector('p')
          .firstChild
          .text;

      // deaths
      String deaths = document
          .querySelector("div.ms-rtestate-field tbody")
          .children
          .elementAt(1)
          .children
          .elementAt(0)
          .querySelector("p span")
          .text;

      // confirmed cases
      String confirmedCases = document
          .querySelector("div.ms-rtestate-field tbody")
          .children
          .elementAt(1)
          .children
          .elementAt(1)
          .querySelector("p")
          .text;

      // excluded cases
      String excludedCases = document
          .querySelector("div.ms-rtestate-field tbody")
          .children
          .elementAt(1)
          .children
          .elementAt(2)
          .querySelector("p span")
          .text;

      OverviewModel tempOverView =
          new OverviewModel(confirmedCases, deaths, recovered, excludedCases);

      // regions values
      List<String> tempRegions = [];
      for (int i = 1;
          i < document.querySelector("div.ms-rteTable-6 tbody").children.length;
          i++) {
        tempRegions.add(document
            .querySelector("div.ms-rteTable-6 tbody")
            .children
            .elementAt(i)
            .querySelector("td h2")
            .text);
      }

      this.setState(() {
        this._overview = tempOverView;
        this._regions = tempRegions;
        this._lastUpdate = lastUpdate;
        this._loader = false;
      });
    } else {
      this._initConnectivity();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      MyLocalizations.of(context).tabOverview ?? "",
      MyLocalizations.of(context).tabRegions ?? "",
      MyLocalizations.of(context).tabQuarantine ?? "",
    ];
    var tabBar = TabBar(
      controller: _tabController,
      indicatorColor: Colors.white,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0),
        insets: EdgeInsets.symmetric(horizontal: 55.0),
      ),
      labelColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(
          fontSize: 15.0,
          fontFamily: AppFonts.primaryFont,
          fontWeight: FontWeight.bold),
      unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.3),
      tabs: tabs.map((tabName) => Tab(text: tabName)).toList(),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(null, 60.0),
        child: Container(
            padding: EdgeInsets.only(top: 15.0),
            child: AppBar(
              leading: IconButton(
                onPressed: onChangeLanguage,
                icon: Icon(
                  LineIcons.language,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      MyLocalizations.of(context).appNameCovid ?? "",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      MyLocalizations.of(context).appNameMorocco ?? "",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.normal),
                    ),
                  ]),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(right: 10.0),
                  onPressed: () => this._fetch(),
                  icon: Icon(
                    LineIcons.refresh,
                    color: Colors.black,
                    size: 24.0,
                  ),
                )
              ],
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            tabBar,
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.only(top: 20.0),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    this._isConnected
                        ? (this._loader
                            ? Center(
                                child: CircularProgressIndicator(
                                backgroundColor:
                                    Colors.blueAccent.withOpacity(0.25),
                                strokeWidth: 3.5,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.blueAccent),
                              ))
                            : OverviewPage(this._overview, this._lastUpdate))
                        : NotConnected(AppImages.washHand),
                    this._isConnected
                        ? (this._loader
                            ? Center(
                                child: CircularProgressIndicator(
                                backgroundColor:
                                    Colors.blueAccent.withOpacity(0.25),
                                strokeWidth: 3.5,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.blueAccent),
                              ))
                            : RegionsPage(this._regions, this._lastUpdate))
                        : NotConnected(AppImages.quarantine),
                    EmergencyState()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
