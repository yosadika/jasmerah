import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _collectionsList =
        prefs.getStringList('ff_collectionsList') ?? _collectionsList;
    _bebanTegangan =
        prefs.getStringList('ff_bebanTegangan')?.map(double.parse)?.toList() ??
            _bebanTegangan;
    _bebanArus =
        prefs.getStringList('ff_bebanArus')?.map(double.parse)?.toList() ??
            _bebanArus;
  }

  SharedPreferences prefs;

  List<String> _collectionsList = ['users', 'anomali'];
  List<String> get collectionsList => _collectionsList;
  set collectionsList(List<String> _value) {
    _collectionsList = _value;
    prefs.setStringList('ff_collectionsList', _value);
  }

  void addToCollectionsList(String _value) {
    _collectionsList.add(_value);
    prefs.setStringList('ff_collectionsList', _collectionsList);
  }

  void removeFromCollectionsList(String _value) {
    _collectionsList.remove(_value);
    prefs.setStringList('ff_collectionsList', _collectionsList);
  }

  bool booleanHelper = false;

  List<double> _bebanTegangan = [149, 148, 148, 148, 152, 147, 152];
  List<double> get bebanTegangan => _bebanTegangan;
  set bebanTegangan(List<double> _value) {
    _bebanTegangan = _value;
    prefs.setStringList(
        'ff_bebanTegangan', _value.map((x) => x.toString()).toList());
  }

  void addToBebanTegangan(double _value) {
    _bebanTegangan.add(_value);
    prefs.setStringList(
        'ff_bebanTegangan', _bebanTegangan.map((x) => x.toString()).toList());
  }

  void removeFromBebanTegangan(double _value) {
    _bebanTegangan.remove(_value);
    prefs.setStringList(
        'ff_bebanTegangan', _bebanTegangan.map((x) => x.toString()).toList());
  }

  List<double> _bebanArus = [427, 340, 348, 354, 401, 491, 454];
  List<double> get bebanArus => _bebanArus;
  set bebanArus(List<double> _value) {
    _bebanArus = _value;
    prefs.setStringList(
        'ff_bebanArus', _value.map((x) => x.toString()).toList());
  }

  void addToBebanArus(double _value) {
    _bebanArus.add(_value);
    prefs.setStringList(
        'ff_bebanArus', _bebanArus.map((x) => x.toString()).toList());
  }

  void removeFromBebanArus(double _value) {
    _bebanArus.remove(_value);
    prefs.setStringList(
        'ff_bebanArus', _bebanArus.map((x) => x.toString()).toList());
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
