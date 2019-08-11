import 'dart:math';

import 'package:flutter_app/database/database_hepler.dart';
import 'package:flutter_app/database/model/user.dart';
import 'package:flutter_app/database/model/pray.dart';

import 'dart:async';

abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {
  HomeContract _view;
  var db = new DatabaseHelper();
  HomePresenter(this._view);
  delete(User user) {
    var db = new DatabaseHelper();
    //db.deleteUsers(user);
    updateScreen();
  }

  Future<List<User>> getUser() {
    return db.getUser();
  }


  Future<Pray> getPray(String version, int prayid) {

    return db.getPray(prayid, version);
  }

  updateScreen() {
    _view.screenUpdate();

  }
}
