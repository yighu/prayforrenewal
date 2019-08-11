import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/add_user_dialog.dart';
import 'package:flutter_app/database/model/pray.dart';

import 'package:flutter_app/home_presenter.dart';
import 'package:flutter_app/prays.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements HomeContract {
  HomePresenter homePresenter;
  int prayid=1;
  int section=1;
  int mod=0;
  double s=20;
  List<List<Color>> mods=[[Color.fromRGBO(0, 0, 0, 0),Color.fromRGBO(255, 255, 255, 1)],[Color.fromRGBO(236, 240, 241, 1),Color.fromRGBO(0, 0, 0, 1)]];
  String version="ChiUNs";
  @override
  void initState() {
    super.initState();
    homePresenter = new HomePresenter(this);
  }

  displayRecord() {
    setState(() {});
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
    Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.center;

    return new InkWell(

      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            new Text('祷告',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _openAddUserDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddUserDialog().buildAboutDialog(context, this, false, null),
    );

    setState(() {});
  }

  List<Widget> _buildActions() {
    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        onPressed: _setHome,
      ),
      new IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: _decreaseSection,
      ),
      new IconButton(
        icon: const Icon(
          Icons.exposure_neg_1,
          color: Colors.black,
        ),
        onPressed: _reduce,
      ),
      new IconButton(
        icon: const Icon(
          Icons.refresh,
          color: Colors.black,
        ),
        onPressed: _updatePray,
      ),
      new IconButton(
        icon: const Icon(
          Icons.brightness_medium,
          color: Colors.black,
        ),
        onPressed: _switchMode,
      ),

      new IconButton(
        icon: const Icon(
          Icons.exposure_plus_1,
          color: Colors.black,
        ),
        onPressed: _enlarge,
      ),
      new IconButton(
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        onPressed: _increaseSection,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: _buildTitle(context),
        actions: _buildActions(),
      ),
      backgroundColor: mods[mod][0],//const Color(0xEE20283e),
      body: new FutureBuilder<Pray>(
        future: homePresenter.getPray(version, prayid),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
          return snapshot.hasData
              ? new Prays(data,section,mods[mod],s,homePresenter)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void screenUpdate() {
    setState(() {});
  }

  Future _switchMode() async{
    if (mod==0)mod=1;
    else mod=0;
    screenUpdate();
  }

  Future _reduce() async{
    s=s-5;
    screenUpdate();
  }
  Future _enlarge() async{
    s=s+5;
    screenUpdate();
  }
    Future _updatePray() async {

      Random rnd=new Random();
    int next(int min, int max) => min + rnd.nextInt(max - min);

    int min = 1;
    int max = 92;
    prayid =next(min,max);
    section=1;
      screenUpdate();
  }


  Future _updateVersion() async {
    if(version=="KJV")version="ChiUNs";
    else version="KJV";

    screenUpdate();
  }


  Future _setKJV() async {
   version="KJV";
    screenUpdate();
  }

  Future _setHome() async {
    section=1;
    screenUpdate();
  }
  Future _increaseSection() async {
    section++;
    if (section>9)section=9;
    screenUpdate();
  }
  Future _decreaseSection() async {
    section--;
    if (section<1)section=1;
    screenUpdate();
  }
  Future _setChiUns() async {
    version="ChiUNs";
    screenUpdate();
  }
}