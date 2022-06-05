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
