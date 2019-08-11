class Pray {

  int id;
  String _ptxt;
  String _pref;
  String _pcmt;

  String _ctxt;
  String _cref;
  String _ccmt;


  String _rtxt;
  String _rref;
  String _rcmt;


  String _ttxt;
  String _tref;
  String _tcmt;

  String _itxt;
  String _iref;
  String _icmt;

  String _atxt;
  String _aref;
  String _acmt;

  String _ntxt;
  String _nref;
  String _ncmt;

  String _ltxt;
  String _lref;
  String _lcmt;
  String _bky;
  String _bnm;

  Pray(this._ptxt, this._pref, this._pcmt,this._ctxt, this._cref, this._ccmt,this._rtxt, this._rref, this._rcmt,this._ttxt, this._tref, this._tcmt,this._itxt, this._iref, this._icmt,this._atxt, this._aref, this._acmt,this._ntxt, this._nref, this._ncmt,this._ltxt, this._lref, this._lcmt,this._bky, this._bnm);
  Pray.map(dynamic obj) {
    this._ptxt = obj["ptxt"];
    this._pref = obj["pref"];
    this._pcmt = obj["pcmt"];
    this._ctxt = obj["ctxt"];
    this._cref = obj["cref"];
    this._ccmt = obj["ccmt"];
    this._rtxt = obj["rtxt"];
    this._rref = obj["rref"];
    this._rcmt = obj["rcmt"];
    this._ttxt = obj["ttxt"];
    this._tref = obj["tref"];
    this._tcmt = obj["tcmt"];
    this._itxt = obj["itxt"];
    this._iref = obj["iref"];
    this._icmt = obj["icmt"];
    this._atxt = obj["atxt"];
    this._aref = obj["aref"];
    this._acmt = obj["acmt"];
    this._ntxt = obj["ntxt"];
    this._nref = obj["nref"];
    this._ncmt = obj["ncmt"];
    this._ltxt = obj["ltxt"];
    this._lref = obj["lref"];
    this._lcmt = obj["lcmt"];
    this._bky = obj["bky"];
    this._bnm = obj["bnm"];
  }

  String get         ptxt =>         _ptxt;
  String get         pref =>         _pref;
  String get         pcmt =>         _pcmt;
  String get         ctxt =>         _ctxt;
  String get         cref =>         _cref;
  String get         ccmt =>         _ccmt;
  String get         rtxt =>         _rtxt;
  String get         rref =>         _rref;
  String get         rcmt =>         _rcmt;
  String get         ttxt =>         _ttxt;
  String get         tref =>         _tref;
  String get         tcmt =>         _tcmt;
  String get         itxt =>         _itxt;
  String get         iref =>         _iref;
  String get         icmt =>         _icmt;
  String get         atxt =>         _atxt;
  String get         aref =>         _aref;
  String get         acmt =>         _acmt;
  String get         ntxt =>         _ntxt;
  String get         nref =>         _nref;
  String get         ncmt =>         _ncmt;
  String get         ltxt =>         _ltxt;
  String get         lref =>         _lref;
  String get         lcmt =>         _lcmt;
  String get         bky =>          _bky;
  String get         bnm =>          _bnm;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["ptxt"]	=	   _ptxt;
    map["pref"]	=	   _pref;
    map["pcmt"]	=	   _pcmt;
    map["ctxt"]	=	   _ctxt;
    map["cref"]	=	   _cref;
    map["ccmt"]	=	   _ccmt;
    map["rtxt"]	=	   _rtxt;
    map["rref"]	=	   _rref;
    map["rcmt"]	=	   _rcmt;
    map["ttxt"]	=	   _ttxt;
    map["tref"]	=	   _tref;
    map["tcmt"]	=	   _tcmt;
    map["itxt"]	=	   _itxt;
    map["iref"]	=	   _iref;
    map["icmt"]	=	   _icmt;
    map["atxt"]	=	   _atxt;
    map["aref"]	=	   _aref;
    map["acmt"]	=	   _acmt;
    map["ntxt"]	=	   _ntxt;
    map["nref"]	=	   _nref;
    map["ncmt"]	=	   _ncmt;
    map["ltxt"]	=	   _ltxt;
    map["lref"]	=	   _lref;
    map["lcmt"]	=	   _lcmt;
    map["bky"]	=	   _bky;
    map["bnm"]	=	   _bnm;
    return map;
  }
  void setPrayId(int id) {
    this.id = id;
  }
}