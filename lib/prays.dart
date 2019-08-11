

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/add_user_dialog.dart';
import 'package:flutter_app/database/model/pray.dart';
import 'package:flutter_app/database/model/step.dart';

import 'package:flutter_app/home_presenter.dart';

class Prays extends StatelessWidget {
  Pray country;
  int section=1;
  List<Color> mod=[];
  double s;
  HomePresenter homePresenter;

  Prays(
      Pray this.country,
      int this.section,
      List<Color> this.mod,
      double this.s,
      HomePresenter this.homePresenter, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Praystep stp=new Praystep(country);
    Map map=stp.toMap();
    return new ListView.builder(
        itemCount: country == null ? 0 : 1,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            color: mod[0],//Color(0xEE20283e),
            child: new Container(
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      /*new CircleAvatar(
                        radius: 30.0,
                        child: new Text(map[section][0]),
                        backgroundColor: const Color(0xFF20283e),
                      ),*/
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                map[section][0].replaceAll("NEWLINE", "\n\n") ,
                                style: new TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.redAccent),
                                textAlign: TextAlign.center
                              ),
                              new Text(
                                map[section][1].replaceAll("NEWLINE", "\n\n") ,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: s,
                                    color: mod[1])//Colors.lightBlueAccent
                              ),
                              new Text(
                                map[section][2],
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: s, color: mod[1]),
                              ),

                              new Text(
                                map[section][4],
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: s, color: mod[1]),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );

        });
  }

  displayRecord() {
    homePresenter.updateScreen();
  }
  edit(Pray user, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddUserDialog().buildAboutDialog(context, this, true, user),
    );
    homePresenter.updateScreen();
  }


}